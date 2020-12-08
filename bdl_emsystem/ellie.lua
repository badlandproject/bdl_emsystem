-- [ ESSE SISTEMA FOI DESENVOLVIDO POR Edu#0069 ou rossiniJS ] --
-- [ ESSE SISTEMA É 100% GRATUITO E OPEN SOURCE, SUA VENDA É PROIBIDA ] --
-- [ VISITE NOSSA LOJA E SAIBA MAIS SOBRE NOSSO TRABALHO - discord.gg/bABGBEX ] --
-- [ VISITE NOSSO GITHUB PARA TER ACESSO A MAIS SCRIPTS GRATUITOS COMO ESSE AQUI ] --
-- [ PARA CONSEGUIR AJUDA COM ESSE OU OUTRO DE NOSSOS SISTEMAS GRATUITOS, ACESSE NOSSO DISCORD ] --

local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

EMS = {}
Tunnel.bindInterface("bdl_emsystem",EMS)

local items = {
   { item = 'r-paracetamol', name = 'Paracetamol', quantidade = 1 },
   { item = 'r-dorflex', name = 'Dorflex', quantidade = 1 },
   { item = 'r-clonazepam', name = 'Clonazepam', quantidade = 1 },
   { item = 'r-voltaren', name = 'Voltaren', quantidade = 1 },
   { item = 'r-buscopan', name = 'Buscopan', quantidade = 1 },
   { item = 'r-tandrilax', name = 'Tandrilax', quantidade = 1 },
   { item = 'r-loratadina', name = 'Loratadina', quantidade = 1 },

}


RegisterNetEvent('bdl:emsystem')
AddEventHandler('bdl:emsystem',function(item)
    local source = source
    local user_id = vRP.getUserId(source)
    for k,v in pairs(items) do
        if user_id then
            if item == v.item then
                TriggerClientEvent("Notify",source,"negado","Você pegou a receita de um <b>" ..v.name.. "</b>",5000)
                vRP.giveInventoryItem(user_id,v.item,v.quantidade)
            end
        end
    end
end)

RegisterNetEvent('bdl:clearmed')
AddEventHandler('bdl:clearmed',function()
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        vRP.tryGetInventoryItem(user_id,"r-paracetamol",1)
        vRP.tryGetInventoryItem(user_id,"r-dorflex",1)
        vRP.tryGetInventoryItem(user_id,"r-clonazepam",1)
        vRP.tryGetInventoryItem(user_id,"r-voltaren",1)
        vRP.tryGetInventoryItem(user_id,"r-buscopan",1)
        vRP.tryGetInventoryItem(user_id,"r-tandrilax",1)
        vRP.tryGetInventoryItem(user_id,"r-loratadina",1)
    end
end)

RegisterServerEvent("bdl:onservice")
AddEventHandler("bdl:onservice",function()
    local user_id = vRP.getUserId(source)

    if vRP.hasPermission(user_id,"oos-intern.permission") then
        vRP.addUserGroup(user_id,"lsmd-intern")
        TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
    
    elseif vRP.hasPermission(user_id,"oos-nurse.permission") then
        vRP.addUserGroup(user_id,"lsmd-nurse")
        TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
       
    elseif vRP.hasPermission(user_id,"oos-paramedic.permission") then
        vRP.addUserGroup(user_id,"lsmd-paramedic")
        TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
        
    elseif vRP.hasPermission(user_id,"oos-interndoctor.permission") then
        vRP.addUserGroup(user_id,"lsmd-interndoctor")
        TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
       
    elseif vRP.hasPermission(user_id,"oos-doctor.permission") then
        vRP.addUserGroup(user_id,"lsmd-doctor")
        TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
       
    elseif vRP.hasPermission(user_id,"oos-clinic.permission") then
        vRP.addUserGroup(user_id,"lsmd-clinic")
        TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
       
    elseif vRP.hasPermission(user_id,"oos-vicedirector.permission") then
        vRP.addUserGroup(user_id,"lsmd-vicedirector")
        TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		
	elseif vRP.hasPermission(user_id,"oos-director.permission") then
        vRP.addUserGroup(user_id,"lsmd-director")
        TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
        
    else
        TriggerClientEvent("Notify",source,"negado","Você já está em serviço.")
    end
end)

RegisterServerEvent("bdl:offservice")
AddEventHandler("bdl:offservice",function()
    local user_id = vRP.getUserId(source)

    if vRP.hasPermission(user_id,"intern.permission") then
        vRP.addUserGroup(user_id,"oos-intern")
		EMS.remEquip()
        TriggerClientEvent("Notify",source,"sucesso","Você saiu de serviço.")
    
    elseif vRP.hasPermission(user_id,"nurse.permission") then
        vRP.addUserGroup(user_id,"oos-nurse")
		EMS.remEquip()
        TriggerClientEvent("Notify",source,"sucesso","Você saiu de serviço.")
       
    elseif vRP.hasPermission(user_id,"paramedic.permission") then
        vRP.addUserGroup(user_id,"oos-paramedic")
		EMS.remEquip()
        TriggerClientEvent("Notify",source,"sucesso","Você saiu de serviço.")
        
    elseif vRP.hasPermission(user_id,"interndoctor.permission") then
        vRP.addUserGroup(user_id,"oos-interndoctor")
		EMS.remEquip()
        TriggerClientEvent("Notify",source,"sucesso","Você saiu de serviço.")
       
    elseif vRP.hasPermission(user_id,"doctor.permission") then
        vRP.addUserGroup(user_id,"oos-doctor")
		EMS.remEquip()
        TriggerClientEvent("Notify",source,"sucesso","Você saiu de serviço.")
       
    elseif vRP.hasPermission(user_id,"clinic.permission") then
        vRP.addUserGroup(user_id,"oos-clinic")
		EMS.remEquip()
        TriggerClientEvent("Notify",source,"sucesso","Você saiu de serviço.")
       
    elseif vRP.hasPermission(user_id,"vicedirector.permission") then
        vRP.addUserGroup(user_id,"oos-vicedirector")
		EMS.remEquip()
        TriggerClientEvent("Notify",source,"sucesso","Você saiu de serviço.")
		
	elseif vRP.hasPermission(user_id,"director.permission") then
        vRP.addUserGroup(user_id,"oos-director")
		EMS.remEquip()
        TriggerClientEvent("Notify",source,"sucesso","Você saiu de serviço.")
        
    else
        TriggerClientEvent("Notify",source,"negado","Você já está fora de serviço.")
    end
end)

function EMS.remEquip()
	local src = source
    local user_id = vRP.getUserId(src)
	if user_id then
		vRPclient.setArmour(source,0)
		vRPclient._replaceWeapons(source,{["WEAPON_UNARMED"] = { ammo = 0 }})
	end
end

function EMS.checkPermission(permission)
    local src = source
    local user_id = vRP.getUserId(src)
    if user_id then
        return vRP.hasPermission(user_id,permission)
    end
end

function EMS.checkEms()
	local src = source
	local user_id = vRP.getUserId(src)
	if vRP.hasPermission(user_id,"lsmd.permission") or vRP.hasPermission(user_id,"oos-lsmd.permission") then
		return true
	else
		TriggerClientEvent("Notify",source,"negado","Você não tem permissão.")
	end
end