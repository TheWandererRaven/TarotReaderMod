local TarotReaderMod = RegisterMod("TarotReaderMod", 1)

CollectibleType.COLLECTIBLE_CARD_THROWER = Isaac.GetItemIdByName("Card Thrower")
PlayerType.PLAYER_TAROT_READER = Isaac.GetPlayerTypeByName("Tarot Reader")
TearVariant.CARD_TEAR = Isaac.GetEntityVariantByName("Card Tear")
CardTear = {
    BASE_CHANCE = 4
}
CardTearPoof = {
  LAST_FRAME = 11 -- using logic 0
}
CARD_TEAR_POOF = Isaac.GetEntityVariantByName("Card Tear Poof")

require("rolls.lua")
require("cards_helper.lua")
require("tears.lua")
require("game_validations.lua")

--#region UPDATE

function TarotReaderMod:onTearUpdate(tear)
  if tear.Variant == TearVariant.CARD_TEAR and (tear.Height >= -5 or tear:CollidesWithGrid()) then
    -- The following validation is to ensure the poof of the card already spawned, to avoid spawning double poofs
    if tear:GetData().tarotreadermod_spawnedPoof == nil then
      CardTearCollides(tear)
      tear:GetData().tarotreadermod_spawnedPoof = true
    end
  end
  Isaac.DebugString("Collides!")
end
TarotReaderMod:AddCallback(ModCallbacks.MC_POST_TEAR_UPDATE, TarotReaderMod.onTearUpdate)

--#endregion
--#region ENTITY RELATED

function TarotReaderMod:onCollision(tear, collider, low)
    if tear.Variant == TearVariant.CARD_TEAR and tear.StickTarget == nil then
      --local poofHeightSnd = getTearHeightAndSnd(tear.Height)
      --TEAR_COLOR = tear:GetColor()
      --TEAR_POINTER = GetPtrHash(tear)
      CardTearCollides(tear:ToTear())
      --SFXManager():Play(poofHeightSnd[2], 1, 0, false, 1)          
    end
end
TarotReaderMod:AddCallback(ModCallbacks.MC_PRE_TEAR_COLLISION, TarotReaderMod.onCollision)

function TarotReaderMod:onDamage(entity, amt, flag, source, countdown)
    local player = Isaac.GetPlayer(0)
    if source.Type == EntityType.ENTITY_TEAR and source.Variant == TearVariant.CARD_TEAR and RollCardDrop() then
      local cardDrop = source.Entity:GetData().tarotreadermod_cardTearDrop
      if cardDrop == nil then cardDrop = 0 end
      if cardDrop > 0 then
          Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_TAROTCARD, cardDrop, entity.Position, Vector(0,0), nil)
      end
    end
end
TarotReaderMod:AddCallback(ModCallbacks.MC_ENTITY_TAKE_DMG, TarotReaderMod.onDamage)

--#endregion
--#region ENTITY RELATED -  TAERS

function TarotReaderMod:onTearInit(tear)
  local player = Isaac.GetPlayer(0)
  if IsAbleToCardTearShoot(player) then
      if tear.Variant ~= TearVariant.CARD_TEAR then
          TearToCardTear(tear, RollCardTearArcana())
      end
  end
end
TarotReaderMod:AddCallback(ModCallbacks.MC_POST_TEAR_INIT, TarotReaderMod.onTearInit)

function TarotReaderMod:poof(poof)
  --Isaac.DebugString(tostring(poof:GetSprite():GetFrame()))
  if poof.Variant == CARD_TEAR_POOF then
    if poof:GetSprite():GetFrame() >= CardTearPoof.LAST_FRAME then
      poof:Remove()
    end
  end
  --test = poof:GetSprite().Scale.X
  --test = poof.Color.R .. " " .. poof.Color.G .. " " .. poof.Color.B .. " " .. poof.Color.A .. " " .. poof.Color.RO .. " " .. poof.Color.GO .. " " .. poof.Color.BO
end
TarotReaderMod:AddCallback(ModCallbacks.MC_POST_EFFECT_RENDER, TarotReaderMod.poof)

--#endregion

function TarotReaderMod:onCache(player, flag)
    if IsAbleToCardTearShoot(player) then
        --player.TearFallingSpeed = player.TearFallingSpeed - 3
    end
end
TarotReaderMod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, TarotReaderMod.onCache)
