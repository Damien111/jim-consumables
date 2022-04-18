local QBCore = exports['qb-core']:GetCoreObject()

--Consumables
CreateThread(function()
    for k,v in pairs(Config.Consumables) do
		QBCore.Functions.CreateUseableItem(k, function(source, item)
			TriggerClientEvent('jim-consumables:Consume', source, item.name)
		end)
	end
	local itemcheck = {}
	local emotecheck = {}
    for k,v in pairs(Config.Consumables) do
		QBCore.Functions.CreateUseableItem(k, function(source, item) TriggerClientEvent('jim-consumables:Consume', source, item.name) end)
		if not QBCore.Shared.Items[k] then print("Item check - '"..k.."' not found in the shared lua") elseif QBCore.Shared.Items[k] then end
		if not Config.Emotes[v.emote] then print("Emote check - '"..k.."' requested emote '"..v.emote.."' - not found in config.lua") elseif Config.Emotes[v.emote] then end
	end
end)