-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.font = wezterm.font 'CaskaydiaMono Nerd Font Mono'
config.font_size = 14

config.enable_tab_bar = false

config.color_scheme = "Catppuccin Mocha"

config.window_decorations = "RESIZE"
config.window_background_opacity = 0.85
config.macos_window_background_blur = 10

config.keys = {
  -- This will create a new split and run your default program inside it
  {
    key = 'd',
    mods = 'CMD|SHIFT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'w',
    mods = 'CMD',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
}


-- and finally, return the configuration to wezterm
return config