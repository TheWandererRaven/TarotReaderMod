
RollChances = {
    CARDTEAR_CARD_DROP = 4,
    CARDTEAR_CARD_DROP_REVERSED = 10
}

-- math.random(100)

-- Deprecate
function _RollCardDrop()
    if rng:RandomInt(100) <= RollChances.CARDTEAR_CARD_DROP then
        if rng:RandomInt(100) <= RollChances.CARDTEAR_CARD_DROP_REVERSED then
            return 78 - rng:RandomInt(22)
        end
        return rng:RandomInt(22)
    end
    return 0
end

function RollCardDrop()
    local rng = RNG()
    rng:SetSeed(Random(), 1)
    return rng:RandomInt(100) <= (RollChances.CARDTEAR_CARD_DROP - 1)
end

function RollCardTearArcana()
    local rng = RNG()
    rng:SetSeed(Random(), 1)
    if rng:RandomInt(100) <= (RollChances.CARDTEAR_CARD_DROP_REVERSED - 1) then
        return 77 - rng:RandomInt(22)
    end
    return rng:RandomInt(22) + 1
end