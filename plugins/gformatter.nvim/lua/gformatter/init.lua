local M = {}
local BORDER_COL = 61

-- Local Procedures ---

local function get_indent(line)
  return line:match('^%s*') or ''
end

-- Get the line range currently selected
local function get_line_range()
  local mode = vim.fn.mode()
  if mode == 'v' or mode == 'V' or mode == '\22' then
    vim.cmd('normal! \27')
    return vim.fn.line("'<"), vim.fn.line("'>")
  else
    local row = vim.api.nvim_win_get_cursor(0)[1]
    return row, row
  end
end

-- Word-wraps `content` so that `indent .. <wrapped line>` never exceeds
-- `max_col` *display* columns (tabs expand per 'tabstop', not 1-per-char).
local function wrap_content(content, indent, max_col)
  local indent_w = vim.fn.strdisplaywidth(indent)
  local available = math.max(max_col - indent_w, 1)

  if vim.fn.strdisplaywidth(content) <= available then
    return { indent .. content }
  end

  local out, current, current_w = {}, {}, 0
  for word in content:gmatch('%S+') do
    local w = vim.fn.strdisplaywidth(word)
    local sep = #current > 0 and 1 or 0
    if current_w + sep + w > available and #current > 0 then
      table.insert(out, indent .. table.concat(current, ' '))
      current, current_w, sep = {}, 0, 0
    end
    table.insert(current, word)
    current_w = current_w + sep + w
  end
  if #current > 0 then
    table.insert(out, indent .. table.concat(current, ' '))
  end
  return out
end

-- AddEditCommendBlock
-- Adds a comment block to the current line or selected lines (visal mode)
-- will edit and existing comment block and containing text to properly
-- fit within the correct bounds
function M.add_comment_block()
  local start_line, end_line = get_line_range()
  local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)

  -- Reflow each line independently, each keeping its own indent.
  local new_lines = {}
  for _, line in ipairs(lines) do
    local indent = get_indent(line)
    local content = line:sub(#indent + 1)
    if content == '' then
      table.insert(new_lines, line)
    else
      for _, wrapped in ipairs(wrap_content(content, indent, BORDER_COL)) do
        table.insert(new_lines, wrapped)
      end
    end
  end

  -- Border always spans exactly to BORDER_COL, using the first line's
  -- indent (tab-aware width, not byte count).
  local border_indent = get_indent(lines[1] or '')
  local indent_w = vim.fn.strdisplaywidth(border_indent)
  local dash_count  = math.max(BORDER_COL - indent_w - 2, 1)
  local top_line    = border_indent .. '/*' .. string.rep('-', dash_count)
  local bottom_line = border_indent .. string.rep('-', dash_count) .. '*/'

  -- Add the comment block w/ wrapped text
  vim.api.nvim_buf_set_lines(0, start_line - 1, end_line, false, new_lines)
  local new_end = start_line - 1 + #new_lines
  vim.api.nvim_buf_set_lines(0, new_end, new_end, false, { bottom_line })
  vim.api.nvim_buf_set_lines(0, start_line - 1, start_line - 1, false, { top_line })
end

return M
