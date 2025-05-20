if Config.Version == "new" then

    QBCore = exports['qb-core']:GetCoreObject()

elseif Config.Version == "old" then
    local QBCore = nil
    CreateThread(function()
        while QBCore == nil do
            TriggerEvent("QBCore:GetObject", function(obj)QBCore = obj end)
            Wait(200)
        end
    end)
end

local timeOut = false
local alarmTriggered = false
local Cooldown = false

-- First Item Needed
QBCore.Functions.CreateUseableItem("thermite", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("thermite:UseThermite", source)
 end)

-- Second Item Needed
QBCore.Functions.CreateUseableItem("sec_d", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent('hackinglaptop:UseHackinglaptop',source)
 end)

RegisterServerEvent("Peely-particleserver")
AddEventHandler("Peely-particleserver", function(method)
    TriggerClientEvent("Peely-ptfxparticle", -1, method)
end)

RegisterServerEvent("Peely-particleserversec")
AddEventHandler("Peely-particleserversec", function(method)
    TriggerClientEvent("Peely-ptfxparticlesec", -1, method)
end)

RegisterServerEvent('rl-jewellery:server:SetJewelLocations')
AddEventHandler('rl-jewellery:server:SetJewelLocations', function()
    local src = source 
    TriggerClientEvent("rl-jewellery:server:SetJewelLocations", src, Config.JewelLocation)
end)

-- Register Cool Down Events For Locations
RegisterServerEvent('rl-jewellery:Server:BeginCooldown')
AddEventHandler('rl-jewellery:Server:BeginCooldown', function()
    Cooldown = true
    local timer = Config.Cooldown * 60000
    while timer > 0 do
        Wait(1000)
        timer = timer - 1000
        if timer == 0 then
            Cooldown = false
        end
    end
end)

-- CallBack For CoolDown
QBCore.Functions.CreateCallback("rl-jewellery:Callback:Cooldown",function(source, cb)
    if Cooldown then
        cb(true)
    else
        cb(false)
        
    end
end)

-- Callback For Cops
QBCore.Functions.CreateCallback('rl-jewellery:server:getCops', function(source, cb)
	local amount = 0
    for k, v in pairs(QBCore.Functions.GetQBPlayers()) do
        if v.PlayerData.job.name == "police" and v.PlayerData.job.onduty then
            amount = amount + 1
        end
    end
    cb(amount)
end)

-- Hack On Roof Of Vangelico
RegisterServerEvent('rl-jewellery:server:SetThermiteSecurityStatus')
AddEventHandler('rl-jewellery:server:SetThermiteSecurityStatus', function(stateType, state)
    if stateType == "isBusy" then
        Config.JewelLocation["ThermiteSecurity"].isBusy = state
    elseif stateType == "isDone" then
        Config.JewelLocation["ThermiteSecurity"].isDone = state
    end
    TriggerClientEvent('rl-jewellery:client:SetThermiteSecurityStatus', -1, stateType, state)
    TriggerEvent('qb-scoreboard:server:SetActivityBusy', "jewellery", false)
end)

-- Disbaled Cameras In Vangelico
RegisterServerEvent('rl-jewellery:server:SetCameraStatus')
AddEventHandler('rl-jewellery:server:SetCameraStatus', function(stateType, state)
    if stateType == "isBusy" then
        Config.JewelLocation["DisableCameras"].isBusy = state
    elseif stateType == "isDone" then
        Config.JewelLocation["DisableCameras"].isDone = state
    end
    TriggerClientEvent('rl-jewellery:client:SetCameraStatus', -1, stateType, state)
end)

-- Callback

QBCore.Functions.CreateCallback('rl-jewellery:server:getCops', function(source, cb)
	local amount = 0
    for k, v in pairs(QBCore.Functions.GetQBPlayers()) do
        if v.PlayerData.job.name == "police" and v.PlayerData.job.onduty then
            amount = amount + 1
        end
    end
    cb(amount)
end)

-- Events

RegisterNetEvent('rl-jewellery:server:setVitrineState', function(stateType, state, k)
    Config.Locations[k][stateType] = state
    TriggerClientEvent('rl-jewellery:client:setVitrineState', -1, stateType, state, k)
end)

RegisterNetEvent('rl-jewellery:server:vitrineReward', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local otherchance = math.random(100, 100)
    local odd = math.random(100, 100)

    if otherchance == odd then
        local item = math.random(1, #Config.VitrineRewards)
        local amount = math.random(Config.VitrineRewards[item]["amount"]["min"], Config.VitrineRewards[item]["amount"]["max"])
        if Player.Functions.AddItem(Config.VitrineRewards[item]["item"], amount) then
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.VitrineRewards[item]["item"]], 'add')
        else
            TriggerClientEvent('QBCore:Notify', src, Lang:t("error.pockets_full"), "error")
            --TriggerClientEvent('QBCore:Notify', src, 'You Can\'t Carry Anymore!', 'error')
        end
    end
end)

QBCore.Functions.CreateCallback('rl-jewellery:server:setTimeout', function(source, cb)
	if not timeOut then
        timeOut = true
        Citizen.CreateThread(function()
            Citizen.Wait(Config.Timeout)

            for k, v in pairs(Config.Locations) do
                Config.Locations[k]["isOpened"] = false
                TriggerClientEvent('rl-jewellery:client:setVitrineState', -1, 'isOpened', false, k)
                TriggerClientEvent('rl-jewellery:client:setAlertState', -1, false)
            end
            timeOut = false
            alarmTriggered = false
        end)
    end
end)
