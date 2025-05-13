Config = {}

Config.ESX = false -- true == Uses ESX / false == Uses QBCore
Config.MoneyPerPackage = 43 -- Money given per one package
Config.DisableControlActions = true -- Disable control actions such as jumping and sprinting while holding a package

Config.BossModel = "s_m_y_ammucity_01" 
Config.BossCoords = vector4(-432.97, -2788.21, 5.02, 47.33)
Config.BossBlip = {
    enableBlip = true, 
    blipType = 477,
    blipColor = 5,
    blipText = "PostOP",
}

Config.Vehicle = "boxville4"
Config.VehicleSpawnLocations = {
    vector4(-467.67, -2804.11, 6.0, 45.91),
    vector4(-463.31, -2799.83, 6.0, 47.54),
    vector4(-458.59, -2795.5, 6.0, 46.78),
    vector4(-453.93, -2791.23, 6.0, 43.81),
    vector4(-449.02, -2786.83, 6.0, 49.4),
}

Config.PackagesAmount = { -- Amount of packages that needs to be delivered per delivery location
    smallJobs = {
        minAmount = 7,
        maxAmount = 10,
    },
    mediumJobs = {
        minAmount = 7,
        maxAmount = 10,
    },
    largeJobs = {
        minAmount = 7,
        maxAmount = 10,
    },
}

Config.Prop = { -- Package props
    `hei_prop_heist_box`,
    `prop_paper_box_02`,
    `prop_cs_package_01`, 
    `prop_cs_cardbox_01`,
    `prop_cs_box_clothes`,
    `prop_beer_box_01`,
    `prop_paper_box_03`,
    `prop_paper_box_04`,
    `prop_paper_box_05`,
    `hei_prop_heist_box`,
}

Config.DeliveryLocationAmount = { -- Amount of delivery locations per job
    smallJobs = {
        minAmount = 1,
        maxAmount = 3,
    },
    mediumJobs = {
        minAmount = 2,
        maxAmount = 3,
    },
    largeJobs = {
        minAmount = 3,
        maxAmount = 4,
    },
}

Config.DeliveryLocations = { -- Delivery locations
    vector4(26.31, -1338.85, 29.5, 1.39),
    vector4(-3047.58, 583.71, 7.91, 104.93),
    vector4(-3250.51, 1002.58, 12.83, 83.18),
    vector4(1733.26, 6421.96, 35.04, 332.98),
    vector4(1705.63, 4917.39, 42.06, 254.43),
    vector4(1957.46, 3748.23, 32.34, 33.15),
    vector4(548.33, 2662.72, 42.16, 186.92),
    vector4(-40.65, -1751.17, 29.42, 339.57),
    vector4(2671.58, 3285.15, 55.24, 58.22),
    vector4(2548.86, 382.95, 108.62, 82.23),
    vector4(376.41, 334.16, 103.57, 343.65),
    vector4(1183.89, -3322.13, 6.19, 272.98), 
    vector4(1207.34, -3122.63, 5.54, 175.05), 
    vector4(-1139.69, -2005.7, 13.18, 315.83), 
    vector4(46.59, -1749.73, 29.63, 231.92), 
    vector4(372.99, -1441.4, 29.43, 52.71), 
    vector4(941.28, -2141.45, 31.22, 354.1), 
    vector4(818.08, -2155.26, 29.62, 4.18), 
    vector4(495.64, -1340.83, 29.31, 182.66), 
    vector4(106.27, -1280.96, 29.26, 187.96), 
    vector4(71.37, -1392.02, 29.38, 175.36), 
    vector4(1698.01, 4822.4, 42.06, 3.92),
    vector4(-1180.32, -763.68, 17.33, 306.19),
    vector4(429.4, -807.22, 29.49, 357.19),
    vector4(-823.59, -1069.73, 11.33, 124.15),
    vector4(6.66, 6509.02, 31.88, 312.14),
    vector4(617.58, 2776.01, 42.09, 2.36),
    vector4(1197.65, 2714.1, 38.22, 81.19),
    vector4(-1122.19, 2696.77, 18.55, 132.0),
    vector4(-1103.4, 2714.08, 19.11, 129.75),
    vector4(117.39, -234.44, 54.56, 164.08),
    vector4(-1170.23, -534.72, 30.17, 135.28),
    vector4(-556.24, 275.65, 83.08, 356.6),
    vector4(-1178.71, -891.82, 13.74, 127.67),
    vector4(-1793.99, -1198.97, 13.02, 146.08),
    vector4(-2953.33, 49.17, 11.61, 155.33),
    vector4(-2963.04, 391.99, 15.04, 1.21),
    vector4(1131.19, -984.21, 46.42, 188.55),
    vector4(-2175.58, 4294.94, 49.06, 61.1),
    vector4(-121.54, 6204.52, 32.38, 231.66),
    vector4(118.88, 6639.96, 31.87, 134.65),
    vector4(1417.0, 6339.16, 24.4, 190.83), 
    vector4(3603.17, 3672.28, 33.87, 352.82),
    vector4(2555.68, 2607.32, 38.09, 112.62),
    vector4(2670.22, 1600.7, 24.5, 89.23),
    vector4(2469.36, -348.3, 93.4, 266.03),
    vector4(-85.83, 357.21, 112.44, 65.79), 
    vector4(-690.62, -893.12, 24.71, 87.94),
}