local wezterm = require "wezterm"

-- This is the module table that we will export
local module = {}

wezterm.on("gui-startup", function(cmd)
  local tab, pane, window = wezterm.mux.spawn_window(cmd or {
    position = { x = 800, y = 400, },
  })
end)

function module.apply_to_config(config)
  config.enable_tab_bar = false
  config.window_close_confirmation = "NeverPrompt"
  config.window_decorations = "RESIZE"
  config.initial_rows = 38
  config.initial_cols = 116
  config.window_padding = {
    left = "1.5cell",
    right = "1.5cell",
    top = "0.8cell",
    bottom = "0.2cell",
  }
end

-- return our module table
return module
