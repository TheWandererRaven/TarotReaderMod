TarotReaderMod.tears.tarotcards = {}

function TarotReaderMod.tears.tarotcards:GetCardTearAnimationName(enumId)
    if(enumId == Card.CARD_DEVIL) then return "Devil" end
    if(enumId == Card.CARD_TOWER) then return "Tower" end
    if(enumId == Card.CARD_SUN) then return "Sun" end

    if(enumId == Card.CARD_REVERSE_DEVIL) then return "ReverseDevil" end
    if(enumId == Card.CARD_REVERSE_TOWER) then return "ReverseTower" end
    if(enumId == Card.CARD_REVERSE_SUN) then return "ReverseSun" end
    
    if(enumId > 22) then return "ReverseDeath" end
    return "Death"
end

local function ExecuteDeathCardHit()
end

local function ExecuteDevilCardHit()
end

local function ExecuteTowerCardHit(tear)
    --Isaac.Explode(tear.Position, tear, 100)
end

local function ExecuteSunCardHit()
end

function TarotReaderMod.tears.tarotcards:ExecuteCardHit(tear)
    local arcanaId = tear:GetData().tarotreadermod_tearTarotArcana
    --if(arcanaId == Card.CARD_DEVIL) then return "Devil" end
    if(arcanaId == Card.CARD_TOWER) then ExecuteTowerCardHit(tear) end
    --if(arcanaId == Card.CARD_SUN) then return "Sun" end

    --if(arcanaId == Card.CARD_REVERSE_DEVIL) then return "ReverseDevil" end
    --if(arcanaId == Card.CARD_REVERSE_TOWER) then return "ReverseTower" end
    --if(arcanaId == Card.CARD_REVERSE_SUN) then return "ReverseSun" end
    
    --if(arcanaId > 22) then return "ReverseDeath" end
    --return "Death"
end

local function AddFoolEffectToTear(tear)
    -- Enemy hit turns into their lesser version by extracting the 1 from the first decimal on the monster's id, if that deicmal is not 0,
    -- if it cannot go lower it just hurts the enemy
end

local function AddMagicianEffectToTear(tear)
    -- Augment tear range, make tear hooming
end

local function AddHighPristessEffectToTear(tear)
    -- Same effect as the card, only affect hit entity
end

local function AddEmpressEffectToTear(tear)
    -- 
end

local function AddEmperorEffectToTear(tear)
    -- 
end

local function AddHierophantEffectToTear(tear)
    -- 
end

local function AddLoversEffectToTear(tear)
    -- Add charming effect to tear
end

local function AddChariotEffectToTear(tear)
    -- Augment tear range, make it piercing, with rainbow colors and it deals damage the same as My little unicron item
end

local function AddJusticeEffectToTear(tear)
    -- 
end

local function AddHermitEffectToTear(tear)
    -- Adds eye of greed/middas' touch effect to the tear without removing a coin, with same tear damage as any isaac tear
end

local function AddWheelOfFortuneEffectToTear(tear)
    -- 
end

local function AddStrengthEffectToTear(tear)
    -- 
end

local function AddHangedManEffectToTear(tear)
    -- 
end

local function AddDeathManEffectToTear(tear)
    -- DEFAULT
end

local function AddTemperanceEffectToTear(tear)
    -- 
end

local function AddDevilEffectToTear(tear)
    tear.CollisionDamage = tear.CollisionDamage * 2
end

local function AddTowerEffectToTear(tear)
    -- When card hits an enemy, card sticks to the enemy, glows like a bomb and then explodes after a few seconds
    tear:AddTearFlags(TearFlags.TEAR_EXPLOSIVE)
    tear.CollisionDamage = 100
end

local function AddStarsEffectToTear(tear)
    -- 
end

local function AddMoonEffectToTear(tear)
    -- 
end

local function AddSunEffectToTear(tear)
    -- A ray of light fall upon the enemy as it instantly dies, effect similar to the chaos card
end

local function AddJudgementEffectToTear(tear)
    -- 
end

local function AddWorldEffectToTear(tear)
    -- 
end

function TarotReaderMod.tears.tarotcards:AddTarotTearEffectsToTear(tear)
    Isaac.DebugString("ADD EFFECT!")
    local arcanaId = tear:GetData().tarotreadermod_tearTarotArcana
    if(arcanaId == Card.CARD_DEVIL) then AddDevilEffectToTear(tear) end
    if(arcanaId == Card.CARD_TOWER) then AddTowerEffectToTear(tear) end
    --if(arcanaId == Card.CARD_SUN) then return "Sun" end

    --if(arcanaId == Card.CARD_REVERSE_DEVIL) then return "ReverseDevil" end
    --if(arcanaId == Card.CARD_REVERSE_TOWER) then return "ReverseTower" end
    --if(arcanaId == Card.CARD_REVERSE_SUN) then return "ReverseSun" end
    
    --if(arcanaId > 22) then return "ReverseDeath" end
    --return "Death"
end