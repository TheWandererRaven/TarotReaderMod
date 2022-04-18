local CARD_TEAR_POOF = Isaac.GetEntityVariantByName("CardTearPoof")

-- DEPRECATED
function GetShootingAnimationDirecton(velocity)
    if math.abs(velocity.X) >= math.abs(velocity.Y) then
        if velocity.X > 0 then
            return "E"
        end
        if velocity.X < 0 then
            return "W"
        end
    end
    if velocity.Y > 0 then
        return "S"
    end
    return "N"
end

function GetShootingAnimationAxis(velocity)
    if math.abs(velocity.Y) >= math.abs(velocity.X) then return "V" end
    return "H"
end

-- Returns -1 or 1 depending on the higher valued axis
function GetShootingAnimationDirection(velocity)
    if math.abs(velocity.Y) >= math.abs(velocity.X) then return (velocity.Y / math.abs(velocity.Y)) end
    return (velocity.X / math.abs(velocity.X))
end

--Returns the rotation needed to change adjust the animation to the tear's direction
function GetShootingAnimationRotation(velocity)
    if math.abs(velocity.X) >= math.abs(velocity.Y) then
        if velocity.X > 0 then
            return 270
        end
        if velocity.X < 0 then
            return 90
        end
    end
    if velocity.Y > 0 then
        return 180
    end
    return 0
end

function TearToCardTear(tear, cardId)
    Isaac.DebugString("Card Roll: " .. tostring(cardId))
    tear:ChangeVariant(TearVariant.CARD_TEAR)
    -- Data changes
    local isReversed = cardId > 22
    tear:GetData().tarotreadermod_cardTearDrop = cardId
    tear:GetData().tarotreadermod_isReversed = isReversed
    -- Sprite changes
    local axis = GetShootingAnimationAxis(tear.Velocity)
    local direction = GetShootingAnimationDirection(tear.Velocity)
    local tearSprite = tear:GetSprite()
    tearSprite:Play(GetCardTearAnimationName(cardId) .. axis, 1)
        -- TODO: I tried to change the animation rotation to only have 1 single animation and rotate it depending on the direction...
        --       ...it didn't worked, gotta try again later tho
    local flipAnim = false
    --tearSprite.FlipX = axis == "H" and ((direction < 0 and isReversed ~= true) or (direction > 0 and isReversed))
    --tearSprite.FlipY = axis == "V" and ((direction > 0 and isReversed ~= true) or (direction < 0 and isReversed))
    Isaac.DebugString("Direction: " .. tostring(direction))
    tearSprite.FlipX = axis == "H" and direction < 0
    tearSprite.FlipY = axis == "V" and direction > 0
    if tearSprite.FlipX then Isaac.DebugString("Is Flipped XXXXXXX")
    else Isaac.DebugString("Is NOT flipped XXXXXXX") end
    if tearSprite.FlipY then Isaac.DebugString("Is Flipped YYYYYYY")
    else Isaac.DebugString("Is NOT flipped YYYYYYY") end
end

function CardTearCollides(tear)
  poof = Isaac.Spawn(EntityType.ENTITY_EFFECT, CARD_TEAR_POOF, 0, tear.Position, Vector(0, 0), nil):ToEffect()
  if tear.Scale >= 0.8 then
    local poofScale = tear.Scale * getPoofScaleCons(tear.Scale)
    local poofSprite = poof:GetSprite()
    poofSprite.Scale = Vector(poofScale, poofScale)
    poofSprite.Offset = Vector(0, tear.Height)
    poofSprite.Rotation = GetShootingAnimationRotation(tear.Velocity)
    if tear:GetData().tarotreadermod_isReversed ~= nil then
        if tear:GetData().tarotreadermod_isReversed then poofSprite:Play("ReversedPoof") end
    end
  end
end