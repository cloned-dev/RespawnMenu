Config = {}

Config.spawnpoint = {
	vector3(-2044.3283691406,-1031.8990478516,11.98072052002)
}


RMenu.Add("RESPAWN", "main", RageUI.CreateMenu("Spawn Menu", "~r~Infinite Spawn Menu", 1350, 50, "stream", "adminmenu"))
RageUI.CreateWhile(1.0, RMenu:Get("RESPAWN", "main"),nil,function()
	RageUI.IsVisible(RMenu:Get("RESPAWN", "main"),true,true,true, function()
        RageUI.Button("St Thomas Hospital", "A hospital spawn in ~r~City", { RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
			if Selected then
		
                SetEntityCoords(PlayerPedId(), 361.84051513672,-593.13464355469,28.664552688599)
				msg("Spawned in at St Thomas Hospital! ^3Good Luck and have Fun!")
            end
        end)
        RageUI.Button("You Tool", "The greenzone next to ~r~Rebel & Heroin", { RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
			if Selected then
		
                SetEntityCoords(PlayerPedId(), 2750.2973632813,3470.5307617188,55.698265075684)
				msg("Spawned in at You Tool! ^3Good Luck and have Fun!")

            end
		end)
		RageUI.Button("GEE", "The gun dealer next to ~r~Smultery", { RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
			if Selected then
			
                SetEntityCoords(PlayerPedId(), 1541.11328125,-2146.8479003906,77.475555419922)
				msg("Spawned in at GEE! ^3Good Luck and have Fun!")
            end
		end)
		--RageUI.Button("Diamond Casino", "The spawner next to ~r~Casino", { RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
			--if Selected then
               -- SetEntityCoords(PlayerPedId(), 921.66577148438,48.293949127197,80.898010253906)
            --end
		--end
		RageUI.Button("Eastern Motel", "Spawn next to ~r~'Adandoned Redzone'", { RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
			if Selected then
		
                SetEntityCoords(PlayerPedId(), 358.10925292969,2623.1472167969,44.678703308105)
				msg("Spawned in at Eastern Motel! ^3Good Luck and have Fun!")
        	end
		end)
		RageUI.Button("Sandy Hospital", "A hospital in ~r~Sandy~w~ where you can heal health etc.", { RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
			if Selected then
		
                SetEntityCoords(PlayerPedId(), 1839.7781982422,3672.0986328125,34.276706695557)
				msg("Spawned in at Sandy Hospital! ^3Good Luck and have Fun!")

            end
		end)
		RageUI.Button("Mission Row PD", "A teleport to the PD in city ~r~(Used for Police)", { RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
			if Selected then

                SetEntityCoords(PlayerPedId(), 428.19479370117,-981.58215332031,30.710285186768)
				msg("Spawned in at Mission Row PD! ^3Good Luck and have Fun!")
        	end
		end)
		RageUI.Button("Vapid Airfield ~r~(Helicopter Spawn)", "A location where you can buy / spawn a '~r~Buzzard~w~'", { RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
			if Selected then

                SetEntityCoords(PlayerPedId(), 2129.0607910156,4788.7915039063,40.970268249512)
				msg("Spawned in at Vapid Airfield! ^3Good Luck and have Fun!")
        	end
		end)
		RageUI.Button("Donator Island", "Island for ~r~Donatators Only", { RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
			if Selected then
		
                SetEntityCoords(PlayerPedId(), -2167.1965332031,5184.5737304688,15.699157714844)
				msg("Spawned in at Donator Island! ^3Good Luck and have Fun!")
        	end
		end)
		RageUI.Button("Rebel Diner", "A diner near ~r~Chicken Factory", { RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
			if Selected then
		
                SetEntityCoords(PlayerPedId(), 1586.9771728516,6449.7622070313,25.317150115967)
				msg("Spawned in at Rebel Diner! ^3Good Luck and have Fun!")
        	end
    	end)
    end)
end)




Ismenuopened = false

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local playerCoords, isInMarker, currentZone, letSleep = GetEntityCoords(PlayerPedId()), false, nil, true

		for k,v in pairs(Config.spawnpoint) do
			local distance = #(playerCoords - v)

			if distance < 120.0 then
				letSleep = false
				if distance < 1.5 then
					isInMarker, currentZone = true, k
				end
			end
		end
		if (isInMarker and not hasAlreadyEnteredMarker) or (isInMarker and lastZone ~= currentZone) then
			hasAlreadyEnteredMarker, lastZone = true, currentZone
--			RageUI.Visible(RMenu:Get("RESPAWN", "main"), true)
			Ismenuopened = true
		end

		if not isInMarker and hasAlreadyEnteredMarker then
			RageUI.Visible(RMenu:Get("RESPAWN", "main"), false)
			hasAlreadyEnteredMarker = false
			Ismenuopened = false
		end

		if letSleep then
			Citizen.Wait(200)
		end
	end
end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if Ismenuopened then
			FreezeEntityPosition(PlayerPedId(-1), true)
			 EnableControlAction(0, 245, true)
			RageUI.Visible(RMenu:Get("RESPAWN", "main"), true)
		else
			FreezeEntityPosition(PlayerPedId(-1), false)
			Citizen.Wait(500)
		end
	end
end)

function notify(string)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(string)
    DrawNotification(true, false)
end
--
--function msg(msg) 
--    SetTextComponentFormat("STRING")
--    AddTextComponentString(msg)
--    DisplayHelpTextFromStringLabel(0,0,1,-1)
--end

function msg(text)
    TriggerEvent("chatMessage",  "[Infinite]", {255,0,0}, text)
end


