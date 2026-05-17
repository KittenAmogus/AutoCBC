local conf = require("config")

local MODULE = {
	modem = nil,
}

local function validateModem(modem)
	assert(modem ~= nil, "Modem is nil")

	local modemType = peripheral.getType(modem)
	assert(modemType == "modem", ("Modem is actually '%s'"):format(modemType))
	assert(modem.isWireless(), "Modem isn't wireless")
end

function MODULE.findWireless(module)
	local mod

	if conf.SIDE_MODEM_WIRELESS == nil then
		mod = peripheral.find("modem", function(name, peripheral)
			return peripheral.isWireless()
		end)
	else
		mod = peripheral.wrap(conf.SIDE_MODEM_WIRELESS)
	end

	module.modem = mod
	return mod
end

function MODULE.openModem(modem)
	validateModem(modem)
	local channel = conf.CHANNEL_WIRED_BASE + conf.TOWER_ID
	modem.open(channel)
	assert(modem.isOpen(channel), ("Cannot open modem on %04X"):format(channel))
end

MODULE.validateModem = validateModem

return MODULE
