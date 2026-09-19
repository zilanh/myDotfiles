------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
  output = "desc:AU Optronics 0xFA9B",
  mode = "1920x1200@60",
  position = "0x0",
  scale = 1,
})

hl.monitor({
  output = "desc:LG Display 0x0590",
  mode = "preferred",
  position = "0x0",
  scale = 1,
})

hl.monitor({
  output = "desc:XGM XGIMI TV 0x00000001",
  mode = "1920x1080@60",
  supports_hdr = 1,
  -- mirror = "eDP-1",
  position = "auto",
  scale = 1,
})

hl.monitor({
  output = "",
  mode = "preferred",
  -- mode = "auto",
  -- supports_hdr = 1,
  mirror = "eDP-1",
  position = "auto",
  scale = 1,
})

-- hl.monitor({
-- 	output = "",
-- 	mode = "preferred",
-- 	position = "auto",
-- 	mirror = "AU Optronics 0xFA9B",
-- 	scale = "1",
-- })
