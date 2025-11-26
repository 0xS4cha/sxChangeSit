Citizen.CreateThread(function()
	local init_starting <const> = GetGameTimer()
	local init_time
	for i = 1, #_CONFIG.Keys do
		local key = _CONFIG.Keys[i]
		Keys.Register({
			name = ('key_sit_%i'):format(i),
			description = GetPhrase(key.label),
			defaultKey = key.keyId,
			onPressed = function()
				local pPed = PlayerPedId()
				local pVeh = GetVehiclePedIsIn(pPed, false)
				if pVeh == 0 then return end
				
				local currentSpeed = GetEntitySpeed(pVeh) * 3.6 
				local speedLimit = key.speedLimit or 150 
				if currentSpeed > speedLimit then return end
				
				if (IsVehicleSeatFree(pVeh, key.sitIndex) and (_CONFIG.BlockDriver and GetPedInVehicleSeat(pVeh, -1) ~= pPed)) then
					SetPedIntoVehicle(pPed, pVeh, key.sitIndex)
				end
			end
		})
	end
	init_time = GetGameTimer() - init_starting
	Logger:trace('sxChangesit', ("init in %sms"):format(init_time))
end)