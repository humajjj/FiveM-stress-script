ESX = exports["es_extended"]:getSharedObject()

function lightbleeding(ped)
    SetEntityHealth(ped,GetEntityHealth(ped)-2)
    SetPedToRagdoll(GetPlayerPed(-1), 9000, 2000, 3, 0, 0, 0)
    lib.notify({
        title = 'Krvácanie',
        description ='Krvácíš',
        duration = 3500,
        icon = 'fa-ban',
        type = 'fail'
    })
    StartScreenEffect('FadeOut', 0, true)
    StartScreenEffect('SuccessTrevor', 0, true)
    StartScreenEffect('HeistLocate', 100, false)
    StartScreenEffect('RampageOut', 300, false)
    SetPlayerHealthRechargeMultiplier(PlayerId(), 0.0)
    Citizen.Wait(15000)
end

function stopbleed(ped)
    effect = true
    SetPlayerHealthRechargeMultiplier(PlayerId(), 1.0)
end


RegisterCommand("bleedingtest", function()
    SetEntityHealth(GetPlayerPed(-1),125)

end)

function bleedingoff(ped)
    effect = true
    lib.notify({
        title = 'Krvácanie',
        description ='Již nekrvácíš',
        duration = 3500,
        icon = 'fa-check',
        type = 'success'
    })
    StopScreenEffect('SwitchShortTrevorIn')
    lib.notify({
        title = 'Krvácanie',
        description ='Už nekrvácaš chill',
        duration = 3500,
        icon = 'fa-check',
        type = 'success'
    })
    SetPlayerHealthRechargeMultiplier(PlayerId(), 1.0)
end
 
local effect = true
