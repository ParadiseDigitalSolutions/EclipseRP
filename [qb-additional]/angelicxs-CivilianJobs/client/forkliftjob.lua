----------------------------------------------------------------------
--					Forklift Configuration Options					--
--			 The following options can be changed to make your      --
--			  forklift job unique and suit your server         		--
----------------------------------------------------------------------

local Forklift_Options = {
    Boss = {
        Location = vector4(289.75, -3151.43, 5.81, 71.32),
        Model = 's_m_m_dockwork_01',
    },
    Sprite = {
        icon = 473,
        colour = 12,
        name = 'Angelic Loading Company',
    },
    Forklift = {
        Spawn = {
            vector4(289.28, -3160.55, 5.82, 90.54),
            vector4(289.23, -3158.36, 5.81, 93.03),
            vector4(289.17, -3156.27, 5.8, 91.92)
        },
        Name = 'forklift'
    },
    Payment = {
        flatRate = false,
        flatRateAmount = 100,
        DistanceMultiplier = 0.25, -- Only applies if flatRate = false, pays driver based on multiplying distance from pick up to drop off.
        materialGain = true, -- if true will give every item in the materialList to the player
        materialList = { -- List of items to give to play when they RECEIVE PAYMENT
            {name = 'rubber', min = 1, max = 2},
            {name = 'plastic', min = 1, max = 2},
            {name = 'metalscrap', min = 1, max = 2},
            {name = 'copper', min = 1, max = 2},
            {name = 'iron', min = 1, max = 2},
            {name = 'steel', min = 1, max = 2},
        },
    },
}

local palletOptions = {
    PalletAllowMarker = true,
    PalletLocationMarker = 22,
    Location = {
        vector3(161.96, -3115.75, 5.96),
        vector3(213.78, -3131.21, 5.79),
        vector3(166.5, -3259.96, 5.87),
        vector3(163.5, -3311.42, 5.93),
        vector3(204.32, -3317.35, 5.82),
        vector3(108.41, -3271.72, 6.0),
        vector3(116.15, -3174.83, 6.01),
        vector3(115.07, -3013.05, 6.01),
        vector3(142.94, -2999.84, 7.03),
        vector3(136.86, -2968.64, 6.28),
    },
    Style = {
        'prop_boxpile_02b',
        'prop_boxpile_02c',
        'prop_boxpile_06a',
        'prop_boxpile_09a',
        'prop_conc_blocks01a',

    },
    DropAllowMarker = true,
    DropLocationMarker = 30,
    DropLocation = {
        vector3(283.87, -3173.38, 7.22),
        vector3(275.29, -3200.13, 7.37),
        vector3(275.99, -3204.97, 7.29),
    }
}

----------------------------------------------------------------------
--						 Forklift Script       						--
--		It is NOT recommended to change any of the following        --
----------------------------------------------------------------------

local PedSpawned = false
local palletItem = false

if Config.ForkliftJobOn then
    CreateThread(function()
        JobBlip(Forklift_Options.Boss.Location, Forklift_Options.Sprite.icon, Forklift_Options.Sprite.colour, Forklift_Options.Sprite.name)
        Job3DText(Forklift_Options.Boss.Location, 'angelicxs-CivilianJobs:ForkliftJob:AskForWork', 'angelicxs-CivilianJobs:ForkliftJob:HowTo')
        while true do
            local Pos = GetEntityCoords(PlayerPedId())
            local ForkLiftBoss = vector3(Forklift_Options.Boss.Location.x, Forklift_Options.Boss.Location.y, Forklift_Options.Boss.Location.z)
            local Dist = #(Pos - ForkLiftBoss)
            if Dist <= 50 and not PedSpawned then
                TriggerEvent('angelicxs-CivilianJobs:MAIN:SpawnBossNPC', Forklift_Options.Boss.Model, Forklift_Options.Boss.Location, 'angelicxs-CivilianJobs:ForkliftJob:AskForWork', 'angelicxs-CivilianJobs:ForkliftJob:HowTo', ' ForkliftJob.lua')
                PedSpawned = true
            elseif PedSpawned and Dist > 50 then
                PedSpawned = false
            end
            Wait(2000)
        end
    end)

    RegisterNetEvent('angelicxs-CivilianJobs:ForkliftJob:HowTo', function()
        TriggerEvent('angelicxs-CivilianJobs:Notify', Config.Lang['gen_how_to'], Config.LangType['info'])
        print(Config.Lang['forklift_how_to'])
    end)

    RegisterNetEvent('angelicxs-CivilianJobs:ForkliftJob:AskForWork', function()
        if FreeWork or PlayerJob == Config.ForkliftJobName then
            if gettingMissionVehicle then TriggerEvent('angelicxs-CivilianJobs:Notify', Config.Lang['getting_vehicle'], Config.LangType['error']) return end
            if not MissionVehicle then
                TriggerEvent('angelicxs-CivilianJobs:MAIN:CreateVehicle', Forklift_Options.Forklift.Name, Forklift_Options.Forklift.Spawn, 'angelicxs-CivilianJobs:ForkliftJob:AskForWork')
                while not DoesEntityExist(MissionVehicle) do
                    Wait(25)
                end
                TriggerEvent('angelicxs-CivilianJobs:ForkliftJob:BeginWork')
            else
                TriggerEvent('angelicxs-CivilianJobs:ForkliftJob:BeginWork')
            end
        else
            TriggerEvent('angelicxs-CivilianJobs:Notify', Config.Lang['wrong_job'], Config.LangType['error'])
        end
    end)

    RegisterNetEvent('angelicxs-CivilianJobs:ForkliftJob:BeginWork', function()
        if not DoesEntityExist(palletItem) then
            PalletCreator()
        else
            TriggerEvent('angelicxs-CivilianJobs:Notify', Config.Lang['forklift_on_job'], Config.LangType['error'])
        end

    end)


    function PalletCreator()
        local palletType = Randomizer(palletOptions.Style, 'PalletCreator()')
        local location = Randomizer(palletOptions.Location, 'PalletCreator()')
        while not palletType and not location do Wait(10) end
        local hash = HashGrabber(palletType)
        while not hash do Wait(10) end
        local timeOut = #palletOptions.Location
        while true do 
            local obj = 0
            for i = 1, #palletOptions.Style do
                local type = HashGrabber(palletOptions.Style[i])
                obj = GetClosestObjectOfType(location, 1.0, type, false)
                if DoesEntityExist(obj) then
                    location = Randomizer(palletOptions.Location, 'PalletCreator()')
                    break
                end
            end 
            if obj == 0 then
                break
            else
                timeOut = timeOut - 1
                if timeOut <= 0 then
                    break
                end
            end
            Wait(100)
        end
        if timeOut <= 0 then TriggerEvent('angelicxs-CivilianJobs:Notify', Config.Lang['forklift_no_pallets'], Config.LangType['error']) return end
        TriggerEvent('angelicxs-CivilianJobs:Notify', Config.Lang['forklift_start'], Config.LangType['info'])
        palletItem = CreateObject(hash, location.x, location.y, location.z-0.95, true, true, true)
        PlaceObjectOnGroundProperly(palletItem)
        SetEntityAsMissionEntity(palletItem, true, true)
        TriggerEvent('angelicxs-CivilianJobs:MAIN:RouteMarker', false, location, 'Pallet Location', 'PalletCreator()')
        SetModelAsNoLongerNeeded(palletType)
        while true do 
            local sleep = 1000
            local coord = GetEntityCoords(PlayerPedId())
            local pcoord = GetEntityCoords(palletItem)
            if #(coord-location) <20 then
                sleep = 0
                if palletOptions.PalletAllowMarker then
                    DrawMarker(palletOptions.PalletLocationMarker, location.x, location.y, (location.z+2), 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 2.0, 2.0, 2.0, 100, 200, 50, 255, true, true, 2, 0.0, false, false, false)
                end
                if #(pcoord-location) >= 2 then
                    break
                end
            end
            Wait(sleep)
        end
        DropLocation(location)
    end

    function DropLocation(inital)
        local location = Randomizer(palletOptions.DropLocation, 'DropLocation()')
        TriggerEvent('angelicxs-CivilianJobs:MAIN:RouteMarker', false, location, 'Drop Location', 'DropLocation()')
        while true do 
            local sleep = 1000
            local coord = GetEntityCoords(PlayerPedId())
            local pcoord = GetEntityCoords(palletItem)
            if #(coord-location) <20 then
                sleep = 0
                if palletOptions.DropAllowMarker then
                    DrawMarker(palletOptions.DropLocationMarker, location.x, location.y, (location.z+2), 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 2.0, 2.0, 2.0, 100, 200, 50, 255, true, true, 2, 0.0, false, false, false)
                end
                if #(pcoord-location) <= 1.5 then
                    DeleteEntity(palletItem)
                    palletItem = nil
                    break
                end
            end
            Wait(sleep)
        end
        if Forklift_Options.Payment.flatRate then
            PaymentFlat(Forklift_Options.Payment.flatRateAmount, 'Forklift Job - DropLocation()')
        else
            DistancePayment(inital, location, 'Forklift Job - DropLocation()', Forklift_Options.Payment.DistanceMultiplier)
        end
        if Forklift_Options.Payment.materialGain then
            for i = 1, #Forklift_Options.Payment.materialList do
                PaymentItemMaterial(Forklift_Options.Payment.materialList[i], 'Forklift Job - DropLocation()')
            end
        end
        TriggerEvent('angelicxs-CivilianJobs:Notify', Config.Lang['forklift_job_complete'], Config.LangType['success'])
        if Config.ContinousMode then
            local headerName = Config.Lang['continous_mode_header']
            local options = {
                {
                    header = Config.Lang['continous_mode_yes'], -- nh / qbmenu
                    txt = Config.Lang['continous_mode_yes'], -- nh / qbmenu
                    event = 'angelicxs-CivilianJobs:ForkliftJob:BeginWork', -- nh
                    params = { -- qb menu
                        event = 'angelicxs-CivilianJobs:ForkliftJob:BeginWork',
                    },
                    title = Config.Lang['continous_mode_yes'], -- oxlibs
                    onSelect = function() -- oxlibs
                        TriggerEvent("angelicxs-CivilianJobs:ForkliftJob:BeginWork")
                    end,
                },
                {
                    header = Config.Lang['continous_mode_no'], -- nh / qbmenu
                    event = 'angelicxs-CivilianJobs:MAIN:NoContinueMode', -- nh
                    params = { -- qb menu
                        event = 'angelicxs-CivilianJobs:MAIN:NoContinueMode',
                    },
                    title = Config.Lang['continous_mode_no'], -- oxlibs
                    onSelect = function() -- oxlibs
                        TriggerEvent("angelicxs-CivilianJobs:MAIN:NoContinueMode")
                    end,
                },
            }
            jobMainMenu(headerName, options)
        end
    end

    AddEventHandler('angelicxs-CivilianJobs:Main:ResetJobs', function()
        if DoesEntityExist(palletItem) then
            DeleteEntity(palletItem)
        end
        palletItem = nil
    end)
end
