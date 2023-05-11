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


function Object13()
    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    
    if closestPlayer == -1 or closestDistance > 2.0 then 
        ESX.ShowNotification('~r~Il n\'y a pas de joueur à proximité')
    else
        if not PouvoirON1 then
            TriggerServerEvent('esx_pouvoir:sendclosest', GetPlayerServerId(closestPlayer))
            ESX.ShowNotification(GetPlayerName(closestPlayer) ..'')
            TriggerServerEvent('esx_pouvoir:closestObject13')
        else

        end
    end
end

Citizen.CreateThread(function()
	while true do
        Wait(1)
        if PoingActiver then
            SetExplosiveMeleeThisFrame(PlayerId())
            local x, y, z = table.unpack(BulletCoords())
            if x ~= 0.0 and y ~= 0.0 and z ~= 0.0 then
                local ped = GetPlayerPed(-1)
                print('test')
                AddOwnedExplosion(ped, x, y, z, 1, 20.0, true, false, 0.0)
            end
        end
        end
end)



function notifModjump()
	notifmodjump = not notifmodjump
	if notifmodjump then
		SetNotificationBackgroundColor(50)
		notify(Config.superjumpac)
	else
		SetNotificationBackgroundColor(50)
		notify(Config.superjumpdc)
	end
end

function notifModsprint()
	notifmodsprint = not notifmodsprint
	if notifmodsprint then
		SetNotificationBackgroundColor(50)
		notify(Config.notifmodsprintac)
	else
		SetNotificationBackgroundColor(50)
		notify(Config.notifmodsprintdc)
	end
end

function notifModinvisible()
	notifmodinvisible = not notifmodinvisible
	if notifmodinvisible then
		SetNotificationBackgroundColor(50)
		notify(Config.notifmodinvisibleac)
	else
		SetNotificationBackgroundColor(50)
		notify(Config.notifmodinvisibledc)
	end
end

function notifModgod()
	notifmodgod = not notifmodgod
	if notifmodgod then
		SetNotificationBackgroundColor(50)
		notify(Config.notifmodgodac)
	else
		SetNotificationBackgroundColor(50)
		notify(Config.notifmodgoddc)
	end
end

function notify(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(true, true)
end

function loadAnimDict(dict)
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(1)
	end
end

RegisterNetEvent("c_opa")
AddEventHandler("c_opa", function(c_ped, opac)
	SetEntityAlpha(NetToPed(c_ped), opac)
end)