TarotReaderMod.tears = {}

local function TEARFLAG(x)
	return x >= 64 and BitSet128(0,1<<(x-64)) or BitSet128(1<<x,0)
end

function TarotReaderMod.tears:GetTearFlagValue()
	index = TearFlags.TEAR_EFFECT_COUNT
    for k,v in pairs(TearFlags) do
        if v == TEARFLAG(index) then index = index + 1 end
    end
    if index < 115 then
        return TEARFLAG(index)
    else
        return nil
    end
end

function TarotReaderMod.tears:AddTearFlags(player, f)
	player.TearFlags = player.TearFlags | f
end

local function GetShootingAnimationAxis(velocity)
    if math.abs(velocity.Y) >= math.abs(velocity.X) then return "V" end
    return "H"
end

-- Returns -1 or 1 depending on the higher valued axis
local function GetShootingAnimationDirection(velocity)
    if math.abs(velocity.Y) >= math.abs(velocity.X) then return (velocity.Y / math.abs(velocity.Y)) end
    return (velocity.X / math.abs(velocity.X))
end

--Returns the rotation needed to change adjust the animation to the tear's direction
local function GetShootingAnimationRotation(velocity)
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

function TarotReaderMod.tears:TearToCardTear(tear, cardId)
    tear:ChangeVariant(TearVariant.CARD_TEAR)
    -- Data changes
    local isReversed = cardId > 22
    tear:GetData().tarotreadermod_tearTarotArcana = cardId
    tear:GetData().tarotreadermod_isReversed = isReversed
    tear:GetData().tarotreadermod_dropCard = TarotReaderMod.rolls:RollCardDrop()
    if tear:GetData().tarotreadermod_dropCard ~= true then
        TarotReaderMod.tears.tarotcards:AddTarotTearEffectsToTear(tear)
    end
    -- Sprite changes
    local axis = GetShootingAnimationAxis(tear.Velocity)
    local direction = GetShootingAnimationDirection(tear.Velocity)
    local tearSprite = tear:GetSprite()
    tearSprite:Play(TarotReaderMod.tears.tarotcards:GetCardTearAnimationName(cardId) .. axis, 1)
        -- TODO: I tried to change the animation rotation to only have 1 single animation and rotate it depending on the direction...
        --       ...it didn't worked, gotta try again later tho
    local flipAnim = false
    --tearSprite.FlipX = axis == "H" and ((direction < 0 and isReversed ~= true) or (direction > 0 and isReversed))
    --tearSprite.FlipY = axis == "V" and ((direction > 0 and isReversed ~= true) or (direction < 0 and isReversed))
    tearSprite.FlipX = axis == "H" and direction < 0
    tearSprite.FlipY = axis == "V" and direction > 0
end

function TarotReaderMod.tears:CardTearCollides(tear)
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