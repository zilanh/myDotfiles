-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
	general = {
		gaps_in = 2,
		gaps_out = 3,

		border_size = 1,

		col = {
			-- active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
			active_border = "rgb(eead85)",
			inactive_border = "rgba(595959aa)",
		},

		-- Set to true to enable resizing windows by clicking and dragging on borders and gaps
		resize_on_border = false,

		-- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
		allow_tearing = false,

		layout = "dwindle",
	},

	decoration = {
		rounding = 10,
		rounding_power = 3,

		-- Change transparency of focused and unfocused windows
		active_opacity = 1,
		inactive_opacity = 0.9,

		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			-- color = "rgba(1a1a1aee)",
			color = "rgba(1a1a1aee)",
		},

		blur = {
			enabled = true,
			ignore_opacity = true,
			size = 8,
			passes = 2,
			-- vibrancy = 0.1696,
			vibrancy = 0.1696,
		},
	},

	animations = {
		enabled = true,
	},
})
