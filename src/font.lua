local wezterm = require 'wezterm'

-- This is the module table that we will export
local module = {}

local font_normal = wezterm.font_with_fallback {
  { family = "Cascadia Mono",          weight = "Regular" },
  { family = "Symbols Nerd Font Mono", scale = 0.95 },
  -- { family = "Cousine Nerd Font" },
  { family = "Sarasa Mono SC",         weight = "DemiBold" },
}
local font_italic = wezterm.font_with_fallback {
  { family = "Cascadia Mono",          weight = "Regular",  italic = true },
  { family = "Symbols Nerd Font Mono", scale = 0.95 },
  -- { family = "Cousine Nerd Font" },
  { family = "Sarasa Mono SC",         weight = "DemiBold", italic = true },
}

-- define a function in the module table.
-- Only functions defined in `module` will be exported to
-- code that imports this module.
-- The suggested convention for making modules that update
-- the config is for them to export an `apply_to_config`
-- function that accepts the config object, like this:
function module.apply_to_config(config)
  config.font_size = 11.0
  config.font = font_normal
  config.allow_square_glyphs_to_overflow_width = "Always"
  config.font_rules = {
    -- For Bold-but-not-italic text, use this relatively bold font, and override
    -- its color to a tomato-red color to make bold text really stand out.
    { intensity = 'Bold', italic = false, font = font_normal },
    -- Bold-and-italic
    { intensity = 'Bold', italic = true, font = font_italic },
    -- normal-intensity-and-italic
    { intensity = 'Normal', italic = true, font = font_italic },
    -- half-intensity-and-italic (half-bright or dim)
    { intensity = 'Half', italic = true, font = font_italic },
    -- half-intensity-and-not-italic
    { intensity = 'Half', italic = false, font = font_normal },
  }
end

-- return our module table
return module
