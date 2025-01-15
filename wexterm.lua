local wezterm = require "wezterm"
local config = wezterm.config_builder()


-- Colors
local black         = "#000000"
local blue          = "#0066ff"
local cyan          = "#00ffff"
local green         = "#33ff00"
local grey_light    = "#d0d0d0"
local grey_dark     = "#353535"
local magenta       = "#cc00ff"
local red           = "#fe0100"
local white         = "#ffffff"
local yellow        = "#feff00"

config.colors = {
    -- The default text color
    foreground = white,
    -- The default background color
    background = black,

    -- Overrides the cell background color when the current cell is occupied by the
    -- cursor and the cursor style is set to Block
    cursor_bg = green,
    -- Overrides the text color when the current cell is occupied by the cursor
    cursor_fg = black,
    -- Specifies the border color of the cursor when the cursor style is set to Block,
    -- or the color of the vertical or horizontal bar when the cursor style is set to
    -- Bar or Underline.
    cursor_border = green,

    -- the foreground color of selected text
    selection_fg = black,
    -- the background color of selected text
    selection_bg = green,

    -- The color of the scrollbar "thumb"; the portion that represents the current viewport
    scrollbar_thumb = "#222222",

    -- The color of the split lines between panes
    split = grey_light,

    ansi = {
        black,
        red,
        green,
        yellow,
        blue,
        magenta,
        cyan,
        grey_light,
    },
    brights = {
        grey_dark,
        red,
        green,
        yellow,
        blue,
        magenta,
        cyan,
        white,
    }
}


-- Padding
config.window_padding = {
    left = 5,
    right = 5,
    top = 0,
    bottom = 0,
}


-- Borders
config.window_frame = {
    border_left_width = "0.1cell",
    border_right_width = "0.1cell",
    border_bottom_height = "0.05cell",
    border_left_color = grey_dark,
    border_right_color = grey_dark,
    border_bottom_color = grey_dark
}


-- Tabs
config.hide_tab_bar_if_only_one_tab = true


-- Window decorations
config.enable_wayland = false


-- Initial size
config.initial_rows = 26
config.initial_cols = 100


-- Key bindings
--config.disable_default_key_bindings = true
local act = wezterm.action
config.keys = {

    -- Split and close panes (included support for keyboards with US layout)
    { key = ";", mods = "ALT|SHIFT", action = act.SplitVertical({ domain = "CurrentPaneDomain" })},
    { key = "<", mods = "ALT|SHIFT", action = act.SplitVertical({ domain = "CurrentPaneDomain" })},
    { key = ":", mods = "ALT|SHIFT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" })},
    { key = ">", mods = "ALT|SHIFT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" })},
    { key = "D", mods = "ALT|SHIFT", action = act.CloseCurrentPane({ confirm = true })},

    -- Directional activate panes
    { key = "LeftArrow", mods = "ALT|SHIFT", action = act.ActivatePaneDirection("Left")},
    { key = "RightArrow", mods = "ALT|SHIFT", action = act.ActivatePaneDirection("Right")},
    { key = "UpArrow", mods = "ALT|SHIFT", action = act.ActivatePaneDirection("Up")},
    { key = "DownArrow", mods = "ALT|SHIFT", action = act.ActivatePaneDirection("Down")},

    -- Enter resize pane mode
    { key = "r", mods = "ALT|SHIFT", action = act.ActivateKeyTable {name = "resize_pane", one_shot = false,},},

}

config.key_tables = {
    -- Resize pane mode:
    --   Since we"re likely to want to make multiple adjustments,
    --   we made the activation one_shot=false. We therefore need
    --   to define a key assignment for getting out of this mode.
    --   "resize_pane" here corresponds to the name="resize_pane" in
    --   the key assignments above.
    resize_pane = {
      { key = "LeftArrow", action = act.AdjustPaneSize({ "Left", 1 }) },  
      { key = "RightArrow", action = act.AdjustPaneSize({ "Right", 1 })},  
      { key = "UpArrow", action = act.AdjustPaneSize({ "Up", 1 }) },  
      { key = "DownArrow", action = act.AdjustPaneSize({ "Down", 1 }) },

      -- Cancel the mode by pressing escape or enter
      { key = "Escape", action = "PopKeyTable" },
      { key = "Enter", action = "PopKeyTable" },
    }
}



return config