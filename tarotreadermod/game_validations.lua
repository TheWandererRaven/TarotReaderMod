TarotReaderMod.game_validations = {}

function TarotReaderMod.game_validations:IsAbleToCardTearShoot(player)
    return (player:HasCollectible(CollectibleType.COLLECTIBLE_CARD_THROWER)) or (player:GetPlayerType() == PlayerType.PLAYER_TAROT_READER)
end

function TarotReaderMod.game_validations:IsCardTear(tear)
    return tear:HasTearFlags(TearFlags.TEAR_TAROT_CARD)
end