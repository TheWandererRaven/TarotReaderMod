TarotReaderMod = RegisterMod("TarotReaderMod", 1)

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

require("helpers.lua")
require("rolls.lua")
require("tears.lua")
require("tears_tarotcards.lua")
require("game_validations.lua")
require("debug.lua")

TearFlags.TEAR_TAROT_CARD = TarotReaderMod.tears:GetTearFlagValue()
TarotReaderMod.isTarotTearFlagAdded = TearFlags.TEAR_TAROT_CARD ~= nil

TarotReaderMod:AddCallback(ModCallbacks.MC_POST_GAME_STARTED, TarotReaderMod.debug.onGameStart)

--#region UPDATE

function TarotReaderMod:onTearUpdate(tear)
  -- If Card Tear is at ground level or collides with grid
  if tear.Variant == TearVariant.CARD_TEAR and (tear.Height >= -5 or tear:CollidesWithGrid()) then
    -- The following validation is to ensure the poof of the card already spawned, to avoid spawning double poofs
    if tear:GetData().tarotreadermod_spawnedPoof == nil then
      TarotReaderMod.tears:CardTearCollides(tear)
      tear:Remove()
    end
  end
end
TarotReaderMod:AddCallback(ModCallbacks.MC_POST_TEAR_UPDATE, TarotReaderMod.onTearUpdate)

function TarotReaderMod:onCache(player, flag)
  if flag == CacheFlag.CACHE_TEARFLAG and player:HasCollectible(CollectibleType.COLLECTIBLE_CARD_THROWER) then
    TarotReaderMod.tears:AddTearFlags(player, TearFlags.TEAR_TAROT_CARD)
  end
end
TarotReaderMod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, TarotReaderMod.onCache)


--#endregion
--#region ENTITY RELATED

function TarotReaderMod:onCollision(tear, collider, low)
  -- If Card Tear collides with target...
  if tear.Variant == TearVariant.CARD_TEAR and tear.StickTarget == nil and (tear:HasTearFlags(TearFlags.TEAR_PIERCING) == false) then
    -- If Card Tear rolled a drop...
    if tear:GetData().tarotreadermod_dropCard then
      -- Drop the card and remove the tear
      Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_TAROTCARD, tear:GetData().tarotreadermod_tearTarotArcana, tear.Position, Vector(0,0), nil)
      tear:Remove()
    else
      -- Execute common collision behaviour
      TarotReaderMod.tears:CardTearCollides(tear)
      if collider:IsEnemy() then
        TarotReaderMod.tears.tarotcards:ExecuteCardHit(tear:GetData().tarotreadermod_tearTarotArcana, collider)
      else
        tear:Remove()
      end
    end
  end
end
TarotReaderMod:AddCallback(ModCallbacks.MC_PRE_TEAR_COLLISION, TarotReaderMod.onCollision)

function TarotReaderMod:onDamage(tookDamage, amt, flag, source, countdown)
  if(tookDamage.Type == EntityType.ENTITY_PLAYER and source.Entity.Variant == TearVariant.CARD_TEAR) then
    return false
  end
end
TarotReaderMod:AddCallback(ModCallbacks.MC_ENTITY_TAKE_DMG, TarotReaderMod.onDamage)

--#endregion
--#region ENTITY RELATED - TEARS

--function TarotReaderMod:onTearInit(tear)
--end
--TarotReaderMod:AddCallback(ModCallbacks.MC_POST_TEAR_INIT, TarotReaderMod.onTearInit)

function TarotReaderMod:onTearFired(tear)
  --TODO: cycle through players
  --local player = Isaac.GetPlayer(0)
  if TarotReaderMod.game_validations:IsCardTear(tear) and tear.SpawnerType == EntityType.ENTITY_PLAYER then
    if tear.Variant ~= TearVariant.CARD_TEAR then
      TarotReaderMod.tears:TearToCardTear(tear, TarotReaderMod.rolls:RollCardTearArcana())
    end
end
end
TarotReaderMod:AddCallback(ModCallbacks.MC_POST_FIRE_TEAR, TarotReaderMod.onTearFired)

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
