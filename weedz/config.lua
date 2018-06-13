growtime = 300 -- seconds
startingwater = 40 -- %/100%
startingquality = 5 -- /10
savetime = 10 -- seconds
fertilizerextra = 2 -- seconds 
waterlevel = 50 -- % of water
changetime = 150 -- CHANGE THE PLANT STAGE AT 150 SECONDS!
totalwaterpersavetime = 10
totalwatering = 50
numberofplants = 4
weatheron = true
rainamountofwater = 10

-- EDIT LINE 10 IN WEEDZ_SERVER.LUA -- -- EDIT LINE 10 IN WEEDZ_SERVER.LUA -- -- EDIT LINE 10 IN WEEDZ_SERVER.LUA -- -- EDIT LINE 10 IN WEEDZ_SERVER.LUA -- -- EDIT LINE 10 IN WEEDZ_SERVER.LUA --



---- CALCULATING FINAL SAVE TIME:
---300 SECONDS TO GROW  
---savetime (10s)+ fertilizerextra (2s) = finalsavetime (12s) 

-- FINAL GROW TIME WITHOUT FERTILIZER: 
-- growtime = finalsavetime * x (=) 300 = 10x (=) x = 300/10 (=) x = 30 
-- finalgrowtime = savetime * x (=) finalgrowtime = 10 * 30 (=) finalgrowtime = 300 SECONDS

-- FINAL GROW TIME WITH FERTILIZER: 
-- growtime = finalsavetime * x (=) 300 = 12x (=) x = 300/12 (=) x = 25 
-- finalgrowtime = savetime * x (=) finalgrowtime = 10 * 25 (=) finalgrowtime = 250 SECONDS


Config              = {}
Config.MarkerType   = 25
Config.DrawDistance = 100.0
Config.ZoneSize     = {x = 1.8, y = 2.2, z = 0.6}
Config.MarkerColor  = {r = 100, g = 204, b = 100}

Config.ZoneP = {
	WeedFarmPlant1 = { x =  2943.5593261719, y = 4694.4477539063, z = 51.314525604248  },
}

Config.ZoneF = {
	WeedFarmFarm1 = 	 { x =  2943.5593261719, y = 4694.4477539063, z = 51.314525604248  },
}

Config.ZoneM = {
	WeedFarmMenu1 = 	{ x =  2943.5593261719, y = 4694.4477539063, z = 51.314525604248  },
}

Config.ZoneP2 = {
	WeedFarmPlant2 = { x =  2939.3544921875, y = 4693.2973632813, z = 51.243793487549  },
}

Config.ZoneF2 = {
	WeedFarmFarm2 = 	 { x =  2939.3544921875, y = 4693.2973632813, z = 51.243793487549  },
}

Config.ZoneM2 = {
	WeedFarmMenu2 = 	 { x =  2939.3544921875, y = 4693.2973632813, z = 51.243793487549  },
}

Config.ZoneP3 = {
	WeedFarmPlant3 = { x =  2935.6411132813, y = 4692.6752929688, z = 50.930484771729  },
}

Config.ZoneF3 = {
	WeedFarmFarm3 = 	{ x =  2935.6411132813, y = 4692.6752929688, z = 50.930484771729  },
}

Config.ZoneM3 = {
	WeedFarmMenu3 = { x =  2935.6411132813, y = 4692.6752929688, z = 50.930484771729  },
}

Config.ZoneP4 = {
	WeedFarmPlant4 = { x =  2931.751953125, y = 4691.8662109375, z = 50.638984680176  },

}

Config.ZoneF4 = {
	WeedFarmFarm4 = 	 { x =  2931.751953125, y = 4691.8662109375, z = 50.638984680176  },
}

Config.ZoneM4 = {
	WeedFarmMenu4 = 	 { x =  2931.751953125, y = 4691.8662109375, z = 50.638984680176  },
}

-------------------------

Config.Map = {
   {name="WeedZ - 420",  color=2, scale=0.8, id=496, x=2939.3544921875, y = 4693.2973632813, z = 51.243793487549}, --feito
}

