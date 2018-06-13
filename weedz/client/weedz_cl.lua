local sementeQTE                = 0
local sementeTP                 = 0

local HasAlreadyEnteredMarker   = false
local LastZone                  = nil
local CurrentAction             = nil
local CurrentActionMsg          = ''
local CurrentActionData         = {}

local pronto                   = {}
local plantado                 = {}
local objetoweed               = {}
local noobjectspam1 = {}
local noobjectspam2 = {}
local objecto = {}
local objecto2 = {}
local tempo = {}
local set = false

AddEventHandler('weedz:hasEnteredMarker', function(zone)
        for i = 1, numberofplants, 1 do
            if zone == 'WeedFarmPlant1' then
		        if sementeQTE >= 1 then
		            if plantado[i] == 0 then
                        CurrentAction     = 'Weed_apanha1'
                        CurrentActionMsg  = 'Press ~INPUT_CONTEXT~ to plant weed.'
                        CurrentActionData = {}
			        end
			    end
            end
		
		    if zone == 'WeedFarmMenu1' then
		        if (pronto[i] == 0 and plantado[i] == 1) then
                    CurrentAction     = 'Weed_menu1'
                    CurrentActionMsg  = 'Press ~INPUT_CONTEXT~ to acess weed menu.'
                    CurrentActionData = {}
			    end
            end
		
		    if zone == 'WeedFarmFarm1' then
		        if pronto[i] == 1 then
                    CurrentAction     = 'Weed_colheita1'
                    CurrentActionMsg  = 'Press ~INPUT_CONTEXT~ to farm weed.'
                    CurrentActionData = {}
		    	end
            end
		
		    if zone == 'WeedFarmPlant2' then
		        if sementeQTE >= 1 then
		            if plantado[i] == 0 then
                        CurrentAction     = 'Weed_apanha2'
                        CurrentActionMsg  = 'Press ~INPUT_CONTEXT~ to plant weed.'
                        CurrentActionData = {}
		    	    end
		    	end
            end
		
		    if zone == 'WeedFarmMenu2' then
		        if (pronto[i] == 0 and plantado[i] == 1) then
                    CurrentAction     = 'Weed_menu2'
                    CurrentActionMsg  = 'Press ~INPUT_CONTEXT~ to acess weed menu.'
                    CurrentActionData = {}
			    end
            end
		
		    if zone == 'WeedFarmFarm2' then
		        if pronto[i] == 1 then
                    CurrentAction     = 'Weed_colheita2'
                    CurrentActionMsg  = 'Press ~INPUT_CONTEXT~ to farm weed.'
                    CurrentActionData = {}
			    end
            end
			
			if zone == 'WeedFarmPlant3' then
		        if sementeQTE >= 1 then
		            if plantado[i] == 0 then
                        CurrentAction     = 'Weed_apanha3'
                        CurrentActionMsg  = 'Press ~INPUT_CONTEXT~ to plant weed.'
                        CurrentActionData = {}
		    	    end
		    	end
            end
		
		    if zone == 'WeedFarmMenu3' then
		        if (pronto[i] == 0 and plantado[i] == 1) then
                    CurrentAction     = 'Weed_menu3'
                    CurrentActionMsg  = 'Press ~INPUT_CONTEXT~ to acess weed menu.'
                    CurrentActionData = {}
			    end
            end
		
		    if zone == 'WeedFarmFarm3' then
		        if pronto[i] == 1 then
                    CurrentAction     = 'Weed_colheita3'
                    CurrentActionMsg  = 'Press ~INPUT_CONTEXT~ to farm weed.'
                    CurrentActionData = {}
			    end
            end
			
			if zone == 'WeedFarmPlant4' then
		        if sementeQTE >= 1 then
		            if plantado[i] == 0 then
                        CurrentAction     = 'Weed_apanha4'
                        CurrentActionMsg  = 'Press ~INPUT_CONTEXT~ to plant weed.'
                        CurrentActionData = {}
		    	    end
		    	end
            end
		
		    if zone == 'WeedFarmMenu4' then
		        if (pronto[i] == 0 and plantado[i] == 1) then
                    CurrentAction     = 'Weed_menu4'
                    CurrentActionMsg  = 'Press ~INPUT_CONTEXT~ to acess weed menu.'
                    CurrentActionData = {}
			    end
            end
		
		    if zone == 'WeedFarmFarm4' then
		        if pronto[i] == 1 then
                    CurrentAction     = 'Weed_colheita4'
                    CurrentActionMsg  = 'Press ~INPUT_CONTEXT~ to farm weed.'
                    CurrentActionData = {}
			    end
            end
		end
end)

AddEventHandler('weedz:hasExitedMarker', function(zone)
    CurrentAction = nil
    TriggerServerEvent('weedz:stopApanhaWeed')
    TriggerServerEvent('weedz:stopPlantarWeed')
end)


-- RETURN NUMBER OF ITEMS FROM SERVER
RegisterNetEvent('weedz:ReturnInventory')
AddEventHandler('weedz:ReturnInventory', function(sementeNbr, sementeTP, currentZone, spt)
    sementeQTE = sementeNbr	
	sementetipo = sementeTP
    TriggerEvent('weedz:hasEnteredMarker', currentZone, spt)
end)

--- OBJECTS
RegisterNetEvent('weedz:pronto')
AddEventHandler('weedz:pronto', function(Spot)
    pronto[Spot] = 1
	objetoweed[Spot] = 2
end)

RegisterNetEvent('weedz:plantadissimo')
AddEventHandler('weedz:plantadissimo', function(Spot)
    plantado[Spot] = 1
end)

RegisterNetEvent('weedz:plantadissimot')
AddEventHandler('weedz:plantadissimot', function(Spot)
	tempo[Spot] = growtime
end)

RegisterNetEvent('weedz:plantadissimo1')
AddEventHandler('weedz:plantadissimo1', function(Spot)
    plantado[Spot] = 1
    objetoweed[Spot] = 1
end)

RegisterNetEvent('weedz:desplantadissimo')
AddEventHandler('weedz:desplantadissimo', function(Spot)
    plantado[Spot] = 0
	pronto[Spot] = 0
	objetoweed[Spot] = 0
	tempo[Spot] = 0
	CurrentAction             = nil
    CurrentActionMsg          = ''
    CurrentActionData         = {}
end)


RegisterNetEvent('weedz:senddata')
AddEventHandler("weedz:senddata", function(p, pp, t, water, Spot)
	plantado[Spot] = p
	pronto[Spot] = pp
	if set == false then
	    set = true
		tempo[Spot] = t
	end
	if pp == 0 and water > 0 then
	    tempo[Spot] = tempo[Spot] - 1
	end
	if pp == 1 then tempo[Spot] = 0 end
    if water == 0 then tempo[Spot] = t end	
	if p == 0 then
	    objetoweed[Spot] = 0
	end
end)

RegisterNetEvent('weedz:sucessplanted')
AddEventHandler("weedz:sucessplanted", function(Spot)
    pronto[Spot] = 0
    CurrentAction             = nil
    CurrentActionMsg  = 'Press ~INPUT_CONTEXT~ to acess weed menu.'
	isInMarker = false
	hasAlreadyEnteredMarker = false
	TriggerServerEvent('weedz:savecampo', Spot, growtime, 0, startingwater, 0, startingquality)
end)

RegisterNetEvent('weedz:sucessfarm')
AddEventHandler("weedz:sucessfarm", function(Spot)
    pronto[Spot] = 0
    CurrentActionMsg  = 'Press ~INPUT_CONTEXT~ to plant weed.'
    CurrentActionData = {}
	isInMarker = false
	hasAlreadyEnteredMarker = false
	TriggerServerEvent('weedz:saveapanhado', 0, 0, 0, 0, 0, 0, Spot)
end)


RegisterNetEvent('weedz:notification')
AddEventHandler("weedz:notification", function(text)
    drawNotification(text)
end)

-- Render markers
Citizen.CreateThread(function()
    while true do

        Wait(0)

        local coords = GetEntityCoords(GetPlayerPed(-1))

        for k,v in pairs(Config.ZoneP) do
            if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < Config.DrawDistance) then
				DrawMarker(Config.MarkerType, v.x, v.y, v.z - 0.99, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.ZoneSize.x, Config.ZoneSize.y, Config.ZoneSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false) 
				if plantado[1] == 1 then
				    if tempo[1] > 0 then
				        local sec = SecondsToClock(tempo[1])
				        DrawText3D(v.x, v.y, v.z - 0.6, sec)
				    else
				        DrawText3D(v.x, v.y, v.z - 0.6, "Ready")
				    end
				else
				    DrawText3D(v.x, v.y, v.z - 0.6, "Plant Here")
				end
			end
        end
		for k,v in pairs(Config.ZoneP2) do
            if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < Config.DrawDistance) then
				DrawMarker(Config.MarkerType, v.x, v.y, v.z - 0.99, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.ZoneSize.x, Config.ZoneSize.y, Config.ZoneSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
			    if plantado[2] == 1 then
				    if tempo[2] > 0 then
				        local sec = SecondsToClock(tempo[2])
				        DrawText3D(v.x, v.y, v.z - 0.6, sec)
				    else
				        DrawText3D(v.x, v.y, v.z - 0.6, "Ready")
				    end
				else
				    DrawText3D(v.x, v.y, v.z - 0.6, "Plant Here")
				end
			end
        end
		for k,v in pairs(Config.ZoneP3) do
            if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < Config.DrawDistance) then
				DrawMarker(Config.MarkerType, v.x, v.y, v.z - 0.99, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.ZoneSize.x, Config.ZoneSize.y, Config.ZoneSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
			    if plantado[3] == 1 then
				    if tempo[3] > 0 then
				        local sec = SecondsToClock(tempo[3])
				        DrawText3D(v.x, v.y, v.z - 0.6, sec)
				    else
				        DrawText3D(v.x, v.y, v.z - 0.6, "Ready")
				    end
				else
				    DrawText3D(v.x, v.y, v.z - 0.6, "Plant Here")
				end
			end
        end
		for k,v in pairs(Config.ZoneP4) do
            if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < Config.DrawDistance) then
				DrawMarker(Config.MarkerType, v.x, v.y, v.z - 0.99, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.ZoneSize.x, Config.ZoneSize.y, Config.ZoneSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
			    if plantado[4] == 1 then
				    if tempo[4] > 0 then
				        local sec = SecondsToClock(tempo[4])
				        DrawText3D(v.x, v.y, v.z - 0.6, sec)
				    else
				        DrawText3D(v.x, v.y, v.z - 0.6, "Ready")
				    end
				else
				    DrawText3D(v.x, v.y, v.z - 0.6, "Plant Here")
				end
			end
        end

    end
end)


-- Create Blips
Citizen.CreateThread(function()

	for i=1, #Config.Map, 1 do	
		local blip = AddBlipForCoord(Config.Map[i].x, Config.Map[i].y, Config.Map[i].z)
		SetBlipSprite (blip, Config.Map[i].id)
		SetBlipDisplay(blip, 4) -- TODO: MARIJUANA BLIP GREEN
		SetBlipColour (blip, Config.Map[i].color)
		SetBlipScale  (blip, Config.Map[i].scale)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('WeedZ')
		EndTextCommandSetBlipName(blip)
	end

end)

Citizen.CreateThread(function()
    while true do
        Wait(0)
		for i = 1, numberofplants, 1 do
		    pronto[i] = 0
			plantado[i] = 0
			objetoweed[i] = 0
			noobjectspam1[i] = 0
			noobjectspam2[i] = 0
			tempo[i] = 0
		end
		TriggerServerEvent('weedz:checkcolheita1')
		return
    end
end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		TriggerServerEvent('weedz:checkcolheita1')
		TriggerServerEvent("weedz:checktempo")
	end
end)

-- Activate menu when player is inside marker
Citizen.CreateThread(function()
    while true do

        Wait(0)

        local coords      = GetEntityCoords(GetPlayerPed(-1))
        local isInMarker  = false
        local currentZone = nil
		
        for k,v in pairs(Config.ZoneP) do
            if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < Config.ZoneSize.x) and plantado[1] == 0 and pronto[1] == 0 then
                isInMarker  = true
                currentZone = k
            end
        end
		
		for k,v in pairs(Config.ZoneF) do
           if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < Config.ZoneSize.x) and plantado[1] == 1 and pronto[1] == 1 then
                isInMarker  = true
                currentZone = k
            end
        end
		
		for k,v in pairs(Config.ZoneM) do
            if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < Config.ZoneSize.x) and plantado[1] == 1 and pronto[1] == 0 then
                isInMarker  = true
                currentZone = k
            end
        end
			
		for k,v in pairs(Config.ZoneP2) do
            if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < Config.ZoneSize.x) and plantado[2] == 0 and pronto[2] == 0 then
                isInMarker  = true
                currentZone = k
            end
        end
		
		for k,v in pairs(Config.ZoneF2) do
           if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < Config.ZoneSize.x) and plantado[2] == 1 and pronto[2] == 1 then
                isInMarker  = true
                currentZone = k
            end
        end
		
		for k,v in pairs(Config.ZoneM2) do
            if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < Config.ZoneSize.x) and plantado[2] == 1 and pronto[2] == 0 then
                isInMarker  = true
                currentZone = k
            end
        end
		
		for k,v in pairs(Config.ZoneP3) do
            if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < Config.ZoneSize.x) and plantado[3] == 0 and pronto[3] == 0 then
                isInMarker  = true
                currentZone = k
            end
        end
		
		for k,v in pairs(Config.ZoneF3) do
           if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < Config.ZoneSize.x) and plantado[3] == 1 and pronto[3] == 1 then
                isInMarker  = true
                currentZone = k
            end
        end
		
		for k,v in pairs(Config.ZoneM3) do
            if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < Config.ZoneSize.x) and plantado[3] == 1 and pronto[3] == 0 then
                isInMarker  = true
                currentZone = k
            end
        end
		
		for k,v in pairs(Config.ZoneP4) do
            if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < Config.ZoneSize.x) and plantado[4] == 0 and pronto[4] == 0 then
                isInMarker  = true
                currentZone = k
            end
        end
		
		for k,v in pairs(Config.ZoneF4) do
           if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < Config.ZoneSize.x) and plantado[4] == 1 and pronto[4] == 1 then
                isInMarker  = true
                currentZone = k
            end
        end
		
		for k,v in pairs(Config.ZoneM4) do
            if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < Config.ZoneSize.x) and plantado[4] == 1 and pronto[4] == 0 then
                isInMarker  = true
                currentZone = k
            end
        end

        if isInMarker and not hasAlreadyEnteredMarker then
            hasAlreadyEnteredMarker = true
            lastZone                = currentZone
            TriggerServerEvent('weedz:GetUserInventory', currentZone)
        end

        if not isInMarker and hasAlreadyEnteredMarker then
            hasAlreadyEnteredMarker = false
            TriggerEvent('weedz:hasExitedMarker', lastZone)
		end
    end
end)

-- Key Controls
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if CurrentAction ~= nil then
            SetTextComponentFormat('STRING')
            AddTextComponentString(CurrentActionMsg)
            DisplayHelpTextFromStringLabel(0, 0, 1, -1)
            if IsControlJustReleased(0, 38) then
			    if CurrentAction == 'Weed_apanha1' then
                    TriggerServerEvent('weedz:startPlantarWeed', 1)
					TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_GARDENER_PLANT", 0, true)
					FreezeEntityPosition(GetPlayerPed(-1),true)
                    Citizen.Wait(10000)
					FreezeEntityPosition(GetPlayerPed(-1),false)
                    ClearPedTasksImmediately(GetPlayerPed(-1))
					hasAlreadyEnteredMarker = false
                end
				
				if CurrentAction == 'Weed_colheita1' then
                    TriggerServerEvent('weedz:startApanhaWeed', 1)
					TaskStartScenarioInPlace(GetPlayerPed(-1), "PROP_HUMAN_BUM_BIN", 0, true)
					FreezeEntityPosition(GetPlayerPed(-1),true)
                    Citizen.Wait(10000)
					FreezeEntityPosition(GetPlayerPed(-1),false)
                    ClearPedTasksImmediately(GetPlayerPed(-1))
					hasAlreadyEnteredMarker = false
                end
                if CurrentAction == 'Weed_menu1' then
                    TriggerEvent('weedz:menuopen', 1)
				    hasAlreadyEnteredMarker = false
                end
				if CurrentAction == 'Weed_apanha2' then
                    TriggerServerEvent('weedz:startPlantarWeed', 2)
					TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_GARDENER_PLANT", 0, true)
					FreezeEntityPosition(GetPlayerPed(-1),true)
                    Citizen.Wait(10000)
					FreezeEntityPosition(GetPlayerPed(-1),false)
                    ClearPedTasksImmediately(GetPlayerPed(-1))
					hasAlreadyEnteredMarker = false
                end
				
				if CurrentAction == 'Weed_colheita2' then
                    TriggerServerEvent('weedz:startApanhaWeed', 2)
					TaskStartScenarioInPlace(GetPlayerPed(-1), "PROP_HUMAN_BUM_BIN", 0, true)
					FreezeEntityPosition(GetPlayerPed(-1),true)
                    Citizen.Wait(10000)
					FreezeEntityPosition(GetPlayerPed(-1),false)
                    ClearPedTasksImmediately(GetPlayerPed(-1))
					hasAlreadyEnteredMarker = false
                end
				
                if CurrentAction == 'Weed_menu2' then
                    TriggerEvent('weedz:menuopen', 2)
				    hasAlreadyEnteredMarker = false
                end
				
				if CurrentAction == 'Weed_apanha3' then
                    TriggerServerEvent('weedz:startPlantarWeed', 3)
					TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_GARDENER_PLANT", 0, true)
					FreezeEntityPosition(GetPlayerPed(-1),true)
                    Citizen.Wait(10000)
					FreezeEntityPosition(GetPlayerPed(-1),false)
                    ClearPedTasksImmediately(GetPlayerPed(-1))
					hasAlreadyEnteredMarker = false
                end
				
				if CurrentAction == 'Weed_colheita3' then
                    TriggerServerEvent('weedz:startApanhaWeed', 3)
					TaskStartScenarioInPlace(GetPlayerPed(-1), "PROP_HUMAN_BUM_BIN", 0, true)
					FreezeEntityPosition(GetPlayerPed(-1),true)
                    Citizen.Wait(10000)
					FreezeEntityPosition(GetPlayerPed(-1),false)
                    ClearPedTasksImmediately(GetPlayerPed(-1))
					hasAlreadyEnteredMarker = false
                end
				
                if CurrentAction == 'Weed_menu3' then
                    TriggerEvent('weedz:menuopen', 3)
				    hasAlreadyEnteredMarker = false
                end
				
				if CurrentAction == 'Weed_apanha4' then
                    TriggerServerEvent('weedz:startPlantarWeed', 4)
					TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_GARDENER_PLANT", 0, true)
					FreezeEntityPosition(GetPlayerPed(-1),true)
                    Citizen.Wait(10000)
					FreezeEntityPosition(GetPlayerPed(-1),false)
                    ClearPedTasksImmediately(GetPlayerPed(-1))
					hasAlreadyEnteredMarker = false
                end
				
				if CurrentAction == 'Weed_colheita4' then
                    TriggerServerEvent('weedz:startApanhaWeed', 4)
					TaskStartScenarioInPlace(GetPlayerPed(-1), "PROP_HUMAN_BUM_BIN", 0, true)
					FreezeEntityPosition(GetPlayerPed(-1),true)
                    Citizen.Wait(10000)
					FreezeEntityPosition(GetPlayerPed(-1),false)
                    ClearPedTasksImmediately(GetPlayerPed(-1))
					hasAlreadyEnteredMarker = false
                end
				
                if CurrentAction == 'Weed_menu4' then
                    TriggerEvent('weedz:menuopen', 4)
				    hasAlreadyEnteredMarker = false
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0) 
		for i = 1, numberofplants, 1 do
		    local Zona = nil
			if i == 1 then Zona = Config.ZoneP end
			if i == 2 then Zona = Config.ZoneP2 end
			if i == 3 then Zona = Config.ZoneP3 end
			if i == 4 then Zona = Config.ZoneP4 end
		    for k,v in pairs(Zona) do
    	        if objetoweed[i] == 1 and noobjectspam1[i] == 0 then
		            noobjectspam1[i] = 1
	                local weedprop1 = CreateObject("prop_weed_02", v.x, v.y, v.z, true, true, true)
                    PlaceObjectOnGroundProperly(weedprop1)
                    SetEntityRotation(weedprop1, 0.00, 0.00, 340.00)
	            end
	            if objetoweed[i] == 2 and noobjectspam2[i] == 0 then
		            noobjectspam2[i] = 1
			        noobjectspam1[i] = 0
	                local weedprop2 = CreateObject("prop_weed_01", v.x, v.y, v.z, true, true, true)
                    PlaceObjectOnGroundProperly(weedprop2)
                    SetEntityRotation(weedprop2, 0.00, 0.00, 340.00)
	            end
		        objecto[i] = GetClosestObjectOfType(v.x, v.y, v.z,  3.0,  "prop_weed_02", false, false, false)
		        if objetoweed[i] == 1 and noobjectspam1[i] == 1 and not DoesEntityExist(objecto[i]) then
	                local weedprop1 = CreateObject("prop_weed_02", v.x, v.y, v.z, true, true, true)
                    PlaceObjectOnGroundProperly(weedprop1)
                    SetEntityRotation(weedprop1, 0.00, 0.00, 340.00)
		        end
		        objecto2[i] = GetClosestObjectOfType(v.x, v.y, v.z,  3.0,  "prop_weed_01", false, false, false)
		        if objetoweed[i] == 2 and noobjectspam2[i] == 1 and not DoesEntityExist(objecto2[i]) then
		            local weedprop2 = CreateObject("prop_weed_01", v.x, v.y, v.z, true, true, true)
                    PlaceObjectOnGroundProperly(weedprop2)
                    SetEntityRotation(weedprop2, 0.00, 0.00, 340.00)
		        end
		        if objetoweed[i] == 0 then
		            noobjectspam2[i] = 0
		        	local object1 = GetClosestObjectOfType(v.x, v.y, v.z,  3.0,  "prop_weed_02", false, false, false)
		    	    DeleteEntity(object1)
		    	    local object2 = GetClosestObjectOfType(v.x, v.y, v.z,  3.0,  "prop_weed_01", false, false, false)
		    	    DeleteEntity(object2)
		        end
			end
	    end
	end
end)


function DrawText3D(x,y,z, text) 
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)

    local scale = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
    
    if onScreen then
        SetTextScale(0.70*scale, 1.00*scale)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(0, 200, 0, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
		World3dToScreen2d(x,y,z, 0) --Added Here
        DrawText(_x,_y)
    end
end

function SecondsToClock(seconds)
  local seconds = tonumber(seconds)

  if seconds <= 0 then
    return "00:00:00";
  else
    hours = string.format("%02.f", math.floor(seconds/3600));
    mins = string.format("%02.f", math.floor(seconds/60 - (hours*60)));
    secs = string.format("%02.f", math.floor(seconds - hours*3600 - mins *60));
    return hours..":"..mins..":"..secs
  end
end

function drawNotification(text)
    SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
    DrawNotification(false, true)
end
