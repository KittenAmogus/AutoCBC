local conf = require("config")

local function main()
	return 0
end

-- Run main()
local code, err = pcall(main)

if not code then
	error(("Main() error : '%s'"):format(tostring(err)))
end

return code
