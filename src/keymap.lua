-- default keys: https://wezfurlong.org/wezterm/config/default-keys.html

local wezterm = require "wezterm"

-- This is the module table that we will export
local module = {}

local act = wezterm.action
local keymap = {
  { key = "L", mods = "CTRL|SHIFT", action = act.ShowDebugOverlay },
  { key = "P", mods = "CTRL|SHIFT", action = act.ActivateCommandPalette, },
  { key = "Enter", mods = "ALT", action = act.ToggleFullScreen, },
  { key = "N", mods = "CTRL|SHIFT", action = act.SpawnWindow, },
  { key = "X", mods = "CTRL|SHIFT", action = act.ActivateCopyMode, },
  { key = "F", mods = "CTRL|SHIFT", action = act.Search { CaseInSensitiveString = "" }, },
  { key = "W", mods = "CTRL|SHIFT", action = act.CloseCurrentTab{ confirm=true }, },
  { key = "C", mods = "CTRL|SHIFT", action = act { CopyTo = "Clipboard" }, },
  { key = "V", mods = "CTRL|SHIFT", action = act { PasteFrom = "Clipboard" }, },
  { key = "0", mods = "CTRL", action = act.ResetFontSize, },
  { key = "-", mods = "CTRL", action = act.DecreaseFontSize, },
  { key = "+", mods = "CTRL", action = act.IncreaseFontSize, },
  { key = "=", mods = "CTRL", action = act.IncreaseFontSize, },
  { key = "PageUp", mods = "SHIFT", action = act { ScrollByPage = -1 }, },
  { key = "PageDown", mods = "SHIFT", action = act { ScrollByPage = 1 }, },
}

function module.apply_to_config(config)
  config.disable_default_key_bindings = true
  config.keys = keymap
end

return module
