-- Pull in the wezterm API
local wezterm = require 'wezterm'

wezterm.on("gui-startup", function(cmd)
   local tab, pane, window = wezterm.mux.spawn_window(cmd or {
      position = { x = 800, y = 400, },
   })
end)

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.default_prog = { 'nu', '-l' }

config.color_scheme = 'Tomorrow Night'
config.enable_tab_bar = false

config.window_close_confirmation = 'NeverPrompt'
config.window_decorations = "RESIZE"
config.initial_rows = 36
config.initial_cols = 110
config.window_padding = {
  left = '1.5cell',
  right = '1.5cell',
  top = '0.8cell',
  bottom = '0.2cell',
}

local font_normal = wezterm.font_with_fallback {
  {family="Cascadia Mono", weight="Regular"},
  { family = "Symbols Nerd Font Mono", scale = 0.95 },
--   {family="Cousine Nerd Font"},
  {family="Sarasa Mono SC", weight="DemiBold"},
}
local font_italic = wezterm.font_with_fallback {
  {family="Cascadia Mono", weight="Regular", italic=true},
  { family = "Symbols Nerd Font Mono", scale = 0.95 },
--   {family="Cousine Nerd Font"},
  {family="Sarasa Mono SC", weight="DemiBold", italic=true},
}
config.font_size = 11.0
config.font = font_normal
config.allow_square_glyphs_to_overflow_width = "Always"

config.font_rules = {
  -- For Bold-but-not-italic text, use this relatively bold font, and override
  -- its color to a tomato-red color to make bold text really stand out.
  {
    intensity = 'Bold',
    italic = false,
    font = font_normal
  },

  -- Bold-and-italic
  {
    intensity = 'Bold',
    italic = true,
    font = font_italic
  },

  -- normal-intensity-and-italic
  {
    intensity = 'Normal',
    italic = true,
    font = font_italic
  },

  -- half-intensity-and-italic (half-bright or dim)
  {
    intensity = 'Half',
    italic = true,
    font = font_italic
  },

  -- half-intensity-and-not-italic
  {
    intensity = 'Half',
    italic = false,
    font = font_normal
  },
}


config.keys = {
  {
    key = 'PageUp',
    mods = 'CTRL',
    action = wezterm.action.DisableDefaultAssignment,
  },
  {
    key = 'PageDown',
    mods = 'CTRL',
    action = wezterm.action.DisableDefaultAssignment,
  },
  {
    key = 'PageUp',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.DisableDefaultAssignment,
  },
  {
    key = 'PageDown',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.DisableDefaultAssignment,
  },
}

-- and finally, return the configuration to wezterm
return config
