local LarsMod = RegisterMod("LarsMod", 1)

local LarsCostume = Isaac.GetCostumeIdByPath("gfx/characters/Lars.anm2")
local LarsItem = Isaac.GetItemIdByName("The Dreads")

local Lars = {
	DAMAGE = 30,
	SPEED = 0.5,
	SHOTSPEED = 0.3,
	LUCK = 1
}

function LarsMod:mainBehaviour()

	if Game():GetFrameCount() == 1 then
		Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, LarsItem, Vector(320,300), Vector(0,0), nil)
		LarsMod.HasTheDreads = false;
	end

	if Game():GetPlayer(0):HasCollectible(LarsItem) then
		if not LarsMod.HasTheDreads then
			Game():GetPlayer(0):AddNullCostume(LarsCostume)
			LarsMod.HasTheDreads = true
		end
	end
end
LarsMod:AddCallback(ModCallbacks.MC_POST_UPDATE, LarsMod.mainBehaviour)

function LarsMod:CacheUpdate(player, cacheFlag)

	if cacheFlag == cacheFlag.CACHE_DAMAGE then
		if player:HasCollectible(LarsItem) then
			player.Damage = player.Damage + Lars.DAMAGE;
		end
	end
	
end
LarsMod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, LarsMod.CacheUpdate)