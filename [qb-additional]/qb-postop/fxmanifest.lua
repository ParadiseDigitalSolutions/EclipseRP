fx_version 'cerulean'
game 'gta5'

author "forosty#1472"
description 'PostOP Delivery'
version '1.0.0'

client_script {
    'client/*.lua',
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua'
}
server_script 'server/*.lua'
shared_script 'config.lua'

lua54 'yes'
escrow_ignore { 
    'client/*.lua',
    'server/*.lua',
    'config.lua'
}
dependency '/assetpacks'
dependency '/assetpacks'