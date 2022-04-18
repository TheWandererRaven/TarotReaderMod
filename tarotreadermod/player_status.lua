function IsAbleToCardTearShoot(player)
    return (player:HasCollectible(CollectibleType.COLLECTIBLE_CARD_THROWER)) or (player:GetPlayerType() == PlayerType.PLAYER_TAROT_READER)
end