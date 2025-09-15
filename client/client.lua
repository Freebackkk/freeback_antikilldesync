local playerHealth = GetEntityHealth(PlayerPedId())
local lastPos = GetEntityCoords(PlayerPedId())

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(Config.frequency)
        local currentHealth = GetEntityHealth(PlayerPedId())
        if currentHealth <= 0 and currentHealth ~= playerHealth then
            playerHealth = currentHealth
            TriggerServerEvent('sync:playerHealth', playerHealth)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(Config.frequency)
        local playerPos = GetEntityCoords(PlayerPedId())
        if GetEntityHealth(PlayerPedId()) <= 0 and playerPos ~= lastPos then
            lastPos = playerPos
            TriggerServerEvent('sync:playerPosition', playerPos)
        end
    end
end)

RegisterNetEvent('sync:playerDied')
AddEventHandler('sync:playerDied', function(playerId, health, position)
    if GetPlayerServerId(PlayerId()) ~= playerId then
        local playerPed = GetPlayerPed(GetPlayerFromServerId(playerId))
        if health <= 0 then
            SetEntityHealth(playerPed, health)
            SetEntityCoords(playerPed, position.x, position.y, position.z)
        end
    end
end)

RegisterNetEvent('sync:resetHealth')
AddEventHandler('sync:resetHealth', function(playerId)
    if GetPlayerServerId(PlayerId()) ~= playerId then
        local playerPed = GetPlayerPed(GetPlayerFromServerId(playerId))
        SetEntityHealth(playerPed, 200)
    end
end)
