fx_version 'cerulean'
game 'gta5'

author 'FreeBack'
description 'Script for ESX PvP servers that fixes desync issues where a player appears killed on one client, but the server does not register the death, causing the other player to remain alive on their side.'
version '1.0.0'

client_scripts {
    'client.lua'
}

server_scripts {
    'server.lua' 
}

shared_scripts {
    'shared/*.lua'
}

dependencies {
    'es_extended'
}
