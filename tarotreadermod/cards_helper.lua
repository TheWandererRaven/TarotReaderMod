
function GetCardTearAnimationName(enumId)
    if(enumId == Card.CARD_DEVIL) then return "Devil" end
    if(enumId == Card.CARD_TOWER) then return "Tower" end
    if(enumId == Card.CARD_SUN) then return "Sun" end

    if(enumId == Card.CARD_REVERSE_DEVIL) then return "ReverseDevil" end
    if(enumId == Card.CARD_REVERSE_TOWER) then return "ReverseTower" end
    if(enumId == Card.CARD_REVERSE_SUN) then return "ReverseSun" end
    
    if(enumId > 22) then return "ReverseDeath" end
    return "Death"
end