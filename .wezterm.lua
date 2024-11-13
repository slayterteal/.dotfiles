local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- GENERAL
config.use_fancy_tab_bar = false
-- END GENERAL

-- FONTS
config.font = wezterm.font("GeistMono Nerd Font")
-- END FONTS

-- COLORSCHEME
config.color_scheme = "Catppuccin Mocha"
config.colors = {
	tab_bar = {
		-- Inactive tabs are the tabs that do not have focus
		inactive_tab = {
			bg_color = "#181825",
			fg_color = "#808080",

			-- The same options that were listed under the `active_tab` section above
			-- can also be used for `inactive_tab`.
		},
		inactive_tab_hover = {
			bg_color = "#3b3052",
			fg_color = "#909090",
			italic = true,

			-- The same options that were listed under the `active_tab` section above
			-- can also be used for `inactive_tab_hover`.
		},
		background = "#181825",
		active_tab = {
			bg_color = "#1e1e2e",
			fg_color = "#c0c0c0",

			-- Specify whether you want "Half", "Normal" or "Bold" intensity for the
			-- label shown for this tab.
			-- The default is "Normal"
			intensity = "Normal",

			-- Specify whether you want "None", "Single" or "Double" underline for
			-- label shown for this tab.
			-- The default is "None"
			underline = "None",

			-- Specify whether you want the text to be italic (true) or not (false)
			-- for this tab.  The default is false.
			italic = false,

			-- Specify whether you want the text to be rendered with strikethrough (true)
			-- or not for this tab.  The default is false.
			strikethrough = false,
		},
		-- The new tab button that let you create new tabs
		new_tab = {
			bg_color = "#1e1e2e",
			fg_color = "#808080",

			-- The same options that were listed under the `active_tab` section above
			-- can also be used for `new_tab`.
		},

		-- You can configure some alternate styling when the mouse pointer
		-- moves over the new tab button
		new_tab_hover = {
			bg_color = "#3b3052",
			fg_color = "#909090",
			italic = true,

			-- The same options that were listed under the `active_tab` section above
			-- can also be used for `new_tab_hover`.
		},
	},
}
-- END COLORSCHEME

return config
