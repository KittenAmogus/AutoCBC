local conf = require("config")
local wired = require("wired")
local wireless = require("wireless")

local function main()
	-- Open wired modem
	wired.findWired(wired)
	wired.openModem(wired.modem)
	print(("Opened wired modem on '%04X'"):format(conf.CHANNEL_WIRED_BASE + conf.TOWER_ID))

	-- Open wireless modem
	wireless.findWireless(wireless)
	wireless.openModem(wireless.modem)
	print(("Opened wireless modem on '%04X'"):format(conf.CHANNEL_WIRELESS_BASE + conf.TOWER_ID))

	return 0
end

-- Run main()
local code, err = pcall(main)

if not code then
	error(("Main() error : '%s'"):format(tostring(err)))
end

return code
