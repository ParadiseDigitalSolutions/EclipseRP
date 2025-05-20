Config = Config or {}

Config.DEBUG = false -- make sure it's false
-- ============================
--       Server Config
-- ============================
Config.sv_dataClearnigTimer = 5000 -- 1000 per sec
Config.sv_maxTableSize = 5000 -- saved entites in table

-- End

Config.BaitCooldown = 15000 -- 1000 per sec
Config.SpawningTimer = 5000 -- script will wait until "SpawningTimer" time out then it's spwan animal  

Config.AnimalsEatingSpeed = 7500 -- how much animals will wait in baits location
Config.AnimalsFleeView = 12.5 -- animal Flee range if they get to see players

Config.BaitPlacementSpeed = math.random(3000, 3000)
Config.SlaughteringSpeed = math.random(1000, 5000)

Config.baitSpawnDistance = 50 -- animal spwan radius from placed bait

Config.animalDespawnRange = 500.0

Config.spawnedAnimalsBlips = false -- when animals spawend it will appears in map with blips on them
Config.AnimalBlip = {
    sprite = 463, -- icon https://docs.fivem.net/docs/game-references/blips/
    color = 5
}

Config.callPoliceChance = {0, 0} -- 25 + 75 = 100% ( 25% chance to call police )

Config.llegalHuntingNotification = function(animalCoord)
    TriggerEvent("police:client:policeAlert", animalCoord, "illlegal Hunting in area")
end

Config.Animals = {{
    model = "a_c_deer",
    spwanRarity = {0, 30}, -- {llegal area spawn chance , illegal area spawn chance}
    hash = -664053099,
    item = "Deer Horns",
    invItemName = "meatdeer",
    price = 120
}, {
    model = "a_c_pig",
    spwanRarity = {30, 55},
    hash = -1323586730,
    item = "Pig Pelt",
    invItemName = "meatpig",
    price = 80
}, {
    model = "a_c_boar",
    spwanRarity = {5, 25},
    hash = -832573324,
    item = "Boar Tusks",
    invItemName = "meatboar",
    price = 100
}, {
    model = "a_c_mtlion",
    spwanRarity = {0, 1},
    hash = 307287994,
    item = "Couger Claws",
    invItemName = "meatlion",
    price = 500
}, {
    model = "a_c_cow",
    spwanRarity = {20, 40},
    hash = -50684386,
    item = "Cow Pelt",
    invItemName = "meatcow",
    price = 90
}, {
    model = "a_c_coyote",
    spwanRarity = {10, 28},
    hash = 1682622302,
    item = "Coyote Pelt",
    invItemName = "meatcoyote",
    price = 110
}, {
    model = "a_c_rabbit_01",
    spwanRarity = {0, 0},
    hash = -541762431,
    item = "Rabbit Fur",
    invItemName = "meatrabbit",
    price = 140
}, {
    model = "a_c_pigeon",
    spwanRarity = {0, 0},
    hash = 111281960,
    item = "Bird Feather",
    invItemName = "meatbird",
    price = 130
}, {
    model = "a_c_seagull",
    spwanRarity = {0, 0},
    hash = -745300483,
    item = "Bird Feather",
    invItemName = "meatbird",
    price = 110
}}

Config.HuntingArea = {{
    name = "Hunting Area",
    coord = vector3(-840.6, 4183.3, 215.29),
    radius = 1000.0,
    llegal = true
}, {
    name = "Hunting Area",
    coord = vector3(870.01, 5158.01, 452.54),
    radius = 500.0,
    llegal = false
}}

Config.HuntingShopItems = {
    [1] = {
        name = 'weapon_sniperrifle2',
        price = 2000,
        amount = 2,
        info = {},
        type = 'item',
        slot = 1
    },
    [2] = {
        name = 'snp_ammo',
        price = 15,
        amount = 2,
        info = {},
        type = 'item',
        slot = 2
    },
    [3] = {
        name = 'huntingbait',
        price = 9,
        amount = 50,
        info = {},
        type = 'item',
        slot = 3
    },
    [4] = {
        name = 'weapon_knife',
        price = 240,
        amount = 1,
        info = {},
        type = 'item',
        slot = 4
    }
}

Config.Shop = {
    ["name"] = "huntingshop",
    ["label"] = "Hunting Shop"
}

Config.HuntingShopNpc = {{
    BlipsCoords = vector3(-679.82, 5838.92, 17.33),
    SellerNpc = {
        model = 'ig_hunter', -- This is the ped model that is going to be spawning at the given coords
        coords = vector4(-680.5642, 5838.1528, 17.326459, 229.7956), -- This is the coords that the ped is going to spawn at, always has to be a vector4 and the w value is the heading
        minusOne = true, -- Set this to true if your ped is hovering above the ground but you want it on the ground (OPTIONAL)
        freeze = true, -- Set this to true if you want the ped to be frozen at the given coords (OPTIONAL)
        invincible = true, -- Set this to true if you want the ped to not take any damage from any source (OPTIONAL)
        blockevents = true, -- Set this to true if you don't want the ped to react the to the environment (OPTIONAL)
        -- animDict = 'abigail_mcs_1_concat-0', -- This is the animation dictionairy to load the animation to play from (OPTIONAL)
        -- anim = 'csb_abigail_dual-0', -- This is the animation that will play chosen from the animDict, this will loop the whole time the ped is spawned (OPTIONAL)
        flag = 1, -- This is the flag of the animation to play, for all the flags, check the TaskPlayAnim native here https://docs.fivem.net/natives/?_0x5AB552C6 (OPTIONAL)
        -- scenario = 'WORLD_HUMAN_AA_COFFEE', -- This is the scenario that will play the whole time the ped is spawned, this cannot pair with anim and animDict (OPTIONAL)
        currentpednumber = 0 -- This is the current ped number, this will be assigned when spawned, you can leave this out because it will always be created (OPTIONAL)
    }
}}

Config.SellSpots = {{
    BlipsCoords = vector3(570.34, 2796.46, 42.01),
    SellerNpc = {
        model = 'csb_chef', -- This is the ped model that is going to be spawning at the given coords
        coords = vector4(570.34, 2796.46, 42.01, 294.27), -- This is the coords that the ped is going to spawn at, always has to be a vector4 and the w value is the heading
        minusOne = true, -- Set this to true if your ped is hovering above the ground but you want it on the ground (OPTIONAL)
        freeze = true, -- Set this to true if you want the ped to be frozen at the given coords (OPTIONAL)
        invincible = true, -- Set this to true if you want the ped to not take any damage from any source (OPTIONAL)
        blockevents = true, -- Set this to true if you don't want the ped to react the to the environment (OPTIONAL)
        -- animDict = 'abigail_mcs_1_concat-0', -- This is the animation dictionairy to load the animation to play from (OPTIONAL)
        -- anim = 'csb_abigail_dual-0', -- This is the animation that will play chosen from the animDict, this will loop the whole time the ped is spawned (OPTIONAL)
        flag = 1, -- This is the flag of the animation to play, for all the flags, check the TaskPlayAnim native here https://docs.fivem.net/natives/?_0x5AB552C6 (OPTIONAL)
        -- scenario = 'WORLD_HUMAN_AA_COFFEE', -- This is the scenario that will play the whole time the ped is spawned, this cannot pair with anim and animDict (OPTIONAL)
        currentpednumber = 0 -- This is the current ped number, this will be assigned when spawned, you can leave this out because it will always be created (OPTIONAL)
    }
}}
