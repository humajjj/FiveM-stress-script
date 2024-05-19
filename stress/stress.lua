local drunkEffectIntensity = 0.0 -- Intenzita opilosti
local maxDrunkEffectIntensity = 3.0 -- Maximální intenzita opilosti
local drunkEffectStep = 0.1 -- Krok, jakým se zvyšuje/snižuje intenzita opilosti
local isPlayerShooting = false -- Příznak, jestli hráč střílí
picus = false





Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100) -- Kontrolní frekvence v milisekundách
        
        local playerPed = GetPlayerPed(-1)
        local isPlayerArmed = IsPedArmed(playerPed, 4) -- Kontrola, zda je hráč ozbrojen

        if isPlayerArmed then
            -- Hráč je ozbrojen
            
            local isShooting = IsPedShooting(playerPed)
            
            if isShooting and not isPlayerShooting then
                -- Hráč právě začal střílet
                isPlayerShooting = true
            elseif not isShooting and isPlayerShooting then
                -- Hráč přestal střílet
                isPlayerShooting = false
            end
            
            if isPlayerShooting then
                -- Hráč střílí
                
                if drunkEffectIntensity < maxDrunkEffectIntensity then
                    -- Zvyšování intenzity opilosti
					if picus == false then
                    drunkEffectIntensity = drunkEffectIntensity + drunkEffectStep
                    lib.notify({
                        id = 'some_identifier',
                        title = 'Stress',
                        description = 'Stress sa ti zvýšil o 0.1!',
                        position = 'top',
                        style = {
                            backgroundColor = '#141517',
                            color = '#C1C2C5',
                            ['.description'] = {
                              color = '#909296'
                            }
                        },
                        icon = 'fa-info-circle',
                        iconColor = '#2305fa'
                    })

					picus = true
					Citizen.Wait(5000)
					picus = false
					
					
                elseif drunkEffectIntensity == 3.0 then
                    -- Dosáhli jsme maximální intenzity opilosti
                    drunkEffectIntensity = maxDrunkEffectIntensity
                    
                    lib.notify({
                        title = 'Stress',
                        description ='Dosiahol si maximální intensitu stressu',
                        duration = 3500,
                        icon = 'fa-info-circle',
                        type = 'fail'
                    })
                end
            end
		end
        else
            -- Hráč není ozbrojen
            
            if drunkEffectIntensity > 0.2 then
                -- Snížení intenzity opilosti
				--Citizen.Wait(0000)
                --lib.notify({
                   -- title = 'Stress',
                   -- description ='Stress snížen o 0.1',
                    --duration = 3500,
                    --icon = 'fa-info-circle',
                    --type = 'success'
                --})
                --drunkEffectIntensity = drunkEffectIntensity - drunkEffectStep
				
            else
                --exports['mythic_notify']:SendAlert('error', "Dosáhl si maximálního stressu")
                -- Dosáhli jsme minimální intenzity opilosti
                
            end
        end
        
        if drunkEffectIntensity > 0.0 then
        else
            -- Hráč nemá žádnou intenzitu opilosti
            
            -- Vypnutí opilého efektu
        end
    end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait( 1 )
		SetBlackout(false)
		SetPedSuffersCriticalHits(PlayerPedId(), false)
		if IsPlayerFreeAiming(PlayerId()) or IsControlPressed(1, 24) then		    
			else
			ShakeGameplayCam("DRUNK_SHAKE", drunkEffectIntensity)
		end
	end
end)



RegisterCommand("ShowStress", function()

ESX.ShowNotification(drunkEffectIntensity)
end)


exports('GetStressLevel', function()
    return drunkEffectIntensity
end)



exports('RemoveStress', function(value)
    drunkEffectIntensity = drunkEffectIntensity - value
end)

exports('AddStress', function(value)
    drunkEffectIntensity = drunkEffectIntensity + value
end)


AddEventHandler("AddStressClient", function(value)

    drunkEffectIntensity = drunkEffectIntensity + value
end)

TSE = TriggerServerEvent


RegisterNetEvent("dyny:praskos")
AddEventHandler("dyny:praskos", function()
local playerPed = PlayerPedId()
TaskPlayAnim(playerPed, 'missheistdockssetup1clipboard@idle_a', 'pill', 8.0, -8, -1, 49, 0, 0, 0, 0)
lib.progressBar({
	duration = 5000,
	label = 'Vpícháš si adrenalín',
	useWhileDead = false,
	canCancel = false,
	disable = {
		car = true,
		move = false,
		combat = true,
		mouse = false,
	},
})
if drunkEffectIntensity >= 0.1 then
    TriggerServerEvent("stressdown")
    lib.notify({
        id = 'some_identifier',
        title = 'Stress',
        description = 'Stress snížen o 0.05!',
        position = 'top',
        style = {
            backgroundColor = '#141517',
            color = '#C1C2C5',
            ['.description'] = {
              color = '#909296'
            }
        },
        icon = 'fa-info-circle',
        iconColor = '#2305fa'
    })
drunkEffectIntensity = drunkEffectIntensity - 0.05
Citizen.Wait(5000)
lib.notify({
    id = 'some_identifier',
    title = 'Stress',
    description = 'Stress snížen o 0.05!',
    position = 'top',
    style = {
        backgroundColor = '#141517',
        color = '#C1C2C5',
        ['.description'] = {
          color = '#909296'
        }
    },
    icon = 'fa-info-circle',
    iconColor = '#2305fa'
})
drunkEffectIntensity = drunkEffectIntensity - 0.05
Citizen.Wait(8000)
lib.notify({
    id = 'some_identifier',
    title = 'Stress',
    description = 'Stress snížen o 0.05!',
    position = 'top',
    style = {
        backgroundColor = '#141517',
        color = '#C1C2C5',
        ['.description'] = {
          color = '#909296'
        }
    },
    icon = 'fa-info-circle',
    iconColor = '#2305fa'
})
drunkEffectIntensity = drunkEffectIntensity - 0.05
Citizen.Wait(10000)
lib.notify({
    id = 'some_identifier',
    title = 'Stress',
    description = 'Stress snížen o 0.05!',
    position = 'top',
    style = {
        backgroundColor = '#141517',
        color = '#C1C2C5',
        ['.description'] = {
          color = '#909296'
        }
    },
    icon = 'fa-info-circle',
    iconColor = '#2305fa'
})
drunkEffectIntensity = drunkEffectIntensity - 0.05
Citizen.Wait(15000)
lib.notify({
    id = 'some_identifier',
    title = 'Stress',
    description = 'Stress snížen o 0.05!',
    position = 'top',
    style = {
        backgroundColor = '#141517',
        color = '#C1C2C5',
        ['.description'] = {
          color = '#909296'
        }
    },
    icon = 'fa-info-circle',
    iconColor = '#2305fa'
})
drunkEffectIntensity = drunkEffectIntensity - 0.05
Citizen.Wait(15000)

else
    lib.notify({
        id = 'some_identifier',
        title = 'Stress',
        description = 'Nemůžeš si snížit stress když žádný nemáš troubo',
        position = 'top',
        style = {
            backgroundColor = '#141517',
            color = '#C1C2C5',
            ['.description'] = {
              color = '#909296'
            }
        },
        icon = 'fa-info-circle',
        iconColor = '#2305fa'
    })
end

end)



