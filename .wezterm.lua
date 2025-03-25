-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

local act = wezterm.action

-- Apply configuration choices
config.color_scheme = "Banana Blueberry"
config.use_fancy_tab_bar = true
config.initial_cols = 120
config.initial_rows = 34

-- Configure keybindings for pane management
config.keys = {
	-- Split pane horizontally (⌘ + D)
	{
		key = "d",
		mods = "CMD|SHIFT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	-- Split pane vertically (⌘ + D, with size adjustment)
	{
		key = "d",
		mods = "CMD",
		action = wezterm.action.SplitPane({
			direction = "Down",
			size = { Percent = 20 },
		}),
	},
	{
		key = "LeftArrow",
		mods = "CMD|ALT",
		action = act.AdjustPaneSize({ "Left", 2 }),
	},
	{
		key = "DownArrow",
		mods = "CMD|ALT",
		action = act.AdjustPaneSize({ "Down", 2 }),
	},
	{ key = "UpArrow", mods = "CMD|ALT", action = act.AdjustPaneSize({ "Up", 2 }) },
	{
		key = "RightArrow",
		mods = "CMD|ALT",
		action = act.AdjustPaneSize({ "Right", 2 }),
	},
	-- Close the current pane (⌘ + X) - No Shift needed
	{
		key = "x",
		mods = "CMD",
		action = wezterm.action.CloseCurrentPane({ confirm = false }), -- Set to true if you want a confirmation
	},
	-- Move focus between panes using ⌘ + Arrow Keys
	{
		key = "LeftArrow",
		mods = "CMD",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "RightArrow",
		mods = "CMD",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		key = "UpArrow",
		mods = "CMD",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "DownArrow",
		mods = "CMD",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
}

-- Return the configuration
return config
