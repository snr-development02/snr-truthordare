-- SNR STORE | https://discord.gg/TtHFpf3enK
local QBCore = nil
local ESX = nil
    
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        if Config.ESXorQBorNewQB == "esx" then
            ESX = nil
            Citizen.CreateThread(function()
                while ESX == nil do
                    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
                    Citizen.Wait(0)
                end
                ESX.PlayerData = ESX.GetPlayerData()
            end)
	        break
        elseif Config.ESXorQBorNewQB == "qb" then
            QBCore = nil
            Citizen.CreateThread(function()
            while QBCore == nil do
                TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
                Citizen.Wait(30) -- Saniye Bekletme
            end
            end)
	        break
        elseif Config.ESXorQBorNewQB == "newqb" then
            QBCore = exports['qb-core']:GetCoreObject()
	        break
        else
            Citizen.CreateThread(function()
                while true do
                    Citizen.Wait(500)
                    print(locale.uyari)
                end
            end)
        end
    end
end)

Citizen.Wait(3000)
print("Selected Core: " .. Config.ESXorQBorNewQB)

RegisterNetEvent("dogruluk-cesaret:server:rotate", function(x,y,z,number)
    TriggerClientEvent('dogruluk-cesaret:client:rotate', -1, x,y,z,number)
end)

if Config.ESXorQBorNewQB == "esx" then
    ESX.RegisterUsableItem(Config.ItemName, function(source, item)
        local Player = ESX.GetPlayerFromId(source)
        TriggerClientEvent("snr-cevirsise", source)
        Player.removeInventoryItem(Config.ItemName, 1)
        Citizen.Wait(19000)
        Player.addInventoryItem(Config.ItemName, 1)
    end)
else
    QBCore.Functions.CreateUseableItem(Config.ItemName, function(source, item)
        local Player = QBCore.Functions.GetPlayer(source)
        TriggerClientEvent("snr-cevirsise", source)
        Player.Functions.RemoveItem(Config.ItemName, 1)
        Citizen.Wait(19000)
        Player.Functions.AddItem(Config.ItemName, 1)
    end)
end
