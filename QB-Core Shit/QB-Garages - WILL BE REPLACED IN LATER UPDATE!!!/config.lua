AutoRespawn = false --True == auto respawn cars that are outside into your garage on script restart, false == does not put them into your garage and players have to go to the impound
SharedGarages = false   --True == Gang and job garages are shared, false == Gang and Job garages are personal

Garages = {
    ["motelgarage"] = {
        label = "Motel Parking",
        asdasd = vector3(273.43, -343.99, 44.91),
        spawnPoint = vector4(270.94, -342.96, 43.97, 161.5),
        putVehicle = vector3(276.69, -339.85, 44.91),
        asdasd = true,
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicle = 'car'                 --car, air, sea
    },
    ["sapcounsel"] = {
        label = "San Andreas Parking",
        asdasd = vector3(-330.01, -780.33, 33.96),
        spawnPoint = vector4(-334.44, -780.75, 33.96, 137.5),
        putVehicle = vector3(-336.31, -774.93, 33.96),
        asdasd = true,
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicle = 'car'                 --car, air, sea
    },
    ["spanishave"] = {
        label = "Spanish Ave Parking",
        asdasd = vector3(-1160.86, -741.41, 19.63),
        spawnPoint = vector4(-1163.88, -749.32, 18.42, 35.5),
        putVehicle = vector3(-1147.58, -738.11, 19.31),
        asdasd = true,
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicle = 'car'                 --car, air, sea
    },
    ["caears24"] = {
        label = "Caears 24 Parking",
        asdasd = vector3(69.84, 12.6, 68.96),
        spawnPoint = vector4(73.21, 10.72, 68.83, 163.5),
        putVehicle = vector3(65.43, 21.19, 69.47),
        asdasd = true,
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicle = 'car'                 --car, air, sea
    },
    ["caears242"] = {
        label = "Caears 24 Parking",
        asdasd = vector3(-475.31, -818.73, 30.46),
        spawnPoint = vector4(-472.03, -815.47, 30.5, 177.5),
        putVehicle = vector3(-453.6, -817.08, 30.61),
        asdasd = true,
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicle = 'car'                 --car, air, sea
    },
    ["lagunapi"] = {
        label = "Laguna Parking",
        asdasd = vector3(364.37, 297.83, 103.49),
        spawnPoint = vector4(367.49, 297.71, 103.43, 340.5),
        putVehicle = vector3(363.04, 283.51, 103.38),
        asdasd = true,
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicle = 'car'                 --car, air, sea
    },
    ["airportp"] = {
        label = "Airport Parking",
        asdasd = vector3(-796.86, -2024.85, 8.88),
        spawnPoint = vector4(-800.41, -2016.53, 9.32, 48.5),
        putVehicle = vector3(-804.84, -2023.21, 9.16),
        asdasd = true,
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicle = 'car'                 --car, air, sea
    },
    ["beachp"] = {
        label = "Beach Parking",
        asdasd = vector3(-1183.1, -1511.11, 4.36),
        spawnPoint = vector4(-1181.0, -1505.98, 4.37, 214.5),
        putVehicle = vector3(-1176.81, -1498.63, 4.37),
        asdasd = true,
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicle = 'car'                 --car, air, sea
    },
    ["themotorhotel"] = {
        label = "The Motor Hotel Parking",
        asdasd = vector3(1137.77, 2663.54, 37.9),            
        spawnPoint = vector4(1137.69, 2673.61, 37.9, 359.5),      
        putVehicle = vector3(1137.75, 2652.95, 37.9),
        asdasd = true,
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicle = 'car'                 --car, air, sea
    },
    ["liqourparking"] = {
        label = "Liqour Parking",
        asdasd = vector3(934.95, 3606.59, 32.81),
        spawnPoint = vector4(941.57, 3619.99, 32.5, 141.5),
        putVehicle = vector3(939.37, 3612.25, 32.69),
        asdasd = true,
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicle = 'car'                 --car, air, sea
    },
    ["shoreparking"] = {
        label = "Shore Parking",
        asdasd = vector3(1726.21, 3707.16, 34.17),
        spawnPoint = vector4(1730.31, 3711.07, 34.2, 20.5),
        putVehicle = vector3(1737.13, 3718.91, 34.04),
        asdasd = true,
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicle = 'car'                 --car, air, sea
    },
    ["haanparking"] = {
        label = "Bell Farms Parking",
        asdasd = vector3(78.34, 6418.74, 31.28),
        spawnPoint = vector4(70.71, 6425.16, 30.92, 68.5), 
        putVehicle = vector3(85.3, 6427.52, 31.33),
        asdasd = true,
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicle = 'car'                 --car, air, sea
    },
    ["dumbogarage"] = {
        label = "Dumbo Private Parking",
        asdasd = vector3(157.26, -3240.00, 7.00),
        spawnPoint = vector4(165.32, -3236.10, 5.93, 268.5), 
        putVehicle = vector3(165.32, -3230.00, 5.93),
        asdasd = true,
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicle = 'car'                 --car, air, sea
    },
    ["pillboxgarage"] = {
        label = "Pillbox Garage Parking",
        asdasd = vector3(215.9499, -809.698, 30.731),
        spawnPoint = vector4(234.1942, -787.066, 30.193, 159.6),
        putVehicle = vector3(218.0894, -781.370, 30.389),
        asdasd = true,
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicle = 'car'                 --car, air, sea
    },
    --["hayesdepot"] = {
    --    label = "Hayes Depot",
    --    asdasd = vector3(491.0, -1314.69, 29.25),
    --    spawnPoint = vector4(491.0, -1314.69, 29.25, 304.5),
    --    asdasd = true,
    --    blipName = "Hayes Depot",
    --    blipNumber = 68,
    --    type = 'depot',                --public, job, gang, depot
    --    vehicle = 'car'                 --car, air, sea
    --},
    ["impoundlot"] = {
        label = "Impound Lot",
        asdasd = vector3(409.89, -1623.51, 29.29),
        spawnPoint = vector4(407.92, -1646.29, 29.29, 226.39),
        asdasd = true,
        blipName = "Impound Lot",
        blipNumber = 68,
        type = 'depot',                --public, job, gang, depot
        vehicle = 'car'                 --car, air, sea
    },
    ["ballas"] = {
        label = "Ballas",
        asdasd = vector3(98.50, -1954.49, 20.84),
        spawnPoint = vector4(98.50, -1954.49, 20.75, 335.73),
        putVehicle = vector3(94.75, -1959.93, 20.84),
        asdasd = false,
        blipName = "Ballas",
        blipNumber = 357,
        type = 'gang',                --public, job, gang, depot
        vehicle = 'car',              --car, air, sea
        job = "ballas"
    },
    ["families"] = {
        label = "La Familia",
        asdasd = vector3(-811.65, 187.49, 72.48),
        spawnPoint = vector4(-818.43, 184.97, 72.28, 107.85),
        putVehicle = vector3(-811.65, 187.49, 72.48),
        asdasd = false,
        blipName = "La Familia",
        blipNumber = 357,
        type = 'gang',                --public, job, gang, depot
        vehicle = 'car',              --car, air, sea
        job = "families"
    },
    ["lostmc"] = {
        label = "Lost MC",
        asdasd = vector3(957.25, -129.63, 74.39),
        spawnPoint = vector4(957.25, -129.63, 74.39, 199.21),
        putVehicle = vector3(950.47, -122.05, 74.36),
        asdasd = false,
        blipName = "Lost MC",
        blipNumber = 357,
        type = 'gang',                --public, job, gang, depot
        vehicle = 'car',              --car, air, sea
        job = "lostmc"
    },
    ["cartel"] = {
        label = "Cartel",
        asdasd = vector3(1407.18, 1118.04, 114.84),
        spawnPoint = vector4(1407.18, 1118.04, 114.84, 88.34),
        putVehicle = vector3(1407.18, 1118.04, 114.84),
        asdasd = false,
        blipName = "Cartel",
        blipNumber = 357,
        type = 'gang',                --public, job, gang, depot
        vehicle = 'car',              --car, air, sea
        job = "cartel"
    },
    ["intairport"] = {
        label = "Airport Hangar", 
        asdasd = vector3(-928.84, -2994.38, 19.85),
        spawnPoint = vector4(-979.2, -2995.51, 13.95, 52.19),
        putVehicle = vector3(-1003.38, -3008.87, 13.95),
        asdasd = true,
        blipName = "Hangar",
        blipNumber = 360,
        type = 'public',                --public, job, gang, depot
        vehicle = 'air'                 --car, air, sea
    },
    ["higginsheli"] = {
        label = "Higgins Helitours", 
        asdasd = vector3(-753.27, -1511.5, 5.01),
        spawnPoint = vector4(-745.34, -1468.67, 5.0, 320.15),
        putVehicle = vector3(-724.65, -1444.08, 5.0),
        asdasd = true,
        blipName = "Hangar",
        blipNumber = 360,
        type = 'public',                --public, job, gang, depot
        vehicle = 'air'                 --car, air, sea
    },
    ["airsshores"] = {
        label = "Sandy Shores Hangar", 
        asdasd = vector3(1758.19, 3296.66, 41.14),
        spawnPoint = vector4(1740.98, 3279.08, 41.75, 106.77),
        putVehicle = vector3(1740.4, 3283.92, 41.1),
        asdasd = true,
        blipName = "Hangar",
        blipNumber = 360,
        type = 'public',                --public, job, gang, depot
        vehicle = 'air'                 --car, air, sea
    },
    ["airdepot"] = {
        label = "Air Depot", 
        asdasd = vector3(-1243.29, -3392.3, 13.94),
        spawnPoint = vector4(-1269.67, -3377.74, 13.94, 327.88),
        asdasd = true,
        blipName = "Air Depot",
        blipNumber = 359,
        type = 'depot',                --public, job, gang, depot
        vehicle = 'air'                 --car, air, sea
    },
    ["lsymc"] = {
        label = "LSYMC Boathouse",               
        asdasd = vector3(-794.66, -1510.83, 1.59),
        spawnPoint = vector4(-793.58, -1501.4, 0.12, 111.5),
        putVehicle = vector3(-793.58, -1501.4, 0.12),
        asdasd = true,
        blipName = "Boathouse",
        blipNumber = 356,
        type = 'public',                --public, job, gang, depot
        vehicle = 'sea'                 --car, air, sea
    },
    ["paleto"] = {
        label = "Paleto Boathouse",               
        asdasd = vector3(-277.46, 6637.2, 7.48),
        spawnPoint = vector4(-289.2, 6637.96, 1.01, 45.5),
        putVehicle = vector3(-289.2, 6637.96, 1.01),
        asdasd = true,
        blipName = "Boathouse",
        blipNumber = 356,
        type = 'public',                --public, job, gang, depot
        vehicle = 'sea'                 --car, air, sea
    },
    ["millars"] = {
        label = "Millars Boathouse",               
        asdasd = vector3(1299.24, 4216.69, 33.9),
        spawnPoint = vector4(1297.82, 4209.61, 30.12, 253.5),
        putVehicle = vector3(1297.82, 4209.61, 30.12),
        asdasd = true,
        blipName = "Boathouse",
        blipNumber = 356,
        type = 'public',                --public, job, gang, depot
        vehicle = 'sea'                 --car, air, sea
    },
    ["seadepot"] = {
        label = "LSYMC Depot",               
        asdasd = vector3(-772.98, -1430.76, 1.59),
        spawnPoint = vector4(-729.77, -1355.49, 1.19, 142.5),
        putVehicle = vector3(-729.77, -1355.49, 1.19),
        asdasd = true,
        blipName = "LSYMC Depot",
        blipNumber = 356,
        type = 'depot',                --public, job, gang, depot
        vehicle = 'sea'                 --car, air, sea
    },
}
HouseGarages = {}
