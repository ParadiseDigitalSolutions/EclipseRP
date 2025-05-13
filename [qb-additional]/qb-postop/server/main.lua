CreateThread(function()
    if Config.ESX then 
        ESX = exports["es_extended"]:getSharedObject()
        callback = ESX.RegisterServerCallback
    else
        QBCore = exports['qb-core']:GetCoreObject()
        callback = QBCore.Functions.CreateCallback
    end 
end)

local currentJob = {}

local function Notification(source, text, notifyType)
    if Config.ESX then 
        local xPlayer = ESX.GetPlayerFromId(source)
        xPlayer.showNotification(text)
    else 
        TriggerClientEvent('QBCore:Notify', source, text, notifyType)
    end
end

RegisterNetEvent('qb-postop:server:startJob', function(jobType)
    if #(GetEntityCoords(GetPlayerPed(source)) - vector3(Config.BossCoords.xyz)) > 5.0 then return end

    local randomLocation = math.random(1, #Config.DeliveryLocations)
    local deliveryLocation = Config.DeliveryLocations[randomLocation]
    local deliveryLocationAmount
    if jobType == "small" then
        deliveryLocationAmount = math.random(Config.DeliveryLocationAmount.smallJobs.minAmount, Config.DeliveryLocationAmount.smallJobs.maxAmount)
    elseif jobType == "medium" then
        deliveryLocationAmount = math.random(Config.DeliveryLocationAmount.mediumJobs.minAmount, Config.DeliveryLocationAmount.mediumJobs.maxAmount)
    elseif jobType == "large" then
        deliveryLocationAmount = math.random(Config.DeliveryLocationAmount.largeJobs.minAmount, Config.DeliveryLocationAmount.largeJobs.maxAmount)
    end

    local packagesAmount
    if jobType == "small" then
        packagesAmount = math.random(Config.PackagesAmount.smallJobs.minAmount, Config.PackagesAmount.smallJobs.maxAmount)
    elseif jobType == "medium" then
        packagesAmount = math.random(Config.PackagesAmount.mediumJobs.minAmount, Config.PackagesAmount.mediumJobs.maxAmount)
    elseif jobType == "large" then
        packagesAmount = math.random(Config.PackagesAmount.largeJobs.minAmount, Config.PackagesAmount.largeJobs.maxAmount)
    end

    local playerName = GetPlayerName(source)
    currentJob[playerName] = {
        jobType = jobType,
        deliveryLocation = deliveryLocation, 
        deliveryLocationsDone = 0,
        deliveryLocationAmount = deliveryLocationAmount, 
        packagesDelivered = 0,
        packagesAmount = packagesAmount,
        totalDeliveries = 0,
        history = {
            [randomLocation] = true,
        },
    }
    TriggerClientEvent('qb-postop:client:createVehicle', source, currentJob[playerName].deliveryLocation)
end)

CreateThread(function()
    callback('grabPackage', function(source, cb, vehicleCoords, hasPackage)
        local playerName = GetPlayerName(source)
        if hasPackage then return end
        if #(GetEntityCoords(GetPlayerPed(source)) - vehicleCoords) > 5.0 then return end   
        if #(vehicleCoords - vector3(currentJob[playerName].deliveryLocation)) > 50.0 then Notification(source, "Get closer to the delivery location", 'error') return end
         
        if currentJob[playerName].packagesDelivered <= currentJob[playerName].packagesAmount then 
            currentJob[playerName].packagesDelivered = currentJob[playerName].packagesDelivered + 1
            currentJob[playerName].totalDeliveries = currentJob[playerName].totalDeliveries + 1
            cb(true)
        else
            cb(false)
        end  
    end)

    callback('deliverPackage', function(source, cb, hasPackage, vehicleCoords)
        local playerName = GetPlayerName(source)
        if not hasPackage then return end
        if #(vehicleCoords - vector3(currentJob[playerName].deliveryLocation)) > 100.0 then Notification(source, "Vehicle is too far away", 'error') return end

        cb(true)
        if currentJob[playerName].packagesDelivered < currentJob[playerName].packagesAmount then 
            Notification(source, "Packages delivered: (".. currentJob[playerName].packagesDelivered .."/".. currentJob[playerName].packagesAmount ..")", 'success')
        elseif currentJob[playerName].packagesDelivered == currentJob[playerName].packagesAmount then 
            Notification(source, "Packages delivered: (".. currentJob[playerName].packagesDelivered .."/".. currentJob[playerName].packagesAmount ..")", 'success')

            currentJob[playerName].deliveryLocationsDone = currentJob[playerName].deliveryLocationsDone + 1
            if currentJob[playerName].deliveryLocationAmount > currentJob[playerName].deliveryLocationsDone then 
                currentJob[playerName].packagesDelivered = 0

                local randomLocation = math.random(1, #Config.DeliveryLocations)
                while currentJob[playerName].history[randomLocation] do 
                    randomLocation = math.random(1, #Config.DeliveryLocations)
                    Wait(10)
                end
                local deliveryLocation = Config.DeliveryLocations[randomLocation]
                currentJob[playerName].history[randomLocation] = true

                currentJob[playerName].deliveryLocation = deliveryLocation

                local packagesAmount
                if currentJob[playerName].jobType == "small" then
                    packagesAmount = math.random(Config.PackagesAmount.smallJobs.minAmount, Config.PackagesAmount.smallJobs.maxAmount)
                elseif currentJob[playerName].jobType == "medium" then
                    packagesAmount = math.random(Config.PackagesAmount.mediumJobs.minAmount, Config.PackagesAmount.mediumJobs.maxAmount)
                elseif currentJob[playerName].jobType == "large" then
                    packagesAmount = math.random(Config.PackagesAmount.largeJobs.minAmount, Config.PackagesAmount.largeJobs.maxAmount)
                end
                currentJob[playerName].packagesAmount = packagesAmount

                TriggerClientEvent('qb-postop:client:newLocation', source, currentJob[playerName].deliveryLocation)
            else 
                TriggerClientEvent('qb-postop:client:jobDone', source)
            end
        end
    end)   
end)

RegisterNetEvent('qb-postop:server:collectPaycheck', function(vehicleCoords)
    if #(GetEntityCoords(GetPlayerPed(source)) - vector3(Config.BossCoords.xyz)) > 5.0 then return end
    if #(vector3(Config.BossCoords.xyz) - vehicleCoords) > 35.0 then Notification(source, "Vehicle is too far away", 'error') return end

    local playerName = GetPlayerName(source)
    if currentJob[playerName].deliveryLocationAmount == currentJob[playerName].deliveryLocationsDone and currentJob[playerName].packagesDelivered == currentJob[playerName].packagesAmount then 
        TriggerClientEvent('qb-postop:client:resetPlayer', source)
        local paycheckAmount = Config.MoneyPerPackage * currentJob[playerName].totalDeliveries

        if Config.ESX then 
            local xPlayer = ESX.GetPlayerFromId(source)
            xPlayer.addAccountMoney('bank', paycheckAmount)
        else
            local Player = QBCore.Functions.GetPlayer(source)
            Player.Functions.AddMoney("bank", paycheckAmount, "PostOP")
        end 
        Notification(source, "You collected a paycheck of: $".. paycheckAmount .."", 'success')
        currentJob[playerName] = nil
    else
        Notification(source, "Your job is not done", "error")
    end 
end)