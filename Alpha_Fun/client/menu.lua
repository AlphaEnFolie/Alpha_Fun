RMenu.Add('showcase', 'AlphaMenu', RageUI.CreateMenu("Alpha", "~r~AlphaMenu", 8, 200, nil, nil, 213, 170, 115))
RMenu:Get('showcase', 'AlphaMenu').EnableMouse = false

RMenu.Add('showcase', 'submenu1', RageUI.CreateSubMenu(RMenu:Get('showcase', 'AlphaMenu'), "Alpha Hypnotisation", "~r~Alpha | Hypnotisation"))
RMenu.Add('showcase', 'submenu2', RageUI.CreateSubMenu(RMenu:Get('showcase', 'AlphaMenu'), "Alpha Joueur", "~r~Alpha | Joueur"))
RMenu.Add('showcase', 'submenu3', RageUI.CreateSubMenu(RMenu:Get('showcase', 'AlphaMenu'), "Alpha Pouvoirs", "~r~Alpha | Pouvoirs"))
RMenu.Add('showcase', 'submenu4', RageUI.CreateSubMenu(RMenu:Get('showcase', 'AlphaMenu'), "Alpha Parametres", "Parametres"))
RMenu.Add('showcase', 'submenu6', RageUI.CreateSubMenu(RMenu:Get('showcase', 'AlphaMenu'), "Alpha Autres", "~r~Alpha | Autres"))



RMenu:Get('showcase', 'submenu1'):SetRectangleBanner(255, 0, 0, 255)
RMenu:Get('showcase', 'submenu2'):SetRectangleBanner(100, 0, 0, 255)
RMenu:Get('showcase', 'submenu3'):SetRectangleBanner(100, 0, 0, 255)
RMenu:Get('showcase', 'submenu4'):SetRectangleBanner(100, 0, 0, 255)
RMenu:Get('showcase', 'submenu6'):SetRectangleBanner(100, 0, 0, 255)

RMenu:Get('showcase', 'AlphaMenu'):SetRectangleBanner(100, 0, 0, 255)

Effect = false

local entity = PlayerPedId()
local forceType = 1
local speed1 = 1.0
local PrevNum = 1
 -- sends the entity straight up into the sky:
local direction = vector3(20.0, 20.0, 60.0)
local direction1 = vector3(0.0, speed1, 0.0)
local rotation = vector3(0.0, 0.0, 0.0)
local boneIndex = 0
local isDirectionRel = true
local ignoreUpVec = true
local isForceRel = true
local p12 = false
local p13 = true
local PoingActiver = false
local function ShowNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end

local sJump = false
local PouvoirON1 = false
local punch1      = false
local sprint1     = false
local jump1       = false
local invisible1  = false
local godmode1    = false
local affichername = false
local ShowName = false
local noclip = false
local noclip_RF = 1.0
local ServersIdSession = {}
local gamerTags = {}
local SelectedPlayer = nil
local index2 = {
     items = 1
}

index3 = {
    "Bleu",
    "Rouge",
    "Vert",
    "Jaune",
    "Orange",
    "Rose",
    "Violet",
    "Gris",
    "Noir"
}

local percent = 100
local percent1 = 10
local a = 255
local a1 = 10

ESX_READY = true 
if ESX_READY == true then 
	ESX = nil
	Citizen.CreateThread(function()
		while ESX == nil do
            TriggerEvent("esx:getSharedObject", function(obj) ESX = obj
                
				Citizen.Wait(0)
			end)
		end
	end)
end

RageUI.CreateWhile(1.0, function()
    if RageUI.Visible(RMenu:Get('showcase', 'AlphaMenu')) then
        RageUI.DrawContent({ header = true, glare = true, instructionalButton = true }, function()
 
            RageUI.Button("Alpha ~r~| ~w~Hypnotisation", nil, { RightLabel = "→" }, true, function(Hovered, Active, Selected)     
                if (Selected) then
     
               end
               end, RMenu:Get('showcase', 'submenu1'))

            RageUI.Button("Alpha ~r~| ~w~Joueur", nil, { RightLabel = "→" }, true, function(Hovered, Active, Selected)     
                 if (Selected) then
            
                  end
               end, RMenu:Get('showcase', 'submenu2'))
            
            RageUI.Button("Alpha ~r~| ~w~Pouvoirs", nil, { RightLabel = "→" }, true, function(Hovered, Active, Selected)     
                if (Selected) then
           
                 end
              end, RMenu:Get('showcase', 'submenu3')) 

              RageUI.Button("Alpha ~r~| ~w~Autres", nil, { RightLabel = "→" }, true, function(Hovered, Active, Selected)     
                if (Selected) then
           
                 end
              end, RMenu:Get('showcase', 'submenu6')) 

            RageUI.Button("Parametres", nil, { RightLabel = "→" }, true, function(Hovered, Active, Selected)     
                if (Selected) then
           
                 end
              end, RMenu:Get('showcase', 'submenu4')) 
            end, function()
        end)
    end
    local player, distance = ESX.Game.GetClosestPlayer()
    if RageUI.Visible(RMenu:Get('showcase', 'submenu1')) then
        RageUI.DrawContent({ header = true, glare = true, instructionalButton = true }, function()

            RageUI.Button("Hypnotiser la personne", nil, { RightLabel = "→" }, true, function(Hovered, Active, Selected)
                if (Selected) then
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    
                    if closestPlayer == -1 or closestDistance > 2.0 then 
                        ESX.ShowNotification('~r~Il n\'y a pas de joueur à proximité')
                    else
                        if not PouvoirON1 then
                            TriggerServerEvent('esx_pouvoir:sendclosest', GetPlayerServerId(closestPlayer))
                            ESX.ShowNotification('~g~Tu as Hypnotiser ~w~' .. GetPlayerName(closestPlayer))
                            TriggerServerEvent('esx_pouvoir:closest')
                        else
                            ESX.ShowNotification('~r~Ce joueur est deja Hypnotiser')
                        end
                    end
                end
            end)
            RageUI.Button("Forcer tous les joueurs a être hypnotiser ( ~r~15M~s~ )", nil, { RightLabel = "→→→" }, true, function(_, _, Selected)
                if (Selected) then
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                    if distance ~= -1 and distance > 15.0 then
                        ESX.ShowNotification('~r~Il n\'y a pas de joueur à proximité')
                    else
                        if not PouvoirON1 then
                            TriggerServerEvent('esx_pouvoir:sendclosest', GetPlayerServerId(closestPlayer))
                            ESX.ShowNotification(GetPlayerName(closestPlayer) ..'')
                            TriggerServerEvent('esx_pouvoir:DVR__')
                        else
                            print('else')
                        end
                    end
                    Effect= true
                end
            end)
            RageUI.Button("~r~Stopper l\'hypnotisation", nil, { RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
                if (Selected) then
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                    if distance ~= -1 and distance > 15.0 then
                        ESX.ShowNotification('~r~Il n\'y a pas de joueur à proximité')
                    else
                        if not PouvoirON1 then
                            TriggerServerEvent('esx_pouvoir:sendclosest', GetPlayerServerId(closestPlayer))
                            ESX.ShowNotification(GetPlayerName(closestPlayer) ..' n\'est plus ~g~Hypnotiser ~w~')
                            TriggerServerEvent('esx_pouvoir:closest2')
                        else
                            ESX.ShowNotification('~r~Ce joueur n\'est pas Hypnotiser ~n~~g~ou la deja eté')
                        end
                    end
                    Effect = false
                end
            end)
        end, function()
            ---Panels
        end)
    end

    if RageUI.Visible(RMenu:Get('showcase', 'submenu2')) then
        RageUI.DrawContent({ header = true, glare = true, instructionalButton = true }, function()
            RageUI.Button("~r~Stopper l'animation du joueur", nil, { RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
                if (Selected) then
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    
                    if closestPlayer == -1 or closestDistance > 2.0 then 
                        ESX.ShowNotification('~r~Il n\'y a pas de joueur à proximité')
                    else
                        if not PouvoirON1 then
                            TriggerServerEvent('esx_pouvoir:sendclosest', GetPlayerServerId(closestPlayer))
                            ESX.ShowNotification(GetPlayerName(closestPlayer) ..'')
                            TriggerServerEvent('esx_pouvoir:closestclear')
                        else
                            ESX.ShowNotification('Ce joueur fais deja une animation')
                        end
                    end
                end
            end)
            RageUI.Button("Forcer le joueur à boire un Café", nil, { RightLabel = "→" }, true, function(Hovered, Active, Selected)
                if (Selected) then
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    
                    if closestPlayer == -1 or closestDistance > 2.0 then 
                        ESX.ShowNotification('~r~Il n\'y a pas de joueur à proximité')
                    else
                        if not PouvoirON1 then
                            TriggerServerEvent('esx_pouvoir:sendclosest', GetPlayerServerId(closestPlayer))
                         ESX.ShowNotification(GetPlayerName(closestPlayer) ..' est sous vos pouvoirs ~w~')
                            TriggerServerEvent('esx_pouvoir:closest3')
                        else
                            ESX.ShowNotification('Ce joueur fais deja une animation')
                        end
                    end
                end
            end)
            RageUI.Button("Forcer le joueur à fumer", nil, { RightLabel = "→" }, true, function(Hovered, Active, Selected)
                if (Selected) then
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    
                    if closestPlayer == -1 or closestDistance > 2.0 then 
                        ESX.ShowNotification('~r~Il n\'y a pas de joueur à proximité')
                    else
                        if not PouvoirON1 then
                            TriggerServerEvent('esx_pouvoir:sendclosest', GetPlayerServerId(closestPlayer))
                         ESX.ShowNotification(GetPlayerName(closestPlayer) ..' est sous vos pouvoirs ~w~')
                            TriggerServerEvent('esx_pouvoir:closest4')
                        else
                            ESX.ShowNotification('Ce joueur fais deja une animation')
                        end
                    end
                end
            end)
            RageUI.Button("Forcer le joueur à mendier", nil, { RightLabel = "→" }, true, function(Hovered, Active, Selected)
                if (Selected) then
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    
                    if closestPlayer == -1 or closestDistance > 2.0 then 
                        ESX.ShowNotification('~r~Il n\'y a pas de joueur à proximité')
                    else
                        if not PouvoirON1 then
                            TriggerServerEvent('esx_pouvoir:sendclosest', GetPlayerServerId(closestPlayer))
                         ESX.ShowNotification(GetPlayerName(closestPlayer) ..' est sous vos pouvoirs ~w~')
                            TriggerServerEvent('esx_pouvoir:closest5')
                        else
                            ESX.ShowNotification('Ce joueur fais deja une animation')
                        end
                    end
                end
            end)
            RageUI.Button("Forcer le joueur à dormir", nil, { RightLabel = "→" }, true, function(Hovered, Active, Selected)
                if (Selected) then
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    
                    if closestPlayer == -1 or closestDistance > 2.0 then 
                        ESX.ShowNotification('~r~Il n\'y a pas de joueur à proximité')
                    else
                        if not PouvoirON1 then
                            TriggerServerEvent('esx_pouvoir:sendclosest', GetPlayerServerId(closestPlayer))
                          ESX.ShowNotification(GetPlayerName(closestPlayer) ..' est sous vos pouvoirs ~w~')
                            TriggerServerEvent('esx_pouvoir:closest7')
                        else
                            ESX.ShowNotification('Ce joueur fais deja une animation')
                        end
                    end
                end
            end)
            RageUI.Button("Forcer le joueur à travailler", nil, { RightLabel = "→" }, true, function(Hovered, Active, Selected)
                if (Selected) then
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    
                    if closestPlayer == -1 or closestDistance > 2.0 then 
                        ESX.ShowNotification('~r~Il n\'y a pas de joueur à proximité')
                    else
                        if not PouvoirON1 then
                            TriggerServerEvent('esx_pouvoir:sendclosest', GetPlayerServerId(closestPlayer))
                         ESX.ShowNotification(GetPlayerName(closestPlayer) ..' est sous vos pouvoirs ~w~')
                            TriggerServerEvent('esx_pouvoir:closest8')
                        else
                            ESX.ShowNotification('Ce joueur fais deja une animation')
                        end
                    end
                end
            end)
            RageUI.Button("Forcer le joueur à faire la circulation", nil, { RightLabel = "→" }, true, function(Hovered, Active, Selected)
                if (Selected) then
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    
                    if closestPlayer == -1 or closestDistance > 2.0 then 
                        ESX.ShowNotification('~r~Il n\'y a pas de joueur à proximité')
                    else
                        if not PouvoirON1 then
                            TriggerServerEvent('esx_pouvoir:sendclosest', GetPlayerServerId(closestPlayer))
                         ESX.ShowNotification(GetPlayerName(closestPlayer) ..' est sous vos pouvoirs ~w~')
                            TriggerServerEvent('esx_pouvoir:closest9')
                        else
                            ESX.ShowNotification('Ce joueur fais deja une animation')
                        end
                    end
                end
            end)
            RageUI.Button("Forcer le joueur à applaudir", nil, { RightLabel = "→" }, true, function(Hovered, Active, Selected)
                if (Selected) then
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    
                    if closestPlayer == -1 or closestDistance > 2.0 then 
                        ESX.ShowNotification('~r~Il n\'y a pas de joueur à proximité')
                    else
                        if not PouvoirON1 then
                            TriggerServerEvent('esx_pouvoir:sendclosest', GetPlayerServerId(closestPlayer))
                         ESX.ShowNotification(GetPlayerName(closestPlayer) ..' est sous vos pouvoirs ~w~')
                            TriggerServerEvent('esx_pouvoir:closest10')
                        else
                            ESX.ShowNotification('Ce joueur fais deja une animation')
                        end
                    end
                end
            end)
            RageUI.Button("Forcer le joueur à boire une bière", nil, { RightLabel = "→" }, true, function(Hovered, Active, Selected)
                if (Selected) then
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    
                    if closestPlayer == -1 or closestDistance > 2.0 then 
                        ESX.ShowNotification('~r~Il n\'y a pas de joueur à proximité')
                    else
                        if not PouvoirON1 then
                            TriggerServerEvent('esx_pouvoir:sendclosest', GetPlayerServerId(closestPlayer))
                         ESX.ShowNotification(GetPlayerName(closestPlayer) ..' est sous vos pouvoirs ~w~')
                            TriggerServerEvent('esx_pouvoir:closest11')
                        else
                            ESX.ShowNotification('Ce joueur fais deja une animation')
                        end
                    end
                end
            end)
            RageUI.Button("Forcer le joueur à fumer un joint", nil, { RightLabel = "→" }, true, function(Hovered, Active, Selected)
                if (Selected) then
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    
                    if closestPlayer == -1 or closestDistance > 2.0 then 
                        ESX.ShowNotification('~r~Il n\'y a pas de joueur à proximité')
                    else
                        if not PouvoirON1 then
                            TriggerServerEvent('esx_pouvoir:sendclosest', GetPlayerServerId(closestPlayer))
                         ESX.ShowNotification(GetPlayerName(closestPlayer) ..' est sous vos pouvoirs ~w~')
                            TriggerServerEvent('esx_pouvoir:closest12')
                        else
                            ESX.ShowNotification('Ce joueur fais deja une animation')
                        end
                    end
                end
            end)
            RageUI.Button("Forcer le joueur à faire la biatch", nil, { RightLabel = "→" }, true, function(Hovered, Active, Selected)
                if (Selected) then
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    
                    if closestPlayer == -1 or closestDistance > 2.0 then 
                        ESX.ShowNotification('~r~Il n\'y a pas de joueur à proximité')
                    else
                        if not PouvoirON1 then
                            TriggerServerEvent('esx_pouvoir:sendclosest', GetPlayerServerId(closestPlayer))
                         ESX.ShowNotification(GetPlayerName(closestPlayer) ..' est sous vos pouvoirs ~w~')
                            TriggerServerEvent('esx_pouvoir:closest13')
                        else
                            ESX.ShowNotification('Ce joueur fais deja une animation')
                        end
                    end
                end
            end)
            RageUI.Button("Forcer le joueur à faire des pompes", nil, { RightLabel = "→" }, true, function(Hovered, Active, Selected)
                if (Selected) then
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    
                    if closestPlayer == -1 or closestDistance > 2.0 then 
                        ESX.ShowNotification('~r~Il n\'y a pas de joueur à proximité')
                    else
                        if not PouvoirON1 then
                            TriggerServerEvent('esx_pouvoir:sendclosest', GetPlayerServerId(closestPlayer))
                         ESX.ShowNotification(GetPlayerName(closestPlayer) ..' est sous vos pouvoirs ~w~')
                            TriggerServerEvent('esx_pouvoir:closest14')
                        else
                            ESX.ShowNotification('Ce joueur fais deja une animation')
                        end
                    end
                end
            end)
            RageUI.Button("Forcer le joueur à faire du yoga ", nil, { RightLabel = "→" }, true, function(Hovered, Active, Selected)
                if (Selected) then
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    
                    if closestPlayer == -1 or closestDistance > 2.0 then 
                        ESX.ShowNotification('~r~Il n\'y a pas de joueur à proximité')
                    else
                        if not PouvoirON1 then
                            TriggerServerEvent('esx_pouvoir:sendclosest', GetPlayerServerId(closestPlayer))
                         ESX.ShowNotification(GetPlayerName(closestPlayer) ..' est sous vos pouvoirs ~w~')
                            TriggerServerEvent('esx_pouvoir:closest15')
                        else
                            ESX.ShowNotification('Ce joueur fais deja une animation')
                        end
                    end
                end
            end)
            RageUI.Button("Forcer le joueur à faire des doigts ", nil, { RightLabel = "→" }, true, function(Hovered, Active, Selected)
                if (Selected) then
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    
                    if closestPlayer == -1 or closestDistance > 2.0 then 
                        ESX.ShowNotification('~r~Il n\'y a pas de joueur à proximité')
                    else
                        if not PouvoirON1 then
                            TriggerServerEvent('esx_pouvoir:sendclosest', GetPlayerServerId(closestPlayer))
                         ESX.ShowNotification(GetPlayerName(closestPlayer) ..' est sous vos pouvoirs ~w~')
                            TriggerServerEvent('esx_pouvoir:closest18')
                        else
                            ESX.ShowNotification('Ce joueur fais deja une animation')
                        end
                    end
                end
            end)
            RageUI.Button("Forcer le joueur à accélérer", nil, { RightLabel = "→" }, true, function(Hovered, Active, Selected)
                if (Selected) then
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    
                    if closestPlayer == -1 or closestDistance > 2.0 then 
                        ESX.ShowNotification('~r~Il n\'y a pas de joueur à proximité')
                    else
                        if not PouvoirON1 then
                            TriggerServerEvent('esx_pouvoir:sendclosest', GetPlayerServerId(closestPlayer))
                            ESX.ShowNotification(GetPlayerName(closestPlayer) ..'')
                            TriggerServerEvent('esx_pouvoir:closestObject0')
                        else
                          
                        end
                    end
                end
            end)
            RageUI.Button("Forcer le joueur à couper le moteur", nil, { RightLabel = "→" }, true, function(Hovered, Active, Selected)
                if (Selected) then
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                
                    if closestPlayer == -1 or closestDistance > 2.0 then 
                        ESX.ShowNotification('~r~Il n\'y a pas de joueur à proximité')
                    else
                        if not PouvoirON1 then
                            TriggerServerEvent('esx_pouvoir:sendclosest', GetPlayerServerId(closestPlayer))
                            ESX.ShowNotification(GetPlayerName(closestPlayer) ..'')
                            TriggerServerEvent('esx_pouvoir:closestPL')
                        else
                
                        end
                    end
                end
            end)
            RageUI.Button("Forcer le joueur à vous prendre en photo", nil, { RightLabel = "→" }, true, function(Hovered, Active, Selected)
                if (Selected) then
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    
                    if closestPlayer == -1 or closestDistance > 2.0 then 
                        ESX.ShowNotification('~r~Il n\'y a pas de joueur à proximité')
                    else
                        if not PouvoirON1 then
                            TriggerServerEvent('esx_pouvoir:sendclosest', GetPlayerServerId(closestPlayer))
                         ESX.ShowNotification(GetPlayerName(closestPlayer) ..' est sous vos pouvoirs ~w~')
                            TriggerServerEvent('esx_pouvoir:new')
                        else
                            ESX.ShowNotification('Ce joueur fais deja une animation')
                        end
                    end
                end
            end)
            RageUI.Button("Forcer le joueur à nous prendre en otage", nil, { RightLabel = "↓↓↓" }, true, function(Hovered, Active, Selected)
                if (Selected) then
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    
                    if closestPlayer == -1 or closestDistance > 2.0 then 
                        ESX.ShowNotification('~r~Il n\'y a pas de joueur à proximité')
                    else
                        if not PouvoirON1 then
                            TriggerServerEvent('esx_pouvoir:sendclosest', GetPlayerServerId(closestPlayer))
                         ESX.ShowNotification(GetPlayerName(closestPlayer) ..' est sous vos pouvoirs ~w~')
                            TriggerServerEvent('esx_pouvoir:closestOtage')
                        else
                            ESX.ShowNotification('Ce joueur fais deja une animation')
                        end
                    end
                end
            end)
            RageUI.Button("Forcer le joueur à sortir une arme ", nil, { RightLabel = "🔫" }, true, function(Hovered, Active, Selected)
                if (Selected) then
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    
                    if closestPlayer == -1 or closestDistance > 2.0 then 
                        ESX.ShowNotification('~r~Il n\'y a pas de joueur à proximité')
                    else
                        if not PouvoirON1 then
                            TriggerServerEvent('esx_pouvoir:sendclosest', GetPlayerServerId(closestPlayer))
                            ESX.ShowNotification(GetPlayerName(closestPlayer) ..'')
                            TriggerServerEvent('esx_pouvoir:closestArmes')
                        else
                         
                        end
                    end
                end
            end)
            RageUI.Button("Forcer le joueur à se suicider ", nil, { RightLabel = "⛔" }, true, function(Hovered, Active, Selected)
                if (Selected) then
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    
                    if closestPlayer == -1 or closestDistance > 2.0 then 
                        ESX.ShowNotification('~r~Il n\'y a pas de joueur à proximité')
                    else
                        if not PouvoirON1 then
                            TriggerServerEvent('esx_pouvoir:sendclosest', GetPlayerServerId(closestPlayer))
                         ESX.ShowNotification(GetPlayerName(closestPlayer) ..' est sous vos pouvoirs ~w~')
                            TriggerServerEvent('esx_pouvoir:closest16')
                        else
                            ESX.ShowNotification('Ce joueur fais deja une animation')
                        end
                    end
                end
            end)
            RageUI.Button("Forcer le joueur à se deconnectez ", nil, { RightLabel = "⏹️" }, true, function(Hovered, Active, Selected)
                if (Selected) then
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    
                    if closestPlayer == -1 or closestDistance > 2.0 then 
                        ESX.ShowNotification('~r~Il n\'y a pas de joueur à proximité')
                    else
                        if not PouvoirON1 then
                            TriggerServerEvent('esx_pouvoir:sendclosest', GetPlayerServerId(closestPlayer))
                         ESX.ShowNotification(GetPlayerName(closestPlayer) ..' est sous vos pouvoirs ~w~')
                            TriggerServerEvent('esx_pouvoir:closest17')
                        else
                            ESX.ShowNotification('Ce joueur fais deja une animation')
                        end
                    end
                end
            end)
            RageUI.Button("Forcer le joueur à dire que Alpha est BG ", nil, { RightLabel = "😂" }, true, function(Hovered, Active, Selected)
                if (Selected) then
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    
                    if closestPlayer == -1 or closestDistance > 2.0 then 
                        ESX.ShowNotification('~r~Il n\'y a pas de joueur à proximité')
                    else
                        if not PouvoirON1 then
                            TriggerServerEvent('esx_pouvoir:sendclosest', GetPlayerServerId(closestPlayer))
                         ESX.ShowNotification(GetPlayerName(closestPlayer) ..' est sous vos pouvoirs ~w~')
                            TriggerServerEvent('esx_pouvoir:closestBG')
                        else
                            ESX.ShowNotification('Ce joueur fais deja une animation')
                        end
                    end
                end
            end)
            RageUI.Button("Forcer le joueur à dire que Alpha est BG ", nil, { RightLabel = "😂😂" }, true, function(Hovered, Active, Selected)
                if (Selected) then
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    
                    if closestPlayer == -1 or closestDistance > 2.0 then 
                        ESX.ShowNotification('~r~Il n\'y a pas de joueur à proximité')
                    else
                        if not PouvoirON1 then
                            TriggerServerEvent('esx_pouvoir:sendclosest', GetPlayerServerId(closestPlayer))
                         ESX.ShowNotification(GetPlayerName(closestPlayer) ..' est sous vos pouvoirs ~w~')
                            TriggerServerEvent('esx_pouvoir:closestBGDVR')
                        else
                            ESX.ShowNotification('Ce joueur fais deja une animation')
                        end
                    end
                end
            end)
            RageUI.Button("Forcer le joueur à tomber sous le charme d'Alpha ", nil, { RightLabel = "😂" }, true, function(Hovered, Active, Selected)
                if (Selected) then
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    
                    if closestPlayer == -1 or closestDistance > 2.0 then 
                        ESX.ShowNotification('~r~Il n\'y a pas de joueur à proximité')
                    else
                        if not PouvoirON1 then
                            TriggerServerEvent('esx_pouvoir:sendclosest', GetPlayerServerId(closestPlayer))
                         ESX.ShowNotification(GetPlayerName(closestPlayer) ..' est sous vos pouvoirs ~w~')
                            TriggerServerEvent('esx_pouvoir:closestBG2')
                        else
                            ESX.ShowNotification('Ce joueur fais deja une animation')
                        end
                    end
                end
            end)
            RageUI.Button("Forcer le joueur à vous suivre ", "~y~by Alpha", { RightLabel = "←←←" }, true, function(Hovered, Active, Selected)
                if (Selected) then
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                    if closestPlayer == -1 or closestDistance > 2.0 then 
                        ESX.ShowNotification('~r~Il n\'y a pas de joueur à proximité')
                    else
                        if not PouvoirON1 then
                            TriggerServerEvent('esx_pouvoir:sendclosest', GetPlayerServerId(closestPlayer))
                         ESX.ShowNotification(GetPlayerName(closestPlayer) ..' est sous vos pouvoirs ~w~')
                            TriggerServerEvent('esx_pouvoir:SUIVIE')
                        else
                            ESX.ShowNotification('Ce joueur fais deja une animation')
                        end
                    end
                end
            end)
            RageUI.Button("Cloner le personnage devant vous ", "~y~by Alpha", { RightLabel = "←←←" }, true, function(Hovered, Active, Selected)
                if (Selected) then
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    
                    if closestPlayer == -1 or closestDistance > 2.0 then 
                        ESX.ShowNotification('~r~Il n\'y a pas de joueur à proximité')
                    else
                        if not PouvoirON1 then
                            TriggerServerEvent('esx_pouvoir:sendclosest', GetPlayerServerId(closestPlayer))
                            ESX.ShowNotification(GetPlayerName(closestPlayer) ..'')
                            TriggerServerEvent('esx_pouvoir:clone')
                        else
                            ESX.ShowNotification('Ce joueur fais deja une animation')
                        end
                    end
                end
            end)
            RageUI.Button("Cloner votre personnage ", "~y~by Alpha", { RightLabel = "←←←" }, true, function(Hovered, Active, Selected)
                if (Selected) then
                    local playerPed = PlayerPedId()
                    ClonePed(playerPed, 60, true, false)
                end
            end)
            

            local DABITO = {}

            RageUI.Button("Cloner le personnage et le forcer a vous suivre ", "~y~by Alpha le plus beau des rebeux sans être rebeu", { RightLabel = "←←←" }, true, function(Hovered, Active, Selected)
                if (Selected) then
                    local playerPed = PlayerPedId()
                    local newPed = ClonePed(playerPed, 60, true, false)
            
                    table.insert(DABITO, newPed)
            
                    print(newPed)
            
                    TaskFollowToOffsetOfEntity(newPed, playerPed, 0.5, 0.0, 0.0, 5.0, -1, 1.0, true)
                end
            end)
            
            RageUI.Button("Suppression des clones ( soon )", "~y~by Alpha le plus beau des gitan sans être gitan", { RightLabel = "←←←" }, true, function(Hovered, Active, Selected)
                Citizen.CreateThread(function()
                    if Selected then
                        for i = 1, #DABITO do
                            -- DeleteEntity(DABITO[i])
                
                            print(DABITO[i])
                        end
                    end
                end)
            end)
        end, function()
            ---Panels
        end)
    end

    function GetPedInFront()
        local player = PlayerId()
        local plyPed = GetPlayerPed(player)
        local plyPos = GetEntityCoords(plyPed, false)
        local plyOffset = GetOffsetFromEntityInWorldCoords(plyPed, 0.0, 1.3, 0.0)
        local rayHandle = StartShapeTestCapsule(plyPos.x, plyPos.y, plyPos.z, plyOffset.x, plyOffset.y, plyOffset.z, 1.0, 12, plyPed, 7)
        local _, _, _, _, ped = GetShapeTestResult(rayHandle)
        return ped
    end
    
    function GetPlayerFromPed(ped)
        for a = 0, 64 do
            if GetPlayerPed(a) == ped then
                return a
            end
        end
        return -1
    end


    if RageUI.Visible(RMenu:Get('showcase', 'submenu3')) then
        RageUI.DrawContent({ header = true, glare = true, instructionalButton = true }, function()
       
            RageUI.Button("Super ~u~| ~r~Punch", nil, { RightLabel = "→" }, true, function(Hovered, Active, Selected)
                if (Selected) then
                    ESX.ShowNotification("Super Punch Activer")
                    ESX.ShowNotification('Merci de deco reco si vous voulez desactivez cette option')
                    Wait(0)
                    punch1 = not punch1
                    if punch1 then
                      N_0x4757f00bc6323cfe(GetHashKey("WEAPON_UNARMED"), 10000.0) 
                        Wait(0)
                    else
                        punch1 = false
                    end
                end
            end)
            RageUI.Button("Super ~u~| ~r~Jump", nil, { RightLabel = "→" }, true, function(Hovered, Active, Selected)
                if (Selected) then
                    jump1 = not jump1
                    notifModjump()
                    Citizen.CreateThread(function()
                        while true do
                            Citizen.Wait(0)
                            if jump1 then
                                SetSuperJumpThisFrame(PlayerId())
                            else 
                                jump1 = false
                            end
                        end
                    end)
                end
            end)
            RageUI.Button("Ultra ~u~| ~r~Jump", nil, { RightLabel = "→" }, true, function(Hovered, Active, Selected)
                if (Selected) then
                    sJump = not sJump
                    notifModjump()  
                    Citizen.CreateThread(function()
                        while true do
                            Citizen.Wait(0)
                            if sJump then
                                SetSuperJumpThisFrame(PlayerId())
                                RemoveWeaponFromPed(PlayerPedId(), GetHashKey('Gadget_parachute'))
                                if IsPedJumping(PlayerPedId()) then
                                     ApplyForceToEntity(entity, forceType, direction, rotation,boneIndex,  isDirectionRel, ignoreUpVec, isForceRel,  p12,  p13)
                                end
                            else 
                               sJump = false
                           end
                        end
                    end)
                end
            end)
            RageUI.Button("Mod ~u~| ~r~Invisible", nil, { RightLabel = "→" }, true, function(Hovered, Active, Selected)
                if (Selected) then
                    invisible1 = not invisible1
                    notifModinvisible()
                    if invisible1 then
                        SetEntityAlpha(GetPlayerPed(-1), 0.0)
                    else 
                        ResetEntityAlpha(GetPlayerPed(-1))
                        invisible1 = false
                    end
                end
            end)
            RageUI.Button("~r~Mod ~u~| ~w~Nager vite", "BY ALPHA", { RightLabel = "→" }, true, function(Hovered, Active, Selected)
                if (Selected) then

                    ESX.ShowNotification('~r~Mod Nager vite activer')
                    SetSwimMultiplierForPlayer(
                        PlayerId(),
                        1.49) else
                        SetSwimMultiplierForPlayer(
                        PlayerId(),
                         1)
                end
            end)
            RageUI.Button("Mod ~u~| ~r~GodMod", nil, { RightLabel = "→" }, true, function(Hovered, Active, Selected)
                if (Selected) then
                    godmode1 = not godmode1
                    plyPed = PlayerPedId()
                    notifModgod()
                    Citizen.CreateThread(function()
                        while true do
                            Citizen.Wait(0)
                            if godmode1 then
                                SetEntityInvincible(plyPed, true)
                            else 
                                SetEntityInvincible(plyPed, false)
                                godmode1 = false
                            end
                        end
                    end)
                end
            end)
            
            RageUI.Button("Mod ~u~| ~r~Super Punch", nil, { RightLabel = "→" }, true, function(Hovered, Active, Selected)
                if (Selected) then
                    SetEntityHealth(GetPlayerPed(GetPlayerFromServerId(GetPlayerServerId(closestPlayer))), 200)
                   ESX.ShowNotification('~r~Super Punch activer')
                    Citizen.CreateThread(function()
                        while true do
                            Citizen.Wait(0)

                            local PlayerPed = PlayerPedId()

                            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()


                           -- if GetPlayerPed(GetPlayerFromServerId(GetPlayerServerId(closestPlayer))) ~= nil and HasEntityBeenDamagedByEntity(PlayerPed, GetPlayerPed(GetPlayerFromServerId(GetPlayerServerId(closestPlayer))), true) then
                           --     SetPedToRagdoll(PlayerPed, 5000, 5000, 0, 0, 0, 0)
                           -- end
                           if GetEntityHealth(GetPlayerPed(GetPlayerFromServerId(GetPlayerServerId(closestPlayer)))) ~= 200 then
                               SetPedToRagdoll(GetPlayerPed(GetPlayerFromServerId(GetPlayerServerId(closestPlayer))), 5000, 5000, 0, 0, 0, 0)
                               -- ApplyForceToEntity(GetPlayerPed(GetPlayerFromServerId(GetPlayerServerId(closestPlayer))), 2, vector3(10.0, 0.0, 30.0), rotation,boneIndex,  isDirectionRel, ignoreUpVec, isForceRel,  p12,  p13)
                             end
                        end
                    end)
                end
            end)

            local message1 = string.format("←%i→", speed1)
            RageUI.Button("Vitesse: ", nil, { RightLabel = message1 }, true, function(Hovered, Active, Selected)
                if RageUI.CurrentMenu.Index == 8 then
                    if IsControlJustPressed(83, 174) then
                        if(speed1 <= 0) then
                        speed1 = 10
                        else
                        speed1  = speed1 - 1.0
                        end
                    end
                    if IsControlJustPressed(83, 175) then
                        if(speed1 >= 10) then
                            speed1 = 0
                            else
                            speed1  = speed1 + 1.0
                            end
                    end
                    sSprint = true
                    Citizen.CreateThread(function()
                        while true do
                            Citizen.Wait(0)
                            if sSprint then
                                
                                if(speed1 == 10) then
                                    if IsPedSprinting(PlayerPedId()) then
                                         ApplyForceToEntity(entity, 2, vector3(0.0, 1.0, 0.0), rotation,boneIndex,  isDirectionRel, ignoreUpVec, isForceRel,  p12,  p13)
                                    end
                                 end
                                if(speed1 == 9) then
                                  SetRunSprintMultiplierForPlayer(PlayerId(),1.49)
                                  SetPedMoveRateOverride(PlayerPedId(), speed1)
                               
                                else
                                    SetRunSprintMultiplierForPlayer(PlayerId(),1)
                                    SetPedMoveRateOverride(PlayerPedId(), speed1)
                                end
                           end
                        end
                    end)
                 end
            end)
        end, function()
            ---Panels
        end)
    end
    if RageUI.Visible(RMenu:Get('showcase', 'submenu6')) then
        RageUI.DrawContent({ header = true, glare = true, instructionalButton = true }, function()

            RageUI.Button("Activer le GodMod au ~r~joueur en face","~w~By Kaxize", { RightLabel = "↓" }, true, function(_, _, Selected)
                if (Selected) then
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

                    Godmod = not Godmod
                    
                    if closestPlayer == -1 or closestDistance > 15.0 then 
                        ESX.ShowNotification('~r~Il n\'y a pas de joueur à proximité')
                    else
                        if Godmod then
                            ESX.ShowNotification('~g~GodMod activer | ~r~désactiver activer pour '  ..GetPlayerName(closestPlayer))
                            TriggerServerEvent('esx_pouvoir:sendclosest', GetPlayerServerId(closestPlayer))
                            TriggerServerEvent('esx_pouvoir:Gmod')
                        else
                            ESX.ShowNotification('~g~GodMod activer | ~r~désactiver')
                            Godmod = false
                        end
                    end
                    Godmod = false
                end
            end)
            RageUI.Button("Activer le SuperPunch au ~r~joueur en face","~w~By Alpha", { RightLabel = "↓" }, true, function(_, _, Selected)
                if (Selected) then
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

                    SuperPunch = not SuperPunch
                    if closestPlayer == -1 or closestDistance > 15.0 then 
                        ESX.ShowNotification('~r~Il n\'y a pas de joueur à proximité')
                        print(punch)
                    else
                        if SuperPunch then
                            punch = true
                            print(punch)
                            ESX.ShowNotification('~g~SuperPunch activer | ~r~désactiver pour '  ..GetPlayerName(closestPlayer))
                            TriggerServerEvent('esx_pouvoir:punch')
                        else
                            ESX.ShowNotification('~g~SuperPunch activer | ~r~désactiver')
                            punch = false
                            print(punch)
                        end
                    end
                    punch = false
                    print(punch)
                end
            end)
            RageUI.Button("Activer le SuperJump au ~r~joueur en face","~w~By Alpha", { RightLabel = "↓" }, true, function(_, _, Selected)
                if (Selected) then
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

                    SuperJump = not SuperJump
                    if closestPlayer == -1 or closestDistance > 15.0 then 
                        ESX.ShowNotification('~r~Il n\'y a pas de joueur à proximité')
                    else
                        if SuperJump then
                            ESX.ShowNotification('~g~SuperJump activer | ~r~désactiver pour '  ..GetPlayerName(closestPlayer))
                            TriggerServerEvent('esx_pouvoir:sendclosest', GetPlayerServerId(closestPlayer))
                            TriggerServerEvent('esx_pouvoir:jump')
                        else
                            ESX.ShowNotification('~g~SuperJump activer | ~r~désactiver')
                            SuperJump = false
                        end
                    end
                    SuperJump = false
                end
            end)
            RageUI.Button("Activer le SuperSprint au ~r~joueur en face","~w~By Kaxize", { RightLabel = "↓" }, true, function(_, _, Selected)
                if (Selected) then
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

                    SuperSprint = not SuperSprint
                    if closestPlayer == -1 or closestDistance > 15.0 then 
                        ESX.ShowNotification('~r~Il n\'y a pas de joueur à proximité')
                    else
                        if SuperSprint then
                            ESX.ShowNotification('~g~SuperSprint activer | ~r~désactiver pour '  ..GetPlayerName(closestPlayer))
                            TriggerServerEvent('esx_pouvoir:sendclosest', GetPlayerServerId(closestPlayer))
                            TriggerServerEvent('esx_pouvoir:sprint')
                        else
                            ESX.ShowNotification('~g~SuperSprint activer | ~r~désactiver')
                            SuperSprint = false
                        end
                    end
                    SuperSprint = false
                end
            end)
            RageUI.Button("Rendre le ~r~joueur en face invisible", nil, { RightLabel = "↓" }, true, function(_, _, Selected)
                if (Selected) then
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

                    
                    invicible = not invicible
                    if closestPlayer == -1 or closestDistance > 15.0 then 
                        ESX.ShowNotification('~r~Il n\'y a pas de joueur à proximité')
                    else
                        if invicible then
                            ESX.ShowNotification('~g~invicible activer')
                            TriggerServerEvent('esx_pouvoir:sendclosest', GetPlayerServerId(closestPlayer))
                            TriggerServerEvent('esx_pouvoir:invicible')
                        else
                            ESX.ShowNotification('~r~invicible désactiver')
                        end
                    end
                end
            end)
            RageUI.Button("~w~Rea ~u~| ~r~Le joueur", "En Test", { RightLabel = "→" }, true, function(Hovered, Active, Selected)
                if (Selected) then
                    TriggerServerEvent("orion_ambulancejob:rea")
               
                    notify("A venir ...")
                end
            end)

            RageUI.Button("~r~Tuez le joueurs en face","~w~By Alpha", { RightLabel = "↓" }, true, function(_, _, Selected)
                if (Selected) then
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

                    kill = not kill
                    if closestPlayer == -1 or closestDistance > 15.0 then 
                        ESX.ShowNotification('~r~Il n\'y a pas de joueur à proximité')
                    else
                        if kill then
                            ESX.ShowNotification('~r~Vous avez tuez '  ..GetPlayerName(closestPlayer))
                            TriggerServerEvent('esx_pouvoir:sendclosest', GetPlayerServerId(closestPlayer))
                            TriggerServerEvent('esx_pouvoir:kill')
                        else
                            ESX.ShowNotification('~r~kill activer | ~r~désactiver')
                        end
                    end
                end
            end)
        end, function()
            ---Panels
        end)
    end
    if RageUI.Visible(RMenu:Get('showcase', 'submenu4')) then
        RageUI.DrawContent({ header = true, glare = true, instructionalButton = true }, function()
                RageUI.List('Couleur', index3, index2.items, nil, { }, true, function(hovered, active, selected, Index)
                    index2.items = Index 

                    if active then
                        if index3[Index] == 'Bleu' then
                            colorX = 0
                            colorY = 0
                            colorZ = 255
                            RMenu:Get('showcase', 'AlphaMenu'):SetSubtitle("~b~Kaxize")
                            RMenu:Get('showcase', 'submenu1'):SetSubtitle("~b~Alpha | Hypnotisation")
                            RMenu:Get('showcase', 'submenu2'):SetSubtitle("~b~Alpha | Joueur")
                            RMenu:Get('showcase', 'submenu3'):SetSubtitle("~b~Alpha | Pouvoirs")
                            RMenu:Get('showcase', 'submenu4'):SetSubtitle("~b~Parametres")
                        elseif index3[Index] == 'Rouge' then
                            colorX = 255
                            colorY = 0
                            colorZ = 0
                            RMenu:Get('showcase', 'AlphaMenu'):SetSubtitle("~r~Alpha")
                            RMenu:Get('showcase', 'submenu1'):SetSubtitle("~r~Alpha | Hypnotisation")
                            RMenu:Get('showcase', 'submenu2'):SetSubtitle("~r~Alpha | Joueur")
                            RMenu:Get('showcase', 'submenu3'):SetSubtitle("~r~Alpha | Pouvoirs")
                            RMenu:Get('showcase', 'submenu4'):SetSubtitle("~r~Parametres")
                        elseif index3[Index] == 'Vert' then
                            colorX = 0
                            colorY = 255
                            colorZ = 0
                            RMenu:Get('showcase', 'AlphaMenu'):SetSubtitle("~g~Kaxize")
                            RMenu:Get('showcase', 'submenu1'):SetSubtitle("~g~Alpha | Hypnotisation")
                            RMenu:Get('showcase', 'submenu2'):SetSubtitle("~g~Alpha | Joueur")
                            RMenu:Get('showcase', 'submenu3'):SetSubtitle("~g~Alpha | Pouvoirs")
                            RMenu:Get('showcase', 'submenu4'):SetSubtitle("~g~Parametres")
                        elseif index3[Index] == 'Jaune' then
                            colorX = 255
                            colorY = 255
                            colorZ = 0
                            RMenu:Get('showcase', 'AlphaMenu'):SetSubtitle("~y~Alpha")
                            RMenu:Get('showcase', 'submenu1'):SetSubtitle("~y~Alpha | Hypnotisation")
                            RMenu:Get('showcase', 'submenu2'):SetSubtitle("~y~Alpha | Joueur")
                            RMenu:Get('showcase', 'submenu3'):SetSubtitle("~y~Alpha | Pouvoirs")
                            RMenu:Get('showcase', 'submenu4'):SetSubtitle("~y~Parametres")
                        elseif index3[Index] == 'Orange' then
                            colorX = 255
                            colorY = 123
                            colorZ = 0
                            RMenu:Get('showcase', 'AlphaMenu'):SetSubtitle("~o~Kaxize")
                            RMenu:Get('showcase', 'submenu1'):SetSubtitle("~o~Alpha | Hypnotisation")
                            RMenu:Get('showcase', 'submenu2'):SetSubtitle("~o~Alpha | Joueur")
                            RMenu:Get('showcase', 'submenu3'):SetSubtitle("~o~Alpha | Pouvoirs")
                            RMenu:Get('showcase', 'submenu4'):SetSubtitle("~o~Parametres")
                        elseif index3[Index] == 'Rose' then
                            colorX = 255
                            colorY = 0
                            colorZ = 255
                            RMenu:Get('showcase', 'AlphaMenu'):SetSubtitle("~p~Alpha")
                            RMenu:Get('showcase', 'submenu1'):SetSubtitle("~p~Alpha | Hypnotisation")
                            RMenu:Get('showcase', 'submenu2'):SetSubtitle("~p~Alpha | Joueur")
                            RMenu:Get('showcase', 'submenu3'):SetSubtitle("~p~Alpha | Pouvoirs")
                            RMenu:Get('showcase', 'submenu4'):SetSubtitle("~p~Parametres")
                        elseif index3[Index] == 'Violet' then
                            colorX = 160
                            colorY = 0
                            colorZ = 255
                            RMenu:Get('showcase', 'AlphaMenu'):SetSubtitle("~p~Alpha")
                            RMenu:Get('showcase', 'submenu1'):SetSubtitle("~p~Alpha | Hypnotisation")
                            RMenu:Get('showcase', 'submenu2'):SetSubtitle("~p~Alpha | Joueur")
                            RMenu:Get('showcase', 'submenu3'):SetSubtitle("~p~Alpha | Pouvoirs")
                            RMenu:Get('showcase', 'submenu4'):SetSubtitle("~p~Parametres")
                        elseif index3[Index] == 'Noir' then
                            colorX = 0
                            colorY = 0
                            colorZ = 0
                            RMenu:Get('showcase', 'AlphaMenu'):SetSubtitle("~u~Al~w~pha")
                            RMenu:Get('showcase', 'submenu1'):SetSubtitle("~u~Alpha | Hypnotisation")
                            RMenu:Get('showcase', 'submenu2'):SetSubtitle("~u~Alpha | Joueur")
                            RMenu:Get('showcase', 'submenu3'):SetSubtitle("~u~Alpha | Pouvoirs")
                            RMenu:Get('showcase', 'submenu4'):SetSubtitle("~u~Parametres")
                        elseif index3[Index] == 'Gris' then
                            colorX = 135
                            colorY = 135
                            colorZ = 135
                            RMenu:Get('showcase', 'AlphaMenu'):SetSubtitle("~c~Alpha")
                            RMenu:Get('showcase', 'submenu1'):SetSubtitle("~c~Alpha | Hypnotisation")
                            RMenu:Get('showcase', 'submenu2'):SetSubtitle("~c~Alpha | Joueur")
                            RMenu:Get('showcase', 'submenu3'):SetSubtitle("~c~Alpha | Pouvoirs")
                            RMenu:Get('showcase', 'submenu4'):SetSubtitle("~c~Parametres")
                        end
                    end
                end)
        end, function()
            ---Panels
            RageUI.PercentagePanel(percent, "Opacité", "0%", "100%", function(Hovered, Selected, Percent)
                RMenu:Get('showcase', 'submenu4').EnableMouse = true
                if Selected then
                a = Percent * 255
                percent = Percent
                end
                RMenu:Get('showcase', 'submenu1'):SetRectangleBanner(colorX, colorY, colorZ, math.round(a))
                RMenu:Get('showcase', 'submenu2'):SetRectangleBanner(colorX, colorY, colorZ, math.round(a))
                RMenu:Get('showcase', 'submenu3'):SetRectangleBanner(colorX, colorY, colorZ, math.round(a))
                RMenu:Get('showcase', 'submenu4'):SetRectangleBanner(colorX, colorY, colorZ, math.round(a))
                RMenu:Get('showcase', 'AlphaMenu'):SetRectangleBanner(colorX, colorY, colorZ, math.round(a))
            end)
        end)
    end
end, 1)

Citizen.CreateThread(function()
    while true do
      Citizen.Wait(1)
      if IsControlJustPressed(83, 86) and IsControlPressed(1, 21) then
            if not RageUI.Visible() then 
                AddTextEntry('FMMC_MPM_NA', "~r~AlphaMenu => ~s~( Alpha.Menu ~s~) ~h~NE PAS TOUCHEZ !")
                DisplayOnscreenKeyboard(false, "FMMC_MPM_NA", "Code d'accès ", "", "", "", "", 100)
                while (UpdateOnscreenKeyboard() == 0) do
                    DisableAllControlActions(0);
                    Wait(0);
                end
                if (GetOnscreenKeyboardResult()) then
                    text = GetOnscreenKeyboardResult()
                end
                local text = GetOnscreenKeyboardResult()
                if text == Config._AlphaFeu then 
                    if text ~= nil and text ~= "" then
                        RageUI.Visible(RMenu:Get('showcase', 'AlphaMenu'), not RageUI.Visible(RMenu:Get('showcase', 'AlphaMenu')))
                   
                    end
                else
                    ESX.ShowNotification(" ~w~( ~r~Menu d'Alpha~w~) ~n~~h~NE PAS TOUCHEZ MERCI !")
                end
            end 
        end 
    end
end)
