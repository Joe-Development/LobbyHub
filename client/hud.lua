function LobbyDraw(x,y ,width,height,scale, text, r,g,b,a)
    SetTextFont(6)
    SetTextProportional(false)
	SetTextCentre(false)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow()
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

RegisterNetEvent('JoeV2Lobbys:SetLobbyHud', function (LobbyID)
    if LobbyID == 0 then
        playerLobby = "~g~Roleplay Lobby"
    elseif LobbyID == 1 then
        playerLobby = "~p~Training Lobby"
    elseif LobbyID == 2 then
        playerLobby = "~r~PVP Lobby (KOS)"
    end
end)




playerLobby = "~g~Roleplay Lobby";
function setplayerLobbyGui(value)
 	playerLobby = value
 	return
end


Citizen.CreateThread(function()
	Wait(800);
	while true do 
		Wait(0);
		local enabled = Config.lobby_hud.enabled;
		if enabled then 
			local disp = Config.lobby_hud.defaultText;
			local scale = Config.lobby_hud.fontSize;
			local x = Config.lobby_hud.x;
			local y = Config.lobby_hud.y;

			if (disp:find("{LOBBY}")) then 
				disp = disp:gsub("{LOBBY}", playerLobby);
			end 
			LobbyDraw(x, y, 1.0, 1.0, scale, disp, 255,255,255,255);
		end
	end
end)