ESX = exports["es_extended"]:getSharedObject()

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler('esx:onPlayerDeath', function(playerId, reason)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    if xPlayer then
        local playerPed = GetPlayerPed(playerId)
        local health = GetEntityHealth(playerPed)
        local position = GetEntityCoords(playerPed)
        
        TriggerClientEvent('sync:playerDied', -1, playerId, health, position)
    end
end)

AddEventHandler('playerDropped', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        TriggerClientEvent('sync:resetHealth', -1, source)
    end
end)