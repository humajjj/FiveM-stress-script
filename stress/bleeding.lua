bleeding = true
mindzuspicusek = true

Citizen.CreateThread(function()
while true do
Citizen.Wait(700)
local player = GetPlayerPed(-1)
local Health = GetEntityHealth(player)
local sex = GetEntityMaxHealth(player)  
    
    if sex == 200 and Health < 140 and mindzuspicusek == true or sex == 175 and Health < 130 and mindzuspicusek == true then
        lightbleeding(player)
        bleeding = true
     
        elseif sex == 200 and Health > 141 or sex == 175 and Health > 131 or mindzuspicusek == false then
            stopbleed(player)
            bleeding = false
			mindzuspicusek = false
        elseif sex == 200 and Health > 143 or sex == 175 and Health > 133 or mindzuspicusek == false then
            stopbleed(player)
            bleeding = false
			mindzuspicusek = false
    end
end
end)




exports('BleedingOff', function()
    bleeding = false
	mindzuspicusek = false
	stopbleed(player)
end)


exports('BleedingOn', function()
	mindzuspicusek = true
end)



