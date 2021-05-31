RMenu.Add('RespawnMenu', 'main', RageUI.CreateMenu("Respawn Menu", "~b~Cloned's Respawn Menu", 1350, 50))

RageUI.CreateWhile(1.0, RMenu:Get('RespawnMenu', 'main'), nil, function()

    RageUI.IsVisible(RMenu:Get('RespawnMenu', 'main'), true, false, true, function()
        if cfg.freeze == true then
            FreezeEntityPosition(PlayerPedId(), true)
        end 

        for i , p in pairs(cfg.options) do 
            RageUI.Button(p.name , nil, "", true, function(Hovered, Active, Selected)

                if Selected then
                    SetEntityCoords(PlayerPedId(), p.location)
                end

            end)
        end
        
    end, function()

    end)
end)

isInMenu = false
currentAmmunition = nil
Citizen.CreateThread(function() 
    while true do
        local v1 = cfg.coords 
        if isInMenu == false then
            if isInArea(v1, 1.4) then 
                currentAmmunition = k
                RageUI.Visible(RMenu:Get("RespawnMenu", "main"), true)
                isInMenu = true
                currentAmmunition = k 
            end
        end
        if cfg.marker == true then
            if isInArea(v1, 100.0) then 
                DrawMarker(2, v1+1 - 0.98, 0, 0, 0, 0, 0, 0, 0.8, 0.8, 0.8, 0, 153, 255, 150, 0, 0, 0, 0, 0, 0, 0)
            end
        end
        if isInArea(v1, 1.4) == false and isInMenu and k == currentAmmunition then
            RageUI.Visible(RMenu:Get("RespawnMenu", "main"), false)
            isInMenu = false
            currentAmmunition = nil
            if cfg.freeze == true then
                FreezeEntityPosition(PlayerPedId(), false)
            end
        end
        Citizen.Wait(0)
    end
end)

-- [When Pressing Backspace it doesn't exit]
if cfg.freeze == false then
    Citizen.CreateThread(function()
    	while true do
    		Citizen.Wait(0)
    		if isInMenu then
                RageUI.Visible(RMenu:Get("RespawnMenu", "main"), true)
    		else
    			FreezeEntityPosition(PlayerPedId(), false)
    			Citizen.Wait(500)
    		end
    	end
    end)
end


-- [Leave This]
function isInArea(v, dis) 
    
    if #(GetEntityCoords(PlayerPedId()) - v) <= dis then  
        return true
    else 
        return false
    end
end




