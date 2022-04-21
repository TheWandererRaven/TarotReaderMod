TarotReaderMod.debug = {}

function TarotReaderMod.debug:onGameStart(saved)
  if not saved then
      Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, CollectibleType.COLLECTIBLE_CARD_THROWER, Vector(320, 300), Vector(0, 0), nil)
  end
end