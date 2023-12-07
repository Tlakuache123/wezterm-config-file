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
config.color_scheme = "Tokyo Night"
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.95
-- Tab settings
config.use_fancy_tab_bar = false
config.tab_max_width = 12
config.tab_bar_at_bottom = true

config.launch_menu = launch_menu

return config
