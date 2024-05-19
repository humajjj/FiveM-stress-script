ESX = exports["es_extended"]:getSharedObject()


AEH = AddEventHandler
RegisterNetEvent("stressdown")
AEH("stressdown", function()

    local src = source
    local player = ESX.GetPlayerFromId(src)
    player.removeInventoryItem("adrenalin", 1)

end)

RegisterNetEvent("dynysundatbleed")
AEH("dynysundatbleed", function()

    local src = source
    local player = ESX.GetPlayerFromId(src)
    player.removeInventoryItem("bleedpills", 1)

end)



RegisterNetEvent("AddStressServer")
AEH("AddStressServer", function(value)

TriggerClientEvent("AddStressClient", value)

end)