---------------------
local terminal = "foot"
local fileManager = "$HOME/.config/hypr/scripts/yazi-term"
local browser = "firefox"

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

local monitorOff = false
local function test()
	hl.exec_cmd("notify-send 'Test'")
end

---- KEYBINDINGS ----
---------------------

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. "+ Return", hl.dsp.exec_cmd(terminal))
-- local closeWindowBind = hl.bind(mainMod .. " + C", hl.dsp.window.close)
-- closeWindowBind:set_enabled(true)

hl.bind(mainMod .. " + W", hl.dsp.window.close())
-- hl.bind(
-- 	mainMod .. " + M",
-- 	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
-- )

hl.bind("switch:on:Lid Switch", function()
	if not monitorOff then
		hl.exec_cmd("pidof hyprlock || hyprlock --no-fade-in")
	end
end, { locked = true })

hl.bind("switch:off:Lid Switch", hl.dsp.exec_cmd("notify-send 'yoooo welcome back'"), { locked = true })
hl.bind(mainMod .. " + M", hl.dsp.submap("menu"))
hl.define_submap("menu", function()
	hl.bind("escape", hl.dsp.submap("reset"))
	hl.bind("B", function()
		hl.dispatch(hl.dsp.exec_cmd("foot -e bluetui"))
		hl.dispatch(hl.dsp.submap("reset"))
	end)
	hl.bind("S", function()
		hl.dispatch(hl.dsp.exec_cmd("foot wiremix --tab output"))
		hl.dispatch(hl.dsp.submap("reset"))
	end)
	hl.bind("W", function()
		hl.dispatch(hl.dsp.exec_cmd("networkmanager_dmenu"))
		hl.dispatch(hl.dsp.submap("reset"))
	end)
	hl.bind("L", function()
		hl.dispatch(hl.dsp.exec_cmd("hyprlock"))
		hl.dispatch(hl.dsp.submap("reset"))
	end)
	hl.bind("T", function()
		hl.dispatch(
			hl.dsp.exec_cmd("matugen image $HOME/Pictures/Wallpapers/$(ls $HOME/Pictures/Wallpapers/ | rofi -dmenu)")
		)
		hl.dispatch(hl.dsp.submap("reset"))
	end)
end)

hl.bind(mainMod .. " + F1", function()
	local game_mode = (hl.get_config("animations.enabled") == false)

	if game_mode then
		hl.exec_cmd("hyprctl reload")
		return
	end
	hl.config({
		general = {
			gaps_in = 0,
			gaps_out = 0, -- Disable gaps
			border_size = 1,
		},
		animations = {
			enabled = false, -- Disable animations
		},
		-- Disable blur, shadow and window rounding
		decoration = {
			shadow = { enabled = false },
			blur = { enabled = false },
			rounding = 0,
		},
	})
end, { locked = true })

hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("foot -D $HOME/Documents/Notes  nvim"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + T", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(
	mainMod .. " + Space",
	hl.dsp.exec_cmd("pkill rofi || rofi -show combi -modes combi -combi-modes 'window,drun'")
)
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd("pkill rofi || rofi -show recursivebrowser"))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
-- hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit")) -- dwindle only
hl.bind(mainMod .. " + F2", hl.dsp.exec_cmd("pkill waybar || waybar"))
hl.bind(mainMod .. " + ISO_Level3_Shift", hl.dsp.exec_cmd("hyprctl switchxkblayout all next"))
hl.bind(
	mainMod .. " + V",
	hl.dsp.exec_cmd("cliphist list | rofi -dmenu -display-columns 2 | cliphist decode | wl-copy")
)

-- Screenshots
local notifyScreenshot = "notify-send -t 1000 'Screenshot taken'"
local saveLocation = "$HOME/Pictures/Screenshots/$(date +'%Y-%m-%d_%H-%M-%S').png"
hl.bind("Print", hl.dsp.exec_cmd("grim - | tee " .. saveLocation .. " | wl-copy && " .. notifyScreenshot))
hl.bind(
	"SHIFT + Print",
	hl.dsp.exec_cmd('grim -g "$(slurp -d)" - | tee ' .. saveLocation .. " | wl-copy && " .. notifyScreenshot)
)
-- hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd("grim - | tee " .. saveLocation .. " | wl-copy"))
-- hl.bind(
-- 	mainMod .. " + SHIFT + Print",
-- 	hl.dsp.exec_cmd('grim -g "$(slurp -d)" - | tee ' .. saveLocation .. " | wl-copy")
-- )

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))

local sizeChange = 150

hl.bind(
	mainMod .. " + CONTROL + H",
	hl.dsp.window.resize({ x = -sizeChange, y = 0, relative = true }),
	{ repeating = true }
)
hl.bind(
	mainMod .. " + CONTROL + L",
	hl.dsp.window.resize({ x = sizeChange, y = 0, relative = true }),
	{ repeating = true }
)
hl.bind(
	mainMod .. " + CONTROL + K",
	hl.dsp.window.resize({ x = 0, y = -sizeChange, relative = true }),
	{ repeating = true }
)
hl.bind(
	mainMod .. " + CONTROL + J",
	hl.dsp.window.resize({ x = 0, y = sizeChange, relative = true }),
	{ repeating = true }
)

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
-- hl.bind(
-- 	"XF86AudioRaiseVolume",
-- 	hl.dsp.exec_cmd("~/.config/hypr/scripts/volume --inc"),
-- 	-- hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
-- 	{ locked = true, repeating = true }
-- )
-- hl.bind(
-- 	"XF86AudioLowerVolume",
-- 	-- hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
-- 	hl.dsp.exec_cmd("~/.config/hypr/scripts/volume --dec"),
-- 	{ locked = true, repeating = true }
-- )
-- hl.bind(
-- 	"XF86AudioMute",
-- 	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
-- 	{ locked = true, repeating = true }
-- )
-- hl.bind(
-- 	"XF86AudioMicMute",
-- 	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
-- 	{ locked = true, repeating = true }
-- )
-- hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
-- hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("$HOME/.config/hypr/scripts/volume --inc"),
	{ locked = false, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("$HOME/.config/hypr/scripts/volume --dec"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("$HOME/.config/hypr/scripts/volume --toggle-mic"),
	{ locked = true, repeating = true }
)
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("$HOME/.config/hypr/scripts/volume --toggle"), { locked = true })

-- Screen brightness
hl.bind("XF86Display", function()
	if not monitorOff then
		hl.exec_cmd("wlopm --off eDP-1")
		monitorOff = true
	else
		hl.exec_cmd("wlopm --on eDP-1")
		monitorOff = false
	end
end)

-- hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("~/.config/hypr/scripts/backlight --inc"), { locked = true })
hl.bind("XF86MonBrightnessUp", function()
	if monitorOff then
		hl.exec_cmd("wlopm --on eDP-1")
		monitorOff = false
	else
		hl.exec_cmd("~/.config/hypr/scripts/backlight --inc")
	end
end, { locked = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("~/.config/hypr/scripts/backlight --dec"), { locked = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
