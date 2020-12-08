-- [ ESSE SISTEMA FOI DESENVOLVIDO POR Edu#0069 ou rossiniJS ] --
-- [ ESSE SISTEMA É 100% GRATUITO E OPEN SOURCE, SUA VENDA É PROIBIDA ] --
-- [ VISITE NOSSA LOJA E SAIBA MAIS SOBRE NOSSO TRABALHO - discord.gg/bABGBEX ] --
-- [ VISITE NOSSO GITHUB PARA TER ACESSO A MAIS SCRIPTS GRATUITOS COMO ESSE AQUI ] --
-- [ PARA CONSEGUIR AJUDA COM ESSE OU OUTRO DE NOSSOS SISTEMAS GRATUITOS, ACESSE NOSSO DISCORD ] --

local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

EMS = Tunnel.getInterface("bdl_emsystem")

local menuactive = false
function ToggleActionMenu()
	menuactive = not menuactive
	if menuactive then
		SetNuiFocus(true,true)
		TransitionToBlurred(1000)
		SendNUIMessage({ showmenu = true })
	else
		SetNuiFocus(false)
		TransitionFromBlurred(1000)
		SendNUIMessage({ hidemenu = true })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
--[ BUTTON ]-----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("ButtonClick",function(data,cb)
	local ped = PlayerPedId()
	if data == "paracetamol" then
		if EMS.checkPermission("lsmd.permission") then
			TriggerServerEvent("bdl:emsystem","r-paracetamol")
		else
			TriggerEvent('Notify','negado','Você precisa entrar em serviço para pegar qualquer receita do prontuário médico.',5000)
		end
	
	elseif data == "dorflex" then
		if EMS.checkPermission("lsmd.permission") then
			TriggerServerEvent("bdl:emsystem","r-dorflex")
		else
			TriggerEvent('Notify','negado','Você precisa entrar em serviço para pegar qualquer receita do prontuário médico.',5000)
		end

	elseif data == "clonazepam" then
		if EMS.checkPermission("lsmd.permission") then
			TriggerServerEvent("bdl:emsystem","r-clonazepam")
		else
			TriggerEvent('Notify','negado','Você precisa entrar em serviço para pegar qualquer receita do prontuário médico.',5000)
		end

	elseif data == "voltaren" then
		if EMS.checkPermission("lsmd.permission") then
			TriggerServerEvent("bdl:emsystem","r-voltaren")
		else
			TriggerEvent('Notify','negado','Você precisa entrar em serviço para pegar qualquer receita do prontuário médico.',5000)
		end

	elseif data == "buscopan" then
		if EMS.checkPermission("lsmd.permission") then
			TriggerServerEvent("bdl:emsystem","r-buscopan")
		else
			TriggerEvent('Notify','negado','Você precisa entrar em serviço para pegar qualquer receita do prontuário médico.',5000)
		end

	elseif data == "tandrilax" then
		if EMS.checkPermission("lsmd.permission") then
			TriggerServerEvent("bdl:emsystem","r-tandrilax")
		else
			TriggerEvent('Notify','negado','Você precisa entrar em serviço para pegar qualquer receita do prontuário médico.',5000)
		end
		
	elseif data == "loratadina" then
		if EMS.checkPermission("lsmd.permission") then
			TriggerServerEvent("bdl:emsystem","r-loratadina")
		else
			TriggerEvent('Notify','negado','Você precisa entrar em serviço para pegar qualquer receita do prontuário médico.',5000)
		end

	elseif data == "on-service" then
		TriggerServerEvent('bdl:onservice')

	elseif data == "off-service" then
		TriggerServerEvent('bdl:offservice')
		
	elseif data == "take-kit" then
		if EMS.checkPermission("lsmd.permission") then
			SetPedArmour(ped,100)
			GiveWeaponToPed(ped,"WEAPON_STUNGUN",0,0,0)
			GiveWeaponToPed(ped,"WEAPON_FLASHLIGHT",0,0,0)
		else
			TriggerEvent('Notify','negado','Você precisa entrar em serviço para pegar qualquer equipamento do estoque do LSMD.',5000)
		end
		
	elseif data == "rem-kit" then
		SetPedArmour(ped,0)
		RemoveAllPedWeapons(ped,0)

	elseif data == "clear-med" then
		TriggerServerEvent('bdl:clearmed')
		TriggerEvent('Notify','sucesso','Você guardou seus <b> Receituários </b> de volta no prontuário',5000)

	elseif data == "fechar" then
		ToggleActionMenu()
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ LOCAIS ]-----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
local system = {
	{ ['x'] = 337.47, ['y'] = -586.3, ['z'] = 28.9 },
	{ ['x'] = 317.19, ['y'] = -601.1, ['z'] = 43.3 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
--[ MENU ]-------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
	SetNuiFocus(false,false)
	while true do
		local sleep = 1000

		for k,v in pairs(system) do
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(v.x,v.y,v.z)
			local distance = GetDistanceBetweenCoords(v.x,v.y,cdz,x,y,z,true)
			local system = system[k]
			
			if distance <= 5 then
				DrawMarker(20, system.x, system.y, system.z-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,255,0,0,50,0,0,0,1)
				sleep = 5
				if distance <= 1.2 then
					if IsControlJustPressed(0,38) and EMS.checkEms() then
						ToggleActionMenu()
					end
				end
			end
		end
		Citizen.Wait(sleep)
	end
end)