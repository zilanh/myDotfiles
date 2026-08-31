-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
hl.on("hyprland.start", function()
	hl.exec_cmd("systemctl --user start hyprland-session.target")
	hl.exec_cmd("nm-applet")
	-- hl.exec_cmd("bluetui")
	hl.exec_cmd("hypridle")
	hl.exec_cmd("waybar & hyprpaper")
	hl.exec_cmd("firefox")
	hl.exec_cmd("wl-paste --type text --watch cliphist store")
	hl.exec_cmd("wl-paste --type image --watch cliphist store")
	hl.exec_cmd("udiskie &")

	hl.window_rule({
		-- name = "terminal-WS1",
		match = {
			class = "firefox",
		},
		workspace = "1",
	})
end)

hl.on("hyprland.shutdown", function()
	os.execute("systemctl --user stop hyprland-session.target && sleep 0.1")
	-- uses a blocking exec function and sleeps a bit to give things time to close
	-- you might also want to kill troublesome/crashing non-systemd background services here:
	-- os.execute("pkill wallpaperthing; systemctl --user stop hyprland-session.target && sleep 0.1")
end)
