Config = {}


Config.playerammo = false  -- disable player ammo from being fetched from database
Config.weaponHolster = true -- [true = allows built-in weapon holster] [false = disables built-in weapon holster] 


Config.SettingsButton = {
    enablemenu = true,
    enablemessage = false,
    command = "menu",
    message = "Settings is disabled, please check config",
}

MaxInventorySlots = 41
Config.MaximumAmmoValues = { ["pistol"] = 1000, ["smg"] = 1000, ["shotgun"] = 1000, ["rifle"] = 1000 }

Config.VendingMachine = {
    [1] = { name = "sandwich", price = 11, amount = 1000000, info = {}, type = "item", slot = 1, }
}
Config.WaterMachine = {
    [1] = { name = "water", price = 7, amount = 1000000, info = {}, type = "item", slot = 1, }
}
Config.CoffeeMachine = {
    [1] = { name = "coffee", price = 9, amount = 1000000, info = {}, type = "item", slot = 1, }
}
Config.SodaMachine = {
    [1] = { name = "burger-softdrink", price = 9, amount = 1000000, info = {}, type = "item", slot = 1, }
}

Config.Dumpsters = {
 [1] = {['Model'] = 666561306,    ['Name'] = 'Blauwe Bak'},
 [2] = {['Model'] = 218085040,    ['Name'] = 'Light Blue Bin'},
 [3] = {['Model'] = -58485588,    ['Name'] = 'Gray Bin'},
 [4] = {['Model'] = 682791951,    ['Name'] = 'Big Blue Bin'},
 [5] = {['Model'] = -206690185,   ['Name'] = 'Big Green Bin'},
 [6] = {['Model'] = 364445978,    ['Name'] = 'Big Green Bin'},
 [7] = {['Model'] = 143369,       ['Name'] = 'Small Bin'},
 [8] = {['Model'] = -2140438327,  ['Name'] = 'Unknown Bin'},
 [9] = {['Model'] = -1851120826,  ['Name'] = 'Unknown Bin'},
 [10] = {['Model'] = -1543452585, ['Name'] = 'Unknown Bin'},
 [11] = {['Model'] = -1207701511, ['Name'] = 'Unknown Bin'},
 [12] = {['Model'] = -918089089,  ['Name'] = 'Unknown Bin'},
 [13] = {['Model'] = 1511880420,  ['Name'] = 'Unknown Bin'},
 [14] = {['Model'] = 1329570871,  ['Name'] = 'Unknown Bin'},
}

Config.JailContainers = {
 [1] = {['Model'] = 1923262137, ['Name'] = 'Electric Cabinet 1'},
 [2] = {['Model'] = -686494084, ['Name'] = 'Electric Cabinet 2'},
 [3] = {['Model'] = 1419852836, ['Name'] = 'Electric Cabinet 3'},
}
 
Config.GarbageBin = {
 [1] = {['Model'] = 275188277,     ['Name'] = 'Garbage Bin'},
 [2] = {['Model'] = 1437508529,    ['Name'] = 'Garbage Bin'},
 [3] = {['Model'] = 1614656839,    ['Name'] = 'Garbage Bin'},
 [4] = {['Model'] = -130812911,    ['Name'] = 'Garbage Bin'},
 [5] = {['Model'] = -93819890,     ['Name'] = 'Garbage Bin'},
 [6] = {['Model'] = 1329570871,    ['Name'] = 'Garbage Bin'},
 [7] = {['Model'] = 1143474856,    ['Name'] = 'Garbage Bin'},
 [8] = {['Model'] = -228596739,    ['Name'] = 'Garbage Bin'},
 [9] = {['Model'] = -468629664,    ['Name'] = 'Garbage Bin'},
 [10] = {['Model'] = -1426008804,  ['Name'] = 'Garbage Bin'},
 [11] = {['Model'] = -1187286639,  ['Name'] = 'Garbage Bin'},
 [12] = {['Model'] = -1096777189,  ['Name'] = 'Garbage Bin'},
 [13] = {['Model'] = -413198204,   ['Name'] = 'Garbage Bin'},
 [14] = {['Model'] = 437765445,    ['Name'] = 'Garbage Bin'},
 [15] = {['Model'] = -1830793175,  ['Name'] = 'Garbage Bin'},
 [16] = {['Model'] = -329415894,   ['Name'] = 'Garbage Bin'},
 [17] = {['Model'] = -341442425,   ['Name'] = 'Garbage Bin'},
 [18] = {['Model'] = 1792999139,   ['Name'] = 'Garbage Bin'},
 [19] = {['Model'] = -2096124444,  ['Name'] = 'Garbage Bin'},
 [20] = {['Model'] = -5943724,     ['Name'] = 'Garbage Bin'},
 [21] = {['Model'] = -317177646,   ['Name'] = 'Garbage Bin'},
 [22] = {['Model'] = 1380691550,   ['Name'] = 'Garbage Bin'},
 [23] = {['Model'] = -654874323,   ['Name'] = 'Garbage Bin'},
 [24] = {['Model'] = 1010534896,   ['Name'] = 'Garbage Bin'},
 [25] = {['Model'] = 651101403,    ['Name'] = 'Garbage Bin'},
 [26] = {['Model'] = 909943734,    ['Name'] = 'Garbage Bin'},
 [27] = {['Model'] = -246439655,   ['Name'] = 'Garbage Bin'},
 [28] = {['Model'] = 74073934,     ['Name'] = 'Garbage Bin'},
 [29] = {['Model'] = -115771139,   ['Name'] = 'Garbage Bin'},
 [30] = {['Model'] = -85604259,    ['Name'] = 'Garbage Bin'},
 [31] = {['Model'] = 1233216915,   ['Name'] = 'Garbage Bin'},
 [32] = {['Model'] = 375956747,    ['Name'] = 'Garbage Bin'},
 [33] = {['Model'] = 673826957,    ['Name'] = 'Garbage Bin'},
 [34] = {['Model'] = 354692929,    ['Name'] = 'Garbage Bin'},
 [35] = {['Model'] = -14708062,    ['Name'] = 'Garbage Bin'},
} 


BackEngineVehicles = {
    'ninef',
    'adder',
    'vagner',
    't20',
    'infernus',
    'zentorno',
    'reaper',
    'comet2',
    'comet3',
    'jester',
    'jester2',
    'cheetah',
    'cheetah2',
    'prototipo',
    'turismor',
    'pfister811',
    'ardent',
    'nero',
    'nero2',
    'tempesta',
    'vacca',
    'bullet',
    'osiris',
    'entityxf',
    'turismo2',
    'fmj',
    're7b',
    'tyrus',
    'italigtb',
    'penetrator',
    'monroe',
    'ninef2',
    'stingergt',
    'surfer',
    'surfer2',
    'comet3',
}

Config.CraftingItems = {
    [1] = {
        name = "lockpick",
        amount = 50,
        info = {},
        costs = {
            ["metalscrap"] = 4,
            ["plastic"] = 32,
        },
        type = "item",
        slot = 1,
        threshold = 0,
        points = 1,
    }
    [8] = {
        name = "pistol_ammo",
        amount = 50,
        info = {},
        costs = {
            ["metalscrap"] = 1,
            ["steel"] = 2,
            ["copper"] = 2,
        },
        type = "item",
        slot = 8,
        threshold = 0,
        points = 10,
    },
    [9] = {
        name = "thermite",
        amount = 50,
        info = {},
        costs = {
            ["iron"] = 60,
            ["glass"] = 30,
        },
        type = "item",
        slot = 9,
        threshold = 0,
        points = 9,
    },
    [12] = {
        name = "drill",
        amount = 50,
        info = {},
        costs = {
            ["iron"] = 50,
            ["steel"] = 50,
            ["screwdriverset"] = 3,
            ["advancedlockpick"] = 2,
        },
        type = "item",
        slot = 12,
        threshold = 0,
        points = 12,
    },
--[[    [13] = {
        name = "sec_d",
        amount = 50,
        info = {},
        costs = {
            ["sec_a"] = 15,
            ["plastic"] = 50,
        },
        type = "item",
        slot = 13,
        threshold = 0,
        points = 13,
    },
    [14] = {
        name = "sec_c",
        amount = 50,
        info = {},
        costs = {
            ["sec_b"] = 20,
            ["plastic"] = 50,
        },
        type = "item",
        slot = 14,
        threshold = 0,
        points = 14,
    },
    [15] = {
        name = "sec_j",
        amount = 50,
        info = {},
        costs = {
            ["sec_c"] = 25,
            ["plastic"] = 50,
        },
        type = "item",
        slot = 15,
        threshold = 0,
        points = 15,
    },
    [16] = {
        name = "sec_g",
        amount = 50,
        info = {},
        costs = {
            ["sec_j"] = 25,
            ["plastic"] = 50,
        },
        type = "item",
        slot = 16,
        threshold = 0,
        points = 16,
    },
    [17] = {
        name = "sec_h",
        amount = 50,
        info = {},
        costs = {
            ["sec_g"] = 25,
            ["plastic"] = 50,
        },
        type = "item",
        slot = 17,
        threshold = 0,
        points = 17,
    },
    [18] = {
        name = "sec_b",
        amount = 50,
        info = {},
        costs = {
            ["sec_a"] = 10,
            ["sec_d"] = 1,
            ["plastic"] = 50,
        },
        type = "item",
        slot = 18,
        threshold = 0,
        points = 18,
    }, --]]
}

--[[ Config.AttachmentCrafting = {
    ["items"] = {
        [1] = {
            name = "pistol_extendedclip",
            amount = 50,
            info = {},
            costs = {
                ["metalscrap"] = 140,
                ["steel"] = 250,
                ["rubber"] = 60,
            },
            type = "item",
            slot = 1,
            threshold = 0,
            points = 1,
        },
        [2] = {
            name = "pistol_suppressor",
            amount = 50,
            info = {},
            costs = {
                ["metalscrap"] = 165,
                ["steel"] = 285,
                ["rubber"] = 75,
            },
            type = "item",
            slot = 2,
            threshold = 0,
            points = 2,
        },
        [3] = {
            name = "smg_extendedclip",
            amount = 50,
            info = {},
            costs = {
                ["metalscrap"] = 190,
                ["steel"] = 305,
                ["rubber"] = 85,
            },
            type = "item",
            slot = 3,
            threshold = 0,
            points = 3,
        },
        [4] = {
            name = "microsmg_extendedclip",
            amount = 50,
            info = {},
            costs = {
                ["metalscrap"] = 205,
                ["steel"] = 340,
                ["rubber"] = 110,
            },
            type = "item",
            slot = 4,
            threshold = 0,
            points = 4,
        },
        [5] = {
            name = "smg_drum",
            amount = 50,
            info = {},
            costs = {
                ["metalscrap"] = 230,
                ["steel"] = 365,
                ["rubber"] = 130,
            },
            type = "item",
            slot = 5,
            threshold = 0,
            points = 5,
        },
        [6] = {
            name = "smg_scope",
            amount = 50,
            info = {},
            costs = {
                ["metalscrap"] = 255,
                ["steel"] = 390,
                ["rubber"] = 145,
            },
            type = "item",
            slot = 6,
            threshold = 0,
            points = 6,
        },
        [7] = {
            name = "assaultrifle_extendedclip",
            amount = 50,
            info = {},
            costs = {
                ["metalscrap"] = 270,
                ["steel"] = 435,
                ["rubber"] = 155,
                ["smg_extendedclip"] = 1,
            },
            type = "item",
            slot = 7,
            threshold = 0,
            points = 7,
        },
        [8] = {
            name = "assaultrifle_drum",
            amount = 50,
            info = {},
            costs = {
                ["metalscrap"] = 300,
                ["steel"] = 469,
                ["rubber"] = 170,
                ["smg_extendedclip"] = 2,
            },
            type = "item",
            slot = 8,
            threshold = 0,
            points = 8,
        },
        [9] = {
            name = "weapon_dp9",
            amount = 50,
            info = {},
            costs = {
                ["metalscrap"] = 300,
                ["steel"] = 469,
                ["rubber"] = 170,
            },
            type = "item",
            slot = 9,
            threshold = 0,
            points = 9,
        },
        [10] = {
            name = "weapon_appistol",
            amount = 50,
            info = {},
            costs = {
                ["metalscrap"] = 300,
                ["steel"] = 469,
                ["rubber"] = 170,
            },
            type = "item",
            slot = 10,
            threshold = 0,
            points = 10,
        },
        [11] = {
            name = "weapon_minismg2",
            amount = 50,
            info = {},
            costs = {
                ["metalscrap"] = 300,
                ["steel"] = 469,
                ["rubber"] = 170,
            },
            type = "item",
            slot = 11,
            threshold = 0,
            points = 11,
        },
        [12] = {
            name = "weapon_assaultrifle2",
            amount = 50,
            info = {},
            costs = {
                ["metalscrap"] = 300,
                ["steel"] = 469,
                ["rubber"] = 170,
            },
            type = "item",
            slot = 12,
            threshold = 0,
            points = 12,
        },
        [13] = {
            name = "weapon_compactrifle",
            amount = 50,
            info = {},
            costs = {
                ["metalscrap"] = 300,
                ["steel"] = 469,
                ["rubber"] = 170,
            },
            type = "item",
            slot = 13,
            threshold = 0,
            points = 13,
        },
        [14] = {
            name = "weapon_advancedrifle",
            amount = 50,
            info = {},
            costs = {
                ["metalscrap"] = 300,
                ["steel"] = 469,
                ["rubber"] = 170,
            },
            type = "item",
            slot = 14,
            threshold = 0,
            points = 14,
        },
        [15] = {
            name = "weapon_molotov",
            amount = 50,
            info = {},
            costs = {
                ["metalscrap"] = 300,
                ["steel"] = 469,
                ["rubber"] = 170,
            },
            type = "item",
            slot = 15,
            threshold = 0,
            points = 15,
        },
        [16] = {
            name = "weapon_stickybomb",
            amount = 50,
            info = {},
            costs = {
                ["metalscrap"] = 300,
                ["steel"] = 469,
                ["rubber"] = 170,
            },
            type = "item",
            slot = 16,
            threshold = 0,
            points = 16,
        },
    } 
} --]]

