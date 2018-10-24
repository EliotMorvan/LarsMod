local costume = Isaac.GetCostumeIdByPath("gfx/characters/Lars.anm2")
local LarsMod = RegisterMod("Lars Mod", 1)

function LarsMod:onUpdate(player)

	player:AddNullCostume(costume)
	
end

LarsMod:AddCallback(ModCallbacks.MC_POST_PLAYER_INIT, LarsMod.onUpdate)