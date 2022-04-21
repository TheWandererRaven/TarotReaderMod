TarotReaderMod.rolls = {}

local RollChances = {
    CARDTEAR_CARD_DROP = 4,
    CARDTEAR_CARD_DROP_REVERSED = 10
}

local tarotRng = RNG()
tarotRng:SetSeed(Random(), 1)

function TarotReaderMod.rolls:RollCardDrop()
    --local rng = RNG()
    --rng:SetSeed(Random(), 1)
    return tarotRng:RandomInt(100) <= (RollChances.CARDTEAR_CARD_DROP - 1)
end

function TarotReaderMod.rolls:RollCardTearArcana()
    --local rng = RNG()
    --rng:SetSeed(Random(), 1)
    if tarotRng:RandomInt(100) <= (RollChances.CARDTEAR_CARD_DROP_REVERSED - 1) then
        return 77 - tarotRng:RandomInt(22)
    end
    return tarotRng:RandomInt(22) + 1
end