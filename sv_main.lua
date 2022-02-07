local QBCore = nil

local ESX = nil

local calls = 0

function isAuth(job)
    for i = 1, #Config["AuthorizedJobs"] do
        if job == Config["AuthorizedJobs"][i] then
            return true
        end
    end
    return false
end

LoadQBCoreVersion = function()
    RegisterServerEvent("dispatch:svNotify", function(data)
        calls = calls + 1
        for idx, id in pairs(QBCore.Functions.GetPlayers()) do
            local xPlayer = QBCore.Functions.GetPlayer(id)
            if isAuth(xPlayer.PlayerData.job.name) then
                TriggerClientEvent('dispatch:clNotify', xPlayer.PlayerData.source, data, calls)
            end
        end 
    end)
    RegisterServerEvent("un-dispatch:bankrobbery", function(coords)
        for idx, id in pairs(QBCore.Functions.GetPlayers()) do
            local xPlayer = QBCore.Functions.GetPlayer(id)
            if isAuth(xPlayer.PlayerData.job.name) then
                TriggerClientEvent("un-dispatch:createBlip", xPlayer.PlayerData.source, "bankrobbery", coords)
            end
        end
    end)
    RegisterServerEvent("un-dispatch:storerobbery", function(coords)
        for idx, id in pairs(QBCore.Functions.GetPlayers()) do
            local xPlayer = QBCore.Functions.GetPlayer(id)
            if isAuth(xPlayer.PlayerData.job.name) then
                TriggerClientEvent("un-dispatch:createBlip", xPlayer.PlayerData.source, "storerobbery", coords)
            end
        end
    end)
    RegisterServerEvent("un-dispatch:houserobbery", function(coords)
        for idx, id in pairs(QBCore.Functions.GetPlayers()) do
            local xPlayer = QBCore.Functions.GetPlayer(id)
            if isAuth(xPlayer.PlayerData.job.name) then
                TriggerClientEvent("un-dispatch:createBlip", xPlayer.PlayerData.source, "houserobbery", coords)
            end
        end
    end)
    RegisterServerEvent("un-dispatch:jewelrobbery", function(coords)
        for idx, id in pairs(QBCore.Functions.GetPlayers()) do
            local xPlayer = QBCore.Functions.GetPlayer(id)
            if isAuth(xPlayer.PlayerData.job.name) then
                TriggerClientEvent("un-dispatch:createBlip", xPlayer.PlayerData.source, "jewelrobbery", coords)
            end
        end
    end)
    RegisterServerEvent("un-dispatch:jailbreak", function(coords)
        for idx, id in pairs(QBCore.Functions.GetPlayers()) do
            local xPlayer = QBCore.Functions.GetPlayer(id)
            if isAuth(xPlayer.PlayerData.job.name) then
                TriggerClientEvent("un-dispatch:createBlip", xPlayer.PlayerData.source, "jailbreak", coords)
            end
        end
    end)
    RegisterServerEvent("un-dispatch:carjacking", function(coords)
        for idx, id in pairs(QBCore.Functions.GetPlayers()) do
            local xPlayer = QBCore.Functions.GetPlayer(id)
            if isAuth(xPlayer.PlayerData.job.name) then
                TriggerClientEvent("un-dispatch:createBlip", xPlayer.PlayerData.source, "carjacking", coords)
            end
        end
    end)
    RegisterServerEvent("un-dispatch:gunshot", function(coords)
        for idx, id in pairs(QBCore.Functions.GetPlayers()) do
            local xPlayer = QBCore.Functions.GetPlayer(id)
            if isAuth(xPlayer.PlayerData.job.name) then
                TriggerClientEvent("un-dispatch:createBlip", xPlayer.PlayerData.source, "gunshot", coords)
            end
        end
    end)
end

LoadESXVersion = function()
    RegisterServerEvent("dispatch:svNotify", function(data)
        calls = calls + 1
        for idx, id in pairs(ESX.GetPlayers()) do
            local xPlayer = ESX.GetPlayerFromId(id)
            if isAuth(xPlayer.job.name) then
                TriggerClientEvent('dispatch:clNotify', xPlayer.source, data, calls)
            end
        end 
    end)
    RegisterServerEvent("un-dispatch:bankrobbery", function(coords)
        for idx, id in pairs(ESX.GetPlayers()) do
            local xPlayer = ESX.GetPlayerFromId(id)
            if isAuth(xPlayer.job.name) then
                TriggerClientEvent("un-dispatch:createBlip", xPlayer.source, "bankrobbery", coords)
            end
        end
    end)
    RegisterServerEvent("un-dispatch:storerobbery", function(coords)
        for idx, id in pairs(ESX.GetPlayers()) do
            local xPlayer = ESX.GetPlayerFromId(id)
            if isAuth(xPlayer.job.name) then
                TriggerClientEvent("un-dispatch:createBlip", xPlayer.source, "storerobbery", coords)
            end
        end
    end)
    RegisterServerEvent("un-dispatch:houserobbery", function(coords)
        for idx, id in pairs(ESX.GetPlayers()) do
            local xPlayer = ESX.GetPlayerFromId(id)
            if isAuth(xPlayer.job.name) then
                TriggerClientEvent("un-dispatch:createBlip", xPlayer.source, "houserobbery", coords)
            end
        end
    end)
    RegisterServerEvent("un-dispatch:jewelrobbery", function(coords)
        for idx, id in pairs(ESX.GetPlayers()) do
            local xPlayer = ESX.GetPlayerFromId(id)
            if isAuth(xPlayer.job.name) then
                TriggerClientEvent("un-dispatch:createBlip", xPlayer.source, "jewelrobbery", coords)
            end
        end
    end)
    RegisterServerEvent("un-dispatch:jailbreak", function(coords)
        for idx, id in pairs(ESX.GetPlayers()) do
            local xPlayer = ESX.GetPlayerFromId(id)
            if isAuth(xPlayer.job.name) then
                TriggerClientEvent("un-dispatch:createBlip", xPlayer.source, "jailbreak", coords)
            end
        end
    end)
    RegisterServerEvent("un-dispatch:carjacking", function(coords)
        for idx, id in pairs(ESX.GetPlayers()) do
            local xPlayer = ESX.GetPlayerFromId(id)
            if isAuth(xPlayer.job.name) then
                TriggerClientEvent("un-dispatch:createBlip", xPlayer.source, "carjacking", coords)
            end
        end
    end)
    RegisterServerEvent("un-dispatch:gunshot", function(coords)
        for idx, id in pairs(ESX.GetPlayers()) do
            local xPlayer = ESX.GetPlayerFromId(id)
            if isAuth(xPlayer.job.name) then
                TriggerClientEvent("un-dispatch:createBlip", xPlayer.source, "gunshot", coords)
            end
        end
    end)
end

LoadNopixelVersion = function()
    RegisterServerEvent("dispatch:svNotify", function(data)
        calls = calls + 1
        for idx, id in pairs(GetPlayers()) do
            local xPlayer = exports[Config["CoreSettings"]["NPBase"]["CoreName"]]:getModule("Player"):GetUser(tonumber(id))
            if isAuth(xPlayer.job) then
                TriggerClientEvent('dispatch:clNotify', xPlayer.source, data, calls)
            end
        end 
    end)
    RegisterServerEvent("un-dispatch:bankrobbery", function(coords)
        for idx, id in pairs(GetPlayers()) do
            local xPlayer = exports[Config["CoreSettings"]["NPBase"]["CoreName"]]:getModule("Player"):GetUser(tonumber(id))
            if isAuth(xPlayer.job) then
                TriggerClientEvent("un-dispatch:createBlip", xPlayer.source, "bankrobbery", coords)
            end
        end
    end)
    RegisterServerEvent("un-dispatch:storerobbery", function(coords)
        for idx, id in pairs(GetPlayers()) do
            local xPlayer = exports[Config["CoreSettings"]["NPBase"]["CoreName"]]:getModule("Player"):GetUser(tonumber(id))
            if isAuth(xPlayer.job) then
                TriggerClientEvent("un-dispatch:createBlip", xPlayer.source, "storerobbery", coords)
            end
        end
    end)
    RegisterServerEvent("un-dispatch:houserobbery", function(coords)
        for idx, id in pairs(GetPlayers()) do
            local xPlayer = exports[Config["CoreSettings"]["NPBase"]["CoreName"]]:getModule("Player"):GetUser(tonumber(id))
            if isAuth(xPlayer.job) then
                TriggerClientEvent("un-dispatch:createBlip", xPlayer.source, "houserobbery", coords)
            end
        end
    end)
    RegisterServerEvent("un-dispatch:jewelrobbery", function(coords)
        for idx, id in pairs(GetPlayers()) do
            local xPlayer = exports[Config["CoreSettings"]["NPBase"]["CoreName"]]:getModule("Player"):GetUser(tonumber(id))
            if isAuth(xPlayer.job) then
                TriggerClientEvent("un-dispatch:createBlip", xPlayer.source, "jewelrobbery", coords)
            end
        end
    end)
    RegisterServerEvent("un-dispatch:jailbreak", function(coords)
        for idx, id in pairs(GetPlayers()) do
            local xPlayer = exports[Config["CoreSettings"]["NPBase"]["CoreName"]]:getModule("Player"):GetUser(tonumber(id))
            if isAuth(xPlayer.job) then
                TriggerClientEvent("un-dispatch:createBlip", xPlayer.source, "jailbreak", coords)
            end
        end
    end)
    RegisterServerEvent("un-dispatch:carjacking", function(coords)
        for idx, id in pairs(GetPlayers()) do
            local xPlayer = exports[Config["CoreSettings"]["NPBase"]["CoreName"]]:getModule("Player"):GetUser(tonumber(id))
            if isAuth(xPlayer.job) then
                TriggerClientEvent("un-dispatch:createBlip", xPlayer.source, "carjacking", coords)
            end
        end
    end)
    RegisterServerEvent("un-dispatch:gunshot", function(coords)
        for idx, id in pairs(GetPlayers()) do
            local xPlayer = exports[Config["CoreSettings"]["NPBase"]["CoreName"]]:getModule("Player"):GetUser(tonumber(id))
            if isAuth(xPlayer.job) then
                TriggerClientEvent("un-dispatch:createBlip", xPlayer.source, "gunshot", coords)
            end
        end
    end)
end

Citizen.CreateThread(function()
    if Config["CoreSettings"]["Core"] == "qbcore" then
        if Config["CoreSettings"]["QBCore"]["QBCoreVersion"] == "new" then
            QBCore = Config["CoreSettings"]["QBCore"]["QBCoreExport"]
        elseif Config["CoreSettings"]["QBCore"]["QBCoreVersion"] == "old" then
            TriggerEvent(Config["CoreSettings"]["QBCore"]["QBUSTrigger"], function(obj) QBCore = obj end)
        end
        LoadQBCoreVersion()
    elseif Config["CoreSettings"]["Core"] == "esx" then
        TriggerEvent(Config["CoreSettings"]["ESX"]["ESXTrigger"], function(obj) ESX = obj end)
        LoadESXVersion()
    elseif Config["CoreSettings"]["Core"] == "npbase" then
        LoadNopixelVersion()
    end
end)