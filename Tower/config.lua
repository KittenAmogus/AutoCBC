local CONFIG = {}

setmetatable(CONFIG, {
	__newindex = function(_, key, _)
		error(("Attempt to change constant '%s' in config"):format(tostring(key)))
	end,

	__index = {
		TOWER_ID = 0, -- Don't mix channels with other towers
		POS = { 0, 0, 0 }, -- Current tower's modem XYZ

		-- Sides
		SIDE_MODEM_WIRED = nil, -- Base network
		SIDE_MODEM_WIRELESS = nil, -- Signals

		-- Response on channels, channel = (CHANNEL_* + TOWER_ID)
		CHANNEL_WIRELESS_BASE = 0x8000, -- Listen for signals
		CHANNEL_WIRED_BASE = 0x8100, -- Commands, data

		MIN_DIST = 20, -- Don't report signals where DIST < MIN_DIST
		MAX_DIST = 400, -- Don't report signals where DIST > MAX_DIST
	},
})

return CONFIG
