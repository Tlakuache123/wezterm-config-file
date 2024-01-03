local wezterm = require("wezterm")
local config = {}
local launch_menu = {}

config.default_prog = { "pwsh.exe", "-NoLogo" }

table.insert(launch_menu, {
	label = "PowerShell",
	args = { "powershell.exe", "-NoLogo" },
})
table.insert(launch_menu, {
	label = "Pwsh",
	args = { "pwsh.exe", "-NoLogo" },
})

config.font = wezterm.font("JetBrains Mono")
config.color_scheme = "Catppuccin Mocha"
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.65
config.win32_system_backdrop = "Acrylic"
-- config.window_decorations = "RESIZE"
config.integrated_title_buttons = {}
-- Tab settings
config.use_fancy_tab_bar = false
config.tab_max_width = 12
config.tab_bar_at_bottom = true
-- Tab style

config.colors = {
	tab_bar = {
		background = "#232634",
	},
}

local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_left_hard_divider
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider

function tab_title(tab_info)
	local title = tab_info.tab_title
	-- if the tab title is explicitly set, take that
	if title and #title > 0 then
		return title
	end
	-- Otherwise, use the title from the active pane
	-- in that tab
	return tab_info.active_pane.title
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local edge_background = "#303446"
	local background = "#303446"
	local foreground = "#C6D0F5"

	if tab.is_active then
		background = "#EA999C"
		foreground = "#303446"
	elseif hover then
		background = "#414559"
		foreground = "#EA999C"
	end

	local edge_foreground = background
	local title = tab_title(tab)
	title = wezterm.truncate_right(title, max_width - 2)
	return {
		{ Background = { Color = edge_foreground } },
		{ Foreground = { Color = edge_background } },
		{ Text = " " },
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = title },
		{ Background = { Color = edge_foreground } },
		{ Foreground = { Color = edge_background } },
		{ Text = " " },
	}
end)

config.launch_menu = launch_menu

return config
