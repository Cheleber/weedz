w = {}
f = {}
q = {}
_menuPool = NativeUI.CreatePool()
mainMenu = NativeUI.CreateMenu("WeedZ", "CHELEBER 420")
_menuPool:Add(mainMenu)
CurrentWeather = "NO"

local planta = 0
local menuisopen = false
local checker = false
 
RegisterNetEvent('weedz:info')
AddEventHandler("weedz:info", function(p, pp, ppp, spot)
	w[spot] = p
	f[spot] = pp
	q[spot] = ppp
end)

RegisterNetEvent('vSync:updateWeather2')
AddEventHandler('vSync:updateWeather2', function(NewWeather)
    CurrentWeather = NewWeather
	if CurrentWeather == "BLIZZARD" or CurrentWeather == "THUNDER" or CurrentWeather == "RAIN" then
	    TriggerServerEvent('weedz:updateWeather3', 1)
	else
		TriggerServerEvent('weedz:updateWeather3', 0)
	end
end)

RegisterNetEvent('weedz:menuopen')
AddEventHandler("weedz:menuopen", function(plantanr)
    planta = plantanr
	mainMenu:Clear()
    AddMenuKetchup(mainMenu)
    AddMenuAnotherMenu(mainMenu)
	AddMenuAnotherMenu2(mainMenu)
	AddMenuAnotherMenu3(mainMenu)
    _menuPool:RefreshIndex()
	menuisopen = true
	mainMenu:Visible(not mainMenu:Visible())
end)

RegisterNetEvent('weedz:menuclose')
AddEventHandler("weedz:menuclose", function()
	mainMenu:Visible(false)
	menuisopen = false
end)

function AddMenuKetchup(menu)
	if f[planta] == 0 and checker == false then
	    local newitem = NativeUI.CreateItem("Add fertilizer?", "Do you wish to add fertilizer?")
        menu:AddItem(newitem)
		newitem.Activated = function(ParentMenu, SelectedItem)
		   TriggerServerEvent("weedz:fertilizer", 1, planta)
		   TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_GARDENER_PLANT", 0, true)
		   FreezeEntityPosition(GetPlayerPed(-1),true)
		   checker = true
		   Citizen.Wait(4500)
		   checker = false
           mainMenu:Clear()
		   AddMenuKetchup(mainMenu)
    	   AddMenuAnotherMenu(mainMenu)
		   AddMenuAnotherMenu2(mainMenu)
		   AddMenuAnotherMenu3(mainMenu)
    	   _menuPool:RefreshIndex()
		   FreezeEntityPosition(GetPlayerPed(-1),false)
           ClearPedTasksImmediately(GetPlayerPed(-1))
        end
	end
	if f[planta] == 1 then
	    local newitem = NativeUI.CreateItem("Fertilizer", "Fertilizer already added!")
        menu:AddItem(newitem)
	    newitem:SetRightBadge(BadgeStyle.Tick)
	end
	
end

function AddMenuAnotherMenu(menu)
	if w[planta] <= 99 and checker == false then
	    local newitem4 = NativeUI.CreateItem("Water IT ", "Water the plant.")
        menu:AddItem(newitem4)
	    newitem4.Activated = function(ParentMenu, SelectedItem)
		    local wfinal = w[planta] + totalwatering
			ww = wfinal
			if wfinal > 100 then wfinal = 100 end
			if wfinal < 0 then wfinal = 0 end
		    TriggerServerEvent("weedz:water", wfinal, planta)
			TaskStartScenarioInPlace(GetPlayerPed(-1), "CODE_HUMAN_MEDIC_KNEEL", 0, true)
			FreezeEntityPosition(GetPlayerPed(-1),true)
			checker = true
            Citizen.Wait(4500)
			checker = false
			mainMenu:Clear()
			AddMenuKetchup(mainMenu)
    		AddMenuAnotherMenu(mainMenu)
			AddMenuAnotherMenu2(mainMenu)
			AddMenuAnotherMenu3(mainMenu)
    		_menuPool:RefreshIndex()
			FreezeEntityPosition(GetPlayerPed(-1),false)
            ClearPedTasksImmediately(GetPlayerPed(-1))
        end
    end
	if w[planta] == 100 then
	    local newitem4 = NativeUI.CreateItem("~b~Fully Watered!", "Maximum Reached.")
        menu:AddItem(newitem4)
	    newitem4:SetRightBadge(BadgeStyle.Tick)
	end
end

function AddMenuAnotherMenu2(menu)
	local newitem3 = NativeUI.CreateItem("~b~Water " .. tostring(w[planta]) .."%/100%", "The actual plant water level.")
    menu:AddItem(newitem3)
end

function AddMenuAnotherMenu3(menu)
	local newitem2 = NativeUI.CreateItem("~y~Quality " .. tostring(q[planta]) .."/10", "The actual plant quality.")
    menu:AddItem(newitem2)
end

		
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10000)
		if menuisopen then
		    mainMenu:Clear()
            AddMenuKetchup(mainMenu)
            AddMenuAnotherMenu(mainMenu)
		    AddMenuAnotherMenu2(mainMenu)
		    AddMenuAnotherMenu3(mainMenu)
            _menuPool:RefreshIndex()
		end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        _menuPool:ProcessMenus()
    end
end)

Citizen.CreateThread(function()
    while true do

        Wait(0)
        if menuisopen and planta == 1 then
            local coords      = GetEntityCoords(GetPlayerPed(-1))
            for k,v in pairs(Config.ZoneP) do
                if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) > Config.ZoneSize.x) then
				    TriggerEvent("weedz:menuclose")
                end
            end

        end
		if menuisopen and planta == 2 then
            local coords      = GetEntityCoords(GetPlayerPed(-1))
            for k,v in pairs(Config.ZoneP2) do
                if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) > Config.ZoneSize.x) then
				    TriggerEvent("weedz:menuclose")
                end
            end

        end
		if menuisopen and planta == 3 then
            local coords      = GetEntityCoords(GetPlayerPed(-1))
            for k,v in pairs(Config.ZoneP3) do
                if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) > Config.ZoneSize.x) then
				    TriggerEvent("weedz:menuclose")
                end
            end

        end
		if menuisopen and planta == 4 then
            local coords      = GetEntityCoords(GetPlayerPed(-1))
            for k,v in pairs(Config.ZoneP4) do
                if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) > Config.ZoneSize.x) then
				    TriggerEvent("weedz:menuclose")
                end
            end

        end
    end
end)
