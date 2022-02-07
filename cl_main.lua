local QBCore = nil

local ESX = nil

function GetStreetAndZone()
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    local currentStreetHash, intersectStreetHash = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local currentStreetName = GetStreetNameFromHashKey(currentStreetHash)
    local area = GetLabelText(tostring(GetNameOfZone(coords.x, coords.y, coords.z)))
    local playerStreetsLocation = area
    if not zone then zone = "UNKNOWN" end
    if currentStreetName ~= nil and currentStreetName ~= "" then playerStreetsLocation = currentStreetName .. ", " ..area
    else playerStreetsLocation = area end
    return playerStreetsLocation
end

Citizen.CreateThread(function()
    local cooldown = 0
    local isBusy = false
	while true do
		Citizen.Wait(0)
        local playerPed = PlayerPedId()
        if IsPedTryingToEnterALockedVehicle(playerPed) or IsPedJacking(playerPed) and Config["AutoAlerts"]["CarJacking"] then
            Citizen.Wait(3000)
			local vehicle = GetVehiclePedIsIn(playerPed, true)
            TriggerEvent("un-dispatch:carjacking", {
                model = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))),
                plate = GetVehicleNumberPlateText(vehicle),
                firstColor = GetVehicleCustomPrimaryColour(vehicle),
                secondColor = GetVehicleCustomSecondaryColour(vehicle),
                heading = GetEntityHeading(vehicle)
            })
        elseif IsPedShooting(playerPed) and (cooldown == 0 or cooldown - GetGameTimer() < 0) and not isBusy and Config["AutoAlerts"]["GunshotAlert"] then
            isBusy = true
            if IsPedCurrentWeaponSilenced(playerPed) then
                cooldown = GetGameTimer() + math.random(25000, 30000)
                TriggerEvent("un-dispatch:gunshot")
            else
                cooldown = GetGameTimer() + math.random(15000, 20000)
                TriggerEvent("un-dispatch:gunshot")
            end
            isBusy = false
        end
    end
end)

RegisterNetEvent("un-dispatch:createBlip", function(type, coords)
    if type == "bankrobbery" then
        local alpha = 250
        local Blip = AddBlipForCoord(coords)
        SetBlipSprite(Blip, 161)
        SetBlipColour(Blip, 46)
        SetBlipScale(Blip, 1.5)
        SetBlipAsShortRange(Blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString('10-90 Bank Robbery In Progress')
        EndTextCommandSetBlipName(Blip)
        while alpha ~= 0 do
            Citizen.Wait(120 * 4)
            alpha = alpha - 1
            SetBlipAlpha(Blip, alpha)
            if alpha == 0 then
                RemoveBlip(Blip)
                return
            end
        end
    elseif type == "storerobbery" then
        local alpha = 250
        local Blip = AddBlipForCoord(coords)
        SetBlipSprite(Blip, 52)
        SetBlipColour(Blip, 1)
        SetBlipScale(Blip, 1.5)
        SetBlipAsShortRange(Blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString('10-90 Store Robbery In Progress')
        EndTextCommandSetBlipName(Blip)
        while alpha ~= 0 do
            Citizen.Wait(120 * 4)
            alpha = alpha - 1
            SetBlipAlpha(Blip, alpha)
            if alpha == 0 then
                RemoveBlip(Blip)
                return
            end
        end
    elseif type == "houserobbery" then
        local alpha = 250
        local Blip = AddBlipForCoord(coords)
        SetBlipSprite(Blip, 411)
        SetBlipColour(Blip, 1)
        SetBlipScale(Blip, 1.5)
        SetBlipAsShortRange(Blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString('10-90 House Robbery In Progress')
        EndTextCommandSetBlipName(Blip)
        while alpha ~= 0 do
            Citizen.Wait(120 * 4)
            alpha = alpha - 1
            SetBlipAlpha(Blip, alpha)
            if alpha == 0 then
                RemoveBlip(Blip)
                return
            end
        end
    elseif type == "jewelrobbery" then
        local alpha = 250
        local Blip = AddBlipForCoord(coords)
        SetBlipSprite(Blip, 434)
        SetBlipColour(Blip, 66)
        SetBlipScale(Blip, 1.5)
        SetBlipAsShortRange(Blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString('10-90 Vangelico Robbery In Progress')
        EndTextCommandSetBlipName(Blip)
        while alpha ~= 0 do
            Citizen.Wait(120 * 4)
            alpha = alpha - 1
            SetBlipAlpha(Blip, alpha)
            if alpha == 0 then
                RemoveBlip(Blip)
                return
            end
        end
    elseif type == "jailbreak" then
        local alpha = 250
        local Blip = AddBlipForCoord(coords)
        SetBlipSprite(Blip, 487)
        SetBlipColour(Blip, 4)
        SetBlipScale(Blip, 1.5)
        SetBlipAsShortRange(Blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString('10-98 Jail Break In Progress')
        EndTextCommandSetBlipName(Blip)
        while alpha ~= 0 do
            Citizen.Wait(120 * 4)
            alpha = alpha - 1
            SetBlipAlpha(Blip, alpha)
            if alpha == 0 then
                RemoveBlip(Blip)
                return
            end
        end
    elseif type == "carjacking" then
        local alpha = 250
        local Blip = AddBlipForCoord(coords)
        SetBlipSprite(Blip, 488)
        SetBlipColour(Blip, 1)
        SetBlipScale(Blip, 1.5)
        SetBlipAsShortRange(Blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString('10-90 Vehicle Theft In Progress')
        EndTextCommandSetBlipName(Blip)
        while alpha ~= 0 do
            Citizen.Wait(120 * 4)
            alpha = alpha - 1
            SetBlipAlpha(Blip, alpha)
            if alpha == 0 then
                RemoveBlip(Blip)
                return
            end
        end
    elseif type == "gunshot" then
        local alpha = 250
        local Blip = AddBlipForRadius(coords, 75.0)
        SetBlipColour(Blip, 1)
        SetBlipAsShortRange(Blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString('10-60 Shots Fired')
        EndTextCommandSetBlipName(Blip)
        while alpha ~= 0 do
            Citizen.Wait(120 * 4)
            alpha = alpha - 1
            SetBlipAlpha(Blip, alpha)
            if alpha == 0 then
                RemoveBlip(Blip)
                return
            end
        end
    end
end)

RegisterNetEvent("dispatch:clNotify", function(data, id)
    SendNUIMessage({
        update = "newCall",
        callID = id,
        data = data,
        timer = 5000
    })
end)

RegisterNetEvent("un-dispatch:bankrobbery", function()
    local playerPed = PlayerPedId()
    local currentPos = GetEntityCoords(playerPed)
    local gender = IsPedMale(playerPed)
    TriggerServerEvent('dispatch:svNotify', {
        dispatchCode = "10-90",
        firstStreet = GetStreetAndZone(),
        gender = gender,
        priority = 1,
        origin = {x = currentPos.x, y = currentPos.y, z = currentPos.z},
        dispatchMessage = "Bank Robbery"
    })
    TriggerServerEvent("un-dispatch:bankrobbery", currentPos)
end)

RegisterNetEvent("un-dispatch:storerobbery", function()
    local playerPed = PlayerPedId()
    local currentPos = GetEntityCoords(playerPed)
    local gender = IsPedMale(playerPed)
    TriggerServerEvent('dispatch:svNotify', {
        dispatchCode = "10-90",
        firstStreet = GetStreetAndZone(),
        gender = gender,
        priority = 2,
        origin = {x = currentPos.x, y = currentPos.y, z = currentPos.z},
        dispatchMessage = "Store Robbery"
    })
    TriggerServerEvent("un-dispatch:storerobbery", currentPos)
end)

RegisterNetEvent("un-dispatch:houserobbery", function()
    local playerPed = PlayerPedId()
    local currentPos = GetEntityCoords(playerPed)
    local gender = IsPedMale(playerPed)
    TriggerServerEvent('dispatch:svNotify', {
        dispatchCode = "10-90",
        firstStreet = GetStreetAndZone(),
        gender = gender,
        priority = 2,
        origin = {x = currentPos.x, y = currentPos.y, z = currentPos.z},
        dispatchMessage = "House Robbery"
    })
    TriggerServerEvent("un-dispatch:houserobbery", currentPos)
end)

RegisterNetEvent("un-dispatch:jewelrobbery", function()
    local playerPed = PlayerPedId()
    local currentPos = GetEntityCoords(playerPed)
    local gender = IsPedMale(playerPed)
    TriggerServerEvent('dispatch:svNotify', {
        dispatchCode = "10-90",
        firstStreet = GetStreetAndZone(),
        gender = gender,
        priority = 2,
        origin = {x = currentPos.x, y = currentPos.y, z = currentPos.z},
        dispatchMessage = "Vangelico Robbery"
    })
    TriggerServerEvent("un-dispatch:jewelrobbery", currentPos)
end)

RegisterNetEvent("un-dispatch:jailbreak", function()
    local playerPed = PlayerPedId()
    local currentPos = GetEntityCoords(playerPed)
    local gender = IsPedMale(playerPed)
    TriggerServerEvent('dispatch:svNotify', {
        dispatchCode = "10-98",
        firstStreet = GetStreetAndZone(),
        gender = gender,
        priority = 1,
        origin = {x = currentPos.x, y = currentPos.y, z = currentPos.z},
        dispatchMessage = "Jail Break"
    })
    TriggerServerEvent("un-dispatch:jailbreak", currentPos)
end)

RegisterNetEvent("un-dispatch:carjacking", function(data)
    local playerPed = PlayerPedId()
    local currentPos = GetEntityCoords(playerPed)
    local gender = IsPedMale(playerPed)
    TriggerServerEvent('dispatch:svNotify', {
        dispatchCode = "10-90",
        firstStreet = GetStreetAndZone(),
        gender = gender,
        model = data.model,
        plate = data.plate,
        firstColor = data.firstColor,
        secondColor = data.secondColor,
        heading = data.heading,
        priority = 3,
        origin = {x = currentPos.x, y = currentPos.y, z = currentPos.z},
        dispatchMessage = "Vehicle Theft"
    })
    TriggerServerEvent("un-dispatch:carjacking", currentPos)
end)

RegisterNetEvent("un-dispatch:gunshot", function()
    local playerPed = PlayerPedId()
    local currentPos = GetEntityCoords(playerPed)
    local gender = IsPedMale(playerPed)
    TriggerServerEvent('dispatch:svNotify', {
        dispatchCode = "10-60",
        firstStreet = GetStreetAndZone(),
        gender = gender,
        priority = 2,
        origin = {x = currentPos.x, y = currentPos.y, z = currentPos.z},
        dispatchMessage = "Shots Fired"
    })
    TriggerServerEvent("un-dispatch:gunshot", currentPos)
end)