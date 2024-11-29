-- Pull in the wezterm API.
local wezterm = require "wezterm"

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

config.default_prog = { "nu", "-l" }

-- config.color_scheme = "Tomorrow Night"
config.colors = require "src.colors"

config.keys = require "src.keymap"

local window_mod = require "src.window"
window_mod.apply_to_config(config)

local font_mod = require "src.font"
font_mod.apply_to_config(config)

-- and finally, return the configuration to wezterm
return config
