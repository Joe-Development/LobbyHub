fx_version 'cerulean'
games { 'gta5' }
author 'JoeV2'
description 'LobbyHub - https://github.com/Joe-Development/'
version '1.0.0'
lua54 'yes'

shared_scripts {
    'shared_config.lua',
    '@ox_lib/init.lua',
}

client_script 'client/client.lua'
client_script 'client/hud.lua'
server_script 'server/server.lua'
server_script 'sv_config.lua'

dependency 'ox_lib'