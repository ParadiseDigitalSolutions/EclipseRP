CreateThread(function()
    if Config.ESX then 
        ESX = exports["es_extended"]:getSharedObject()
        triggerCallback = ESX.TriggerServerCallback
    else
        QBCore = exports['qb-core']:GetCoreObject() 
        triggerCallback = QBCore.Functions.TriggerCallback
    end 
end)

local signedIn = false
local onJob = false
local vehicleSpawned = false
local hasPackage = false
local jobDone = false

local function LoadAnimation(dict)
    RequestAnimDict(dict)
    repeat Wait(50) until HasAnimDictLoaded(dict)
end

local function Notification(msg, type)
    if Config.ESX then 
        ESX.ShowNotification(msg, type)
    else 
        QBCore.Functions.Notify(msg, type)
    end
end

local function targetBone(entity)
    local coords, _ = GetModelDimensions(GetEntityModel(entity))
    local tempCoords =  GetOffsetFromEntityInWorldCoords(entity, 0.0, coords.y - 0.5, 0.0)
    return #(tempCoords - GetEntityCoords(PlayerPedId())) <= 2.3
end

CreateThread(function()
    if Config.BossBlip.enableBlip then 
        local bossBlip = AddBlipForCoord(Config.BossCoords.xyz)
        SetBlipSprite(bossBlip, Config.BossBlip.blipType)
        SetBlipAsShortRange(bossBlip, true)
        SetBlipScale(bossBlip, 0.8)
        SetBlipColour(bossBlip, Config.BossBlip.blipColor)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.BossBlip.blipText)
        EndTextCommandSetBlipName(bossBlip)
    end

    RequestModel(Config.BossModel) 
    repeat Wait(50) until HasModelLoaded(Config.BossModel)

    local postBoss = CreatePed(2, Config.BossModel, Config.BossCoords.xyzw, false, false) 
    SetPedFleeAttributes(postBoss, 0, 0)
    SetPedDiesWhenInjured(postBoss, false)
    SetBlockingOfNonTemporaryEvents(postBoss, true)
    SetEntityInvincible(postBoss, true)
    FreezeEntityPosition(postBoss, true)

    exports['qb-target']:AddTargetEntity(postBoss, {
        options = {
            { 
                icon = "fa-solid fa-user",
                label = 'Sign In',
                canInteract = function(entity)
                    return not signedIn
                end,
                event = "qb-postop:client:signInOut"
            },
            { 
                num = 1, 
                label = 'Start Small Job',
                icon = "fa-solid fa-truck",
                canInteract = function(entity)
                    return signedIn and not onJob
                end,
                action = function()
                    TriggerEvent("qb-postop:client:startJob", "small")
                end,  
            },
            { 
                num = 2,
                label = 'Start Medium Job',
                icon = "fa-solid fa-truck",          
                canInteract = function(entity)
                    return signedIn and not onJob
                end,
                action = function()
                    TriggerEvent("qb-postop:client:startJob", "medium")
                end,  
            },
            { 
                num = 3, 
                label = 'Start Large Job',
                icon = "fa-solid fa-truck",
                canInteract = function(entity)
                    return signedIn and not onJob
                end,
                action = function()
                    TriggerEvent("qb-postop:client:startJob", "large")
                end,  
            },

            { 
                num = 4, 
                label = 'Sign Out',
                icon = "fa-solid fa-user",
                canInteract = function(entity)
                    return signedIn and not onJob
                end,
                event = "qb-postop:client:signInOut"
            },

            { 
                label = 'Collect Paycheck',
                icon = "fa-solid fa-user",
                canInteract = function(entity)
                    return signedIn and onJob and jobDone
                end,
                event = "qb-postop:client:collectPaycheck"    
            },
        },
        distance = 3.0
    })
end)

RegisterNetEvent('qb-postop:client:signInOut', function()
    if onJob then return end

    if not signedIn then 
        signedIn = true 
        Notification("You signed in to PostOP", 'success')
    else
        signedIn = false 
        Notification("You signed out of PostOP", 'error') 
    end
end)

RegisterNetEvent('qb-postop:client:startJob', function(jobType)
    if not signedIn then return end
    if onJob then return end

    onJob = true
    TriggerServerEvent('qb-postop:server:startJob', jobType)    
end)

RegisterNetEvent('qb-postop:client:collectPaycheck', function()
    if not signedIn then return end
    if not onJob then return end
    if not jobDone then return end

    local vehicleCoords = GetEntityCoords(jobVehicle)
    TriggerServerEvent('qb-postop:server:collectPaycheck', vehicleCoords)  
end)

RegisterNetEvent('qb-postop:client:createVehicle', function(deliveryLocation)
    for k, v in pairs(Config.VehicleSpawnLocations) do 
        if not IsAnyVehicleNearPoint(v.xyz, 2.0) then 
            vehicleSpawned = true
            spawnLocation = v
        end
    end

    if not vehicleSpawned then 
        onJob = false
        Notification("There isn't a spot for the vehicle", 'error')
        return 
    end
    Notification("Get in the delivery vehicle", 'success') 

    local vehicleHash = Config.Vehicle
    RequestModel(vehicleHash)
    repeat Wait(50) until HasModelLoaded(vehicleHash)

    jobVehicle = CreateVehicle(vehicleHash, spawnLocation.xyzw, true, true)
    if not Config.ESX then TriggerServerEvent("qb-vehiclekeys:server:AcquireVehicleKeys", GetVehicleNumberPlateText(jobVehicle)) end

    exports['qb-target']:AddTargetEntity(jobVehicle, { 
        options = {
            {
                label = 'Grab Goods',
                icon = 'fa-solid fa-box',
                event = "qb-postop:client:grabGoods",
                canInteract = function(entity)
                    if hasPackage then return false end 
                    return targetBone(entity)
                end,
            }
        },
        distance = 2.5, 
    })

    repeat Wait(500) until IsPedSittingInVehicle(PlayerPedId(), jobVehicle)
        TriggerEvent('qb-postop:client:newLocation', deliveryLocation)
end)

RegisterNetEvent('qb-postop:client:grabGoods', function()
    local vehicleCoords = GetEntityCoords(jobVehicle)
    triggerCallback('grabPackage', function(canGrab)
        if not canGrab then Notification("No packages left in the vehicle", 'error') return end

        hasPackage = true
        local randomBox = math.random(1, #Config.Prop)
        local chosenPackage = Config.Prop[randomBox]
        deliveryPackage = CreateObject(chosenPackage, 120, 100, 50, true, true, true)
        AttachEntityToEntity(deliveryPackage, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 0xEB95), 0.075, -0.10, 0.255, -130.0, 105.0, 0.0, true, true, false, true, 1, true)
        while true do 
            if hasPackage then
                if Config.DisableControlActions then
                    DisableControlAction(0, 21, true) -- Sprinting
                    DisableControlAction(0, 22, true) -- Jumping
                    DisableControlAction(0, 36, true) -- Ctrl
                    DisableControlAction(0, 24, true) -- Disable attack
                    DisableControlAction(0, 25, true) -- Disable aim
                    DisableControlAction(0, 47, true) -- Disable weapon
                    DisableControlAction(0, 58, true) -- Disable weapon
                    DisableControlAction(0, 263, true) -- Disable melee
                    DisableControlAction(0, 264, true) -- Disable melee
                    DisableControlAction(0, 257, true) -- Disable melee
                    DisableControlAction(0, 140, true) -- Disable melee
                    DisableControlAction(0, 141, true) -- Disable melee
                    DisableControlAction(0, 142, true) -- Disable melee
                    DisableControlAction(0, 143, true) -- Disable melee
                end
                if not IsEntityPlayingAnim(PlayerPedId(), 'anim@heists@box_carry@', 'idle', -1) then
                    LoadAnimation('anim@heists@box_carry@')
                    TaskPlayAnim(PlayerPedId(), 'anim@heists@box_carry@', 'idle', 6.0, -6.0, -1, 49, 0, 0, 0, 0)
                end
            else 
                ClearPedTasks(PlayerPedId())
                break
            end
            Wait(1)
        end
    end, vehicleCoords, hasPackage)
end)

RegisterNetEvent('qb-postop:client:newLocation', function(deliveryLocation)
    if not onJob then onJob = true end
    if deliveryLocationBlip then RemoveBlip(deliveryLocationBlip) end 

    Notification("Go to the assigned location", 'success')

    deliveryLocationBlip = AddBlipForCoord(deliveryLocation.xyz)
    SetBlipRoute(deliveryLocationBlip, true)

    exports['qb-target']:RemoveZone("deliveryLocation")
    exports['qb-target']:AddBoxZone("deliveryLocation", vector3(deliveryLocation.xyz), 1.5, 1.5, {
        name = "deliveryLocation",
        heading = deliveryLocation.w,
        debugPoly = false,
        minZ = deliveryLocation.z - 0.0, 
        maxZ = deliveryLocation.z + 0.7, 
    }, {
    options = {
        {
            label = 'Deliver',
            icon = "fa-solid fa-hand-holding", 
            event = "qb-postop:client:deliverPackage"
        },
    },
        distance = 10.0
    }) 
end)

RegisterNetEvent('qb-postop:client:deliverPackage', function()
    if not hasPackage then Notification("You're not holding a package", 'error') return end

    local vehicleCoords = GetEntityCoords(jobVehicle)
    triggerCallback('deliverPackage', function(canDeliver)
        if canDeliver then 
            DeleteEntity(deliveryPackage)
            ClearPedTasks(PlayerPedId())
            hasPackage = false
        end
    end, hasPackage, vehicleCoords)
end)

RegisterNetEvent('qb-postop:client:jobDone', function()
    if deliveryLocationBlip then RemoveBlip(deliveryLocationBlip) end 
    
    Notification("Job is done, head to the boss", 'success')

    exports['qb-target']:RemoveZone("deliveryLocation")
    exports['qb-target']:RemoveTargetEntity(jobVehicle, 'Grab Goods')

    SetNewWaypoint(Config.BossCoords.xy)
    jobDone = true
end)

RegisterNetEvent('qb-postop:client:resetPlayer', function()
    jobDone = false
    onJob = false 
    hasPackage = false
    DeleteEntity(jobVehicle)
end)

