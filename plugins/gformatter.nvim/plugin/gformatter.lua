-- Guard clause to prevent loading if neovim is old
if vim.fn.has("nvim-0.8") == 0 then
    return
end

-- Create a global user command :GreetMe
vim.api.nvim_create_user_command("GreetMe", function()
    -- Safely require the main module and run the function
    require("gformatter").say_hello()
end, {})

vim.api.nvim_create_user_command("AddCommentBlock", function()
    -- Safely require the main module and run the function
    require("gformatter").add_comment_block()
end, {})

-- TODO: This keymap should be something handled
--       when setup is called (i.e. not hardcoded)
-- Add a handy keymap to add a command block
vim.keymap.set(
  { 'n', 'v', 'i', 'x', 'o' }, -- Command is available in all modes
  '<C-/>',
  '<cmd>AddCommentBlock<CR>',
  { desc = 'Add gComment Block' }
)

-- TODO
--  Need a way to allow setting a keymap for this command.
--      Should there be a default?
--  Implement comment block
--      This work in both normal and visual mode
--      This would involve:
--          1. Grabbing the current line, highlighted text.
--          2. Wrapping the text with the comment block
--          3. Exiting into normal mode?
