------------------ change this -------------------

admins = {
    'steam:110000105c4d991',
	'steam:110000103e83831',
    'steam:11000010256b49a',
    --'license:1234975143578921327',
}

-- Set this to false if you don't want the weather to change automatically every 10 minutes.
DynamicWeather = true

--------------------------------------------------
debugprint = false -- don't touch this unless you know what you're doing or you're being asked by Vespura to turn this on.
--------------------------------------------------







-------------------- DON'T CHANGE THIS --------------------
AvailableWeatherTypes = {
    'EXTRASUNNY', 
    'CLEAR', 
    'NEUTRAL', 
    'SMOG', 
    'FOGGY', 
    'OVERCAST', 
    'CLOUDS', 
    'CLEARING', 
    'RAIN', 
    'THUNDER', 
    'SNOW', 
    'BLIZZARD', 
    'SNOWLIGHT', 
    'XMAS', 
    'HALLOWEEN',
}
CurrentWeather = "EXTRASUNNY"
Time = {}
Time.h = 12
Time.m = 0
local freezeTime = false
local blackout = false
local newWeatherTimer = 30

RegisterServerEvent('vSync:requestSync')
AddEventHandler('vSync:requestSync', function()
    TriggerClientEvent('vSync:updateWeather', -1, CurrentWeather, blackout)
	TriggerClientEvent('vSync:updateWeather2', -1, CurrentWeather)
    TriggerClientEvent('vSync:updateTime', -1, Time.h, Time.m, freezeTime)
end)

function isAllowedToChange(player)
    local allowed = false
    for i,id in ipairs(admins) do
        for x,pid in ipairs(GetPlayerIdentifiers(player)) do
            if debugprint then print('admin id: ' .. id .. '\nplayer id:' .. pid) end
            if string.lower(pid) == string.lower(id) then
                allowed = true
            end
        end
    end
    return allowed
end

RegisterCommand('parartempo', function(source, args)
    if source ~= 0 then
        if isAllowedToChange(source) then
            freezeTime = not freezeTime
            if freezeTime then
                TriggerClientEvent('vSync:notify', source, 'O tempo esta agora ~b~congelado~s~.')
            else
                TriggerClientEvent('vSync:notify', source, 'O tempo esta agora descongelado ~y~desacongelado~s~.')
            end
        else
            TriggerClientEvent('chatMessage', source, '', {255,255,255}, '^8ERRO: ^1Nao estas autorizado a usar este comando!')
        end
    else
        freezeTime = not freezeTime
        if freezeTime then
            print("Time is now frozen.")
        else
            print("Time is no longer frozen.")
        end
    end
end)

RegisterCommand('pararclima', function(source, args)
    if source ~= 0 then
        if isAllowedToChange(source) then
            DynamicWeather = not DynamicWeather
            if not DynamicWeather then
                TriggerClientEvent('vSync:notify', source, 'O clima automatico foi ~r~desativado~s~.')
            else
                TriggerClientEvent('vSync:notify', source, 'O clima automatico foi ~b~ativado~s~.')
            end
        else
            TriggerClientEvent('chatMessage', source, '', {255,255,255}, '^8ERRO: ^1Nao estas autorizado a usar este comando!')
        end
    else
        DynamicWeather = not DynamicWeather
        if not DynamicWeather then
            print("Weather is now frozen.")
        else
            print("Weather is no longer frozen.")
        end
    end
end)

RegisterCommand('clima', function(source, args)
    if source == 0 then
        local validWeatherType = false
        if args[1] == nil then
            print("Invalid syntax, correct syntax is: /weather <weathertype> ")
            return
        else
            for i,wtype in ipairs(AvailableWeatherTypes) do
                if wtype == string.upper(args[1]) then
                    validWeatherType = true
                end
            end
            if validWeatherType then
                print("Weather has been upated.")
                CurrentWeather = string.upper(args[1])
                newWeatherTimer = 30
                TriggerEvent('vSync:requestSync')
            else
                print("Invalid weather type, valid weather types are: \nEXTRASUNNY CLEAR NEUTRAL SMOG FOGGY OVERCAST CLOUDS CLEARING RAIN THUNDER SNOW BLIZZARD SNOWLIGHT XMAS HALLOWEEN ")
            end
        end
    else
        if isAllowedToChange(source) then
            local validWeatherType = false
            if args[1] == nil then
                TriggerClientEvent('chatMessage', source, '', {255,255,255}, '^8ERRO: ^1Uso Incorreto: ^0/clima <TipodeClima> ^1!')
            else
                for i,wtype in ipairs(AvailableWeatherTypes) do
                    if wtype == string.upper(args[1]) then
                        validWeatherType = true
                    end
                end
                if validWeatherType then
                    TriggerClientEvent('vSync:notify', source, 'Clima ira mudar para: ~y~' .. string.lower(args[1]) .. "~s~.")
                    CurrentWeather = string.upper(args[1])
                    newWeatherTimer = 30
                    TriggerEvent('vSync:requestSync')
                else
                    TriggerClientEvent('chatMessage', source, '', {255,255,255}, '^8ERRO: ^1Uso incorreto, clima: ^0\nEXTRASUNNY CLEAR NEUTRAL SMOG FOGGY OVERCAST CLOUDS CLEARING RAIN THUNDER SNOW BLIZZARD SNOWLIGHT XMAS HALLOWEEN ')
                end
            end
        else
            TriggerClientEvent('chatMessage', source, '', {255,255,255}, '^8ERRO: ^1Nao estas autorizado a usar este comando!')
            print('Access for command /weather denied.')
        end
    end
end, false)

RegisterCommand('apagao', function(source)
    if source == 0 then
        blackout = not blackout
        if blackout then
            print("Blackout is now enabled.")
        else
            print("Blackout is now disabled.")
        end
    else
        if isAllowedToChange(source) then
            blackout = not blackout
            if blackout then
                TriggerClientEvent('vSync:notify', source, 'Apagao esta ~b~ativado~s~.')
            else
                TriggerClientEvent('vSync:notify', source, 'Apagao esta ~r~desativado~s~.')
            end
            TriggerEvent('vSync:requestSync')
        end
    end
end)

RegisterCommand('manha', function(source)
    if source == 0 then
        print("For console, use the \"/time <hh> <mm>\" command instead!")
        return
    end
    if isAllowedToChange(source) then
        Time.h = 9
        Time.m = 0
        TriggerClientEvent('vSync:notify', source, 'Tempo mudado para ~y~manha~s~.')
        TriggerEvent('vSync:requestSync')
    end
end)
RegisterCommand('tarde', function(source)
    if source == 0 then
        print("For console, use the \"/time <hh> <mm>\" command instead!")
        return
    end
    if isAllowedToChange(source) then
        Time.h = 12
        Time.m = 0
        TriggerClientEvent('vSync:notify', source, 'Tempo mudado para ~y~tarde~s~.')
        TriggerEvent('vSync:requestSync')
    end
end)
RegisterCommand('fimdodia', function(source)
    if source == 0 then
        print("For console, use the \"/time <hh> <mm>\" command instead!")
        return
    end
    if isAllowedToChange(source) then
        Time.h = 18
        Time.m = 0
        TriggerClientEvent('vSync:notify', source, 'Tempo mudado para ~y~fim do dia~s~.')
        TriggerEvent('vSync:requestSync')
    end
end)
RegisterCommand('noite', function(source)
    if source == 0 then
        print("For console, use the \"/time <hh> <mm>\" command instead!")
        return
    end
    if isAllowedToChange(source) then
        Time.h = 23
        Time.m = 0
        TriggerClientEvent('vSync:notify', source, 'Tempo mudado para ~y~noite~s~.')
        TriggerEvent('vSync:requestSync')
    end
end)


RegisterCommand('tempo', function(source, args, rawCommand)
    if source == 0 then
        if tonumber(args[1]) ~= nil and tonumber(args[2]) ~= nil then
            local argh = tonumber(args[1])
            local argm = tonumber(args[2])
            if argh < 24 then
                Time.h = argh
            else
                Time.h = 0
            end
            if argm < 60 then
                Time.m = argm
            else
                Time.m = 0
            end
            print("Time has changed to " .. Time.h .. ":" .. Time.m .. ".")
            TriggerEvent('vSync:requestSync')
        else
            print("Invalid syntax, correct syntax is: time <hour> <minute> !")
        end
    elseif source ~= 0 then
        if isAllowedToChange(source) then
            if tonumber(args[1]) ~= nil and tonumber(args[2]) ~= nil then
                local argh = tonumber(args[1])
                local argm = tonumber(args[2])
                if argh < 24 then
                    Time.h = argh
                else
                    Time.h = 0
                end
                if argm < 60 then
                    Time.m = argm
                else
                    Time.m = 0
                end
                local newtime = Time.h .. ":"
                if Time.m < 10 then
                    newtime = newtime .. "0" .. Time.m
                else
                    newtime = newtime .. Time.m
                end
                TriggerClientEvent('vSync:notify', source, 'Tempo foi mudado para: ~y~' .. newtime .. "~s~!")
                TriggerEvent('vSync:requestSync')
            else
                TriggerClientEvent('chatMessage', source, '', {255,255,255}, '^8ERRO: ^1Uso Incorreto. Use ^0/tempo <hora> <minutos> ^1instead!')
            end
        else
            TriggerClientEvent('chatMessage', source, '', {255,255,255}, '^8ERRO: ^1Nao estas autorizado a usar este comando!')
            print('Access for command /time denied.')
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(2000)
        if not freezeTime then
            Time.m = Time.m + 1
            if Time.m > 59 then
                Time.m = 0
                Time.h = Time.h + 1
                if Time.h > 23 then
                    Time.h = 0
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5000)
        TriggerClientEvent('vSync:updateTime', -1, Time.h, Time.m, freezeTime)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(300000)
        TriggerClientEvent('vSync:updateWeather', -1, CurrentWeather, blackout)
		TriggerClientEvent('vSync:updateWeather2', -1, CurrentWeather)
    end
end)

Citizen.CreateThread(function()
    while true do
        newWeatherTimer = newWeatherTimer - 1
        Citizen.Wait(60000)
        if newWeatherTimer == 0 then
            if DynamicWeather then
                NextWeatherStage()
            end
            newWeatherTimer = 30
        end
    end
end)

function NextWeatherStage()
    if CurrentWeather == "CLEAR" or CurrentWeather == "EXTRASUNNY"  then
        local new = math.random(1,2)
        if new == 1 then
            CurrentWeather = "CLEAR"
        else
            CurrentWeather = "EXTRASUNNY"
        end
    elseif CurrentWeather == "CLEAR" or CurrentWeather == "EXTRASUNNY" then
        local new = math.random(1,6)
        if new == 1 then
            if CurrentWeather == "CLEAR" then CurrentWeather = "EXTRASUNNY" else CurrentWeather = "EXTRASUNNY" end
        elseif new == 2 then
            CurrentWeather = "CLEAR"
        elseif new == 3 then
            CurrentWeather = "EXTRASUNNY"
        elseif new == 4 then
            CurrentWeather = "CLEAR"
        elseif new == 5 then
            CurrentWeather = "EXTRASUNNY"
        else
            CurrentWeather = "CLEAR"
        end
    elseif CurrentWeather == "EXTRASUNNY" then
        CurrentWeather = "CLEAR"
    elseif CurrentWeather == "CLEAR" then
        CurrentWeather = "EXTRASUNNY"
    end
    TriggerEvent("vSync:requestSync")
    if debugprint then
        print("[vSync] New random weather type has been generated: " .. CurrentWeather .. ".\n")
        print("[vSync] Resetting timer to 10 minutes.\n")
    end
end

