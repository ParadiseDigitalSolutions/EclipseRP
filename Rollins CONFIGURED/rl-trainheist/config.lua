Config = {}

Config['TrainHeist'] = {
    ['requiredPoliceCount'] = 6, -- required police count for start heist
    ['nextRob'] = 7200, -- seconds for next heist
    ['requiredItems'] = { -- add to database or shared
        'sec_j',
        'drill'
    },
    ['reward'] = {
        itemName = 'goldbar', -- gold item name
        grabCount = math.random(50, 100), -- gold grab count
        sellPrice = 225 -- buyer sell price
    },
    ['startHeist'] ={ -- heist start coords
        pos = vector3(1408.8328, 3668.5712, 34.010551),
        peds = {
            {pos = vector3(1408.8328, 3668.5712, 34.010551), heading = 107.71099, ped = 's_m_m_highsec_01'}
        }
    },
    ['guardPeds'] = { -- guard ped list (you can add new)
            { coords = vector3(2850.67, 4531.49, 45.3924), heading = 270.87, model = 's_m_y_blackops_01'
              coords = vector3(2852.67, 4533.49, 45.3924), heading = 270.87, model = 's_m_y_blackops_01'
              coords = vector3(2848.67, 4535.49, 45.3924), heading = 270.87, model = 's_m_y_blackops_01'
              coords = vector3(2850.67, 4537.49, 45.3924), heading = 270.87, model = 's_m_y_blackops_01'
        },
  
    },
    ['finishHeist'] = { -- finish heist coords
        buyerPos = vector3(717.26373, 4175.291, 39.709197)
    },
    ['setupTrain'] = { -- train and containers coords
        pos = vector3(2872.028, 4544.253, 47.758),
        part = vector3(2883.305, 4557.646, 47.758),
        heading = 140.0,
        ['containers'] = {
            {
                pos = vector3(2885.97, 4560.83, 48.0551), 
                heading = 320.0, 
                lock = {pos = vector3(2884.76, 4559.38, 49.22561), taken = false},
                table = vector3(2886.55, 4561.53, 48.23),
                golds = {
                    {pos = vector3(2886.05, 4561.93, 49.14), taken = false},
                    {pos = vector3(2887.05, 4561.13, 49.14), taken = false},
                } 
            },
            {
                pos = vector3(2880.97, 4554.83, 48.0551), 
                heading = 140.0, 
                lock = {pos = vector3(2882.15, 4556.26, 49.22561), taken = false},
                table = vector3(2880.45, 4554.23, 48.23),
                golds = {
                    {pos = vector3(2881.05, 4553.93, 49.14), taken = false},
                    {pos = vector3(2880.25, 4554.63, 49.14), taken = false},
                } 
            }
        }
    }
}

Strings = {
    ['start_heist'] = 'Press ~INPUT_CONTEXT~ to Start Train Heist',
    ['cutting'] = 'Press ~INPUT_CONTEXT~ to cutting',
    ['grab'] = 'Press ~INPUT_CONTEXT~ to grab',
    ['start_heist'] = 'Press ~INPUT_CONTEXT~ to Start Train Heist',
    ['goto_ambush'] = 'Go to ambush point in GPS. Kill the guards, search Merryweather containers and steal golds.',
    ['wait_nextrob'] = 'You have to wait this long to undress again',
    ['minute'] = 'minute.',
    ['ambush_blip'] = 'Amubsh Point',
    ['need_this'] = 'You need this: ',
    ['deliver_to_buyer'] = 'Deliver the loot to the buyer. Check gps.',
    ['buyer_blip'] = 'Buyer',
    ['need_police'] = 'Not enough police in the city.',
    ['total_money'] = 'You got this: ',
    ['police_alert'] = 'Train robbery alert! Check your gps.',
}

--Dont change. Main and required things.
TrainAnimation = {
    ['objects'] = {
        'tr_prop_tr_grinder_01a',
        'ch_p_m_bag_var02_arm_s'
    },
    ['animations'] = {
        {'action', 'action_container', 'action_lock', 'action_angle_grinder', 'action_bag'}
    },
    ['scenes'] = {},
    ['sceneObjects'] = {}
}

GrabGold = {
    ['objects'] = {
        'hei_p_m_bag_var22_arm_s'
    },
    ['animations'] = {
        {'enter', 'enter_bag'},
        {'grab', 'grab_bag', 'grab_gold'},
        {'grab_idle', 'grab_idle_bag'},
        {'exit', 'exit_bag'},
    },
    ['scenes'] = {},
    ['scenesObjects'] = {}
}