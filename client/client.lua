
RegisterCommand("lobby", function(source, args, rawCommand)
    local LobbySelector = lib.inputDialog('JoeV2 Lobbys', {
    {
        type = "select", 
        label = "Lobby", 
        description = 'The Lobby you would like to join.',
        icon = "house", 
        required = true, 
        options = { 
            {
                value = 0,
                label = 'Roleplay Lobby (Default)' 
            },
            { 
                value = 1, 
                label = 'Training Lobby' 
            }, 
            { 
                value = 2, 
                label = 'PVP Lobby' 
            } 
        }
    }
    })
    if not LobbySelector then
        return 
    end
    local LobbyCode = tonumber(LobbySelector[1])
    TriggerServerEvent("JoeV2Lobbys:SwitchLobby", LobbyCode)
end)

watermark = [[
                                                                                             
         88888  dP"Yb  888888 Yb    dP oP"Yb.     88      dP"Yb  88""Yb 88""Yb Yb  dP .dP"Y8 
            88 dP   Yb 88__    Yb  dP  "' dP'     88     dP   Yb 88__dP 88__dP  YbdP  `Ybo." 
        o.  88 Yb   dP 88""     YbdP     dP'      88  .o Yb   dP 88""Yb 88""Yb   8P   o.`Y8b 
        "bodP'  YbodP  888888    YP    .d8888     88ood8  YbodP  88oodP 88oodP  dP    8bodP' 
                                                                                                     
                                                                                                     
        [ Discord ] - https://discord.gg/qkwQnt3xtr
        [ Github ] - https://github.com/Joe-Development
]]

-- please dont remove this out of respect
print(watermark)