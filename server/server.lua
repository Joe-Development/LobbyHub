RegisterNetEvent('JoeV2Lobbys:SwitchLobby')
AddEventHandler('JoeV2Lobbys:SwitchLobby', function(LobbyID)
    SetPlayerRoutingBucket(source, LobbyID)
    if LobbyID == 0 then
        TriggerClientEvent('AtlasNotify:Notify', source, "You are now in the Roleplay Lobby.", 7500, "success", "JoeV2 Lobbys")
        if Config.logging then
            sendToDisc("Lobby Switched", "**Name:** " .. GetPlayerName(source) .. "\n**Discord:** <@" .. getDiscord(source) .. ">\n**Player ID:** " .. source .. "\n**Message:** has switched to the Roleplay lobby.", "JoeV2 Lobbys", 16711680)             
        end
        TriggerClientEvent('JoeV2Lobbys:SetLobbyHud', source, 0)
    elseif LobbyID == 1 then
        TriggerClientEvent('AtlasNotify:Notify', source, "You are now in the Training Lobby.", 7500, "success", "JoeV2 Lobbys")
        if Config.logging then
            sendToDisc("Lobby Switched", "**Name:** " .. GetPlayerName(source) .. "\n**Discord:** <@" .. getDiscord(source) .. ">\n**Player ID:** " .. source .. "\n**Message:** has switched to the Training lobby.", "JoeV2 Lobbys", 16711680) 
        end
        TriggerClientEvent('JoeV2Lobbys:SetLobbyHud', source, 1)
    elseif LobbyID == 2 then
        TriggerClientEvent('AtlasNotify:Notify', source, "You are now in the PVP Lobby.", 7500, "success", "JoeV2 Lobbys")
        if Config.logging then
            sendToDisc("Lobby Switched", "**Name:** " .. GetPlayerName(source) .. "\n**Discord:** <@" .. getDiscord(source) .. ">\n**Player ID:** " .. source .. "\n**Message:** has switched to the PVP lobby.", "JoeV2 Lobbys", 16711680) 
        end
        TriggerClientEvent('JoeV2Lobbys:SetLobbyHud', source, 2)
    end
end)

-- START of Dev EXPORTS
function getLobbyId(src)
    local LobbyID = GetPlayerRoutingBucket(src)
    if LobbyID == 0 then
        return 'Roleplay'
    elseif LobbyID == 1 then
        return 'Training'
    elseif LobbyID == 2 then
        return 'PVP'
    end
end

exports('getLobbyId', getLobbyId)
-- local lobbyid = exports['LobbyHub']:getLobbyId(source)

-- END of Dev EXPORTS

Citizen.CreateThread(function ()
    SetRoutingBucketPopulationEnabled(2, false) -- disable NPCS in PVP
end)


AddEventHandler('playerSpawned', function()
    SetPlayerRoutingBucket(source, Config.defaultLobby)
    Wait(1000)
    if Config.lobby_hud.enabled then
        TriggerClientEvent('JoeV2Lobbys:SetLobbyHud', source, Config.defaultLobby)
    end
end)

function getDiscord(source)
    for k, v in ipairs(GetPlayerIdentifiers(source)) do
        if string.sub(v, 1, string.len("discord:")) == "discord:" then
            return string.gsub(v, "discord:", "")
        end
    end
    return "N/A"
end

function sendToDisc(title, message, footer, color)
    local embed = {
        {
            ["color"] = color,
            ["title"] = title,
            ["description"] = message,
            ["footer"] = {
                ["text"] = footer
            },
            ["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%SZ")
        }
    }
    PerformHttpRequest(Config.lobby_webhook, function(err, text, headers) end, 'POST', json.encode({username = "JoeV2 Lobbys", embeds = embed}), { ['Content-Type'] = 'application/json' })
end