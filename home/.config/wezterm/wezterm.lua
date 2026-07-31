local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- appearance
config.color_scheme = "rose-pine-moon"
config.colors = {
  background = "#000000",
}
config.font = wezterm.font("Hack Nerd Font", { weight = "Regular" })
config.font_size = 13.0
config.window_decorations = "RESIZE"
config.enable_tab_bar = true  -- common when you use tmux for tabs/panes
config.window_decorations = "RESIZE"
config.window_frame = {
			font = wezterm.font("Hack Nerd Font", { weight = "Bold" }),			}
config.window_background_opacity = 1.0
config.macos_window_background_blur = 0

-- keybindings
config.keys = {
  { key = "f", mods = "CTRL|CMD", action = wezterm.action.ToggleFullScreen },
}

return config
