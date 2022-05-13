TarotReaderMod.tears.tarotcards = {}

function TarotReaderMod.tears.tarotcards:GetCardTearAnimationName(enumId)
    if(enumId == Card.CARD_FOOL) then return "Fool" end
    if(enumId == Card.CARD_MAGICIAN) then return "Magician" end
    --if(enumId == Card.CARD_HIGH_PRIESTESS) then return "AAAAAAAAAAAAAAAAA" end
    --if(enumId == Card.CARD_EMPRESS) then return "AAAAAAAAAAAAAAAAA" end
    --if(enumId == Card.CARD_EMPEROR) then return "AAAAAAAAAAAAAAAAA" end
    --if(enumId == Card.CARD_HIEROPHANT) then return "AAAAAAAAAAAAAAAAA" end
    if(enumId == Card.CARD_LOVERS) then return "Lovers" end
    if(enumId == Card.CARD_CHARIOT) then return "Chariot" end
    --if(enumId == Card.CARD_JUSTICE) then return "AAAAAAAAAAAAAAAAA" end
    --if(enumId == Card.CARD_HERMIT) then return "AAAAAAAAAAAAAAAAA" end
    --if(enumId == Card.CARD_WHEEL_OF_FORTUNE) then return "AAAAAAAAAAAAAAAAA" end
    --if(enumId == Card.CARD_STRENGTH) then return "AAAAAAAAAAAAAAAAA" end
    --if(enumId == Card.CARD_HANGED_MAN) then return "AAAAAAAAAAAAAAAAA" end
    -- Death is the default, hence it being at the bottom
    --if(enumId == Card.CARD_TEMPERANCE) then return "AAAAAAAAAAAAAAAAA" end
    if(enumId == Card.CARD_DEVIL) then return "Devil" end
    if(enumId == Card.CARD_TOWER) then return "Tower" end
    --if(enumId == Card.CARD_STARS) then return "AAAAAAAAAAAAAAAAA" end
    --if(enumId == Card.CARD_MOON) then return "AAAAAAAAAAAAAAAAA" end
    if(enumId == Card.CARD_SUN) then return "Sun" end
    --if(enumId == Card.CARD_JUDGEMENT) then return "AAAAAAAAAAAAAAAAA" end
    --if(enumId == Card.CARD_WORLD) then return "AAAAAAAAAAAAAAAAA" end

    if(enumId == Card.CARD_REVERSE_DEVIL) then return "ReverseDevil" end
    if(enumId == Card.CARD_REVERSE_TOWER) then return "ReverseTower" end
    if(enumId == Card.CARD_REVERSE_SUN) then return "ReverseSun" end
    
    if(enumId > 22) then return "ReverseDeath" end
    return "Death"
end

--#region EXECUTE CARD HIT

local function ExecuteFoolCardHit(enemy)
    Isaac.DebugString("THE FOOL HITS")
    local enemyType = enemy.Type
    local currentVariant = enemy.Variant
    if currentVariant > 0 then
        -- leave enemy subtype to 0 unless it needs to have the subtype
        local newIds = TarotReaderMod.game_validations:GetLesserVersionOf(enemyType, currentVariant)
        if(newIds[0] ~= enemyType or newIds[1] ~= currentVariant) then
            local newEnemy = Isaac.Spawn(newIds[0], newIds[1], 0, enemy.Position, enemy.Velocity, enemy.SpawnerEntity)
            newEnemy.HitPoints = (enemy.HitPoints / enemy.MaxHitPoints) * newEnemy.MaxHitPoints
            enemy:Remove()
        end
    end
end

function TarotReaderMod.tears.tarotcards:ExecuteCardHit(arcanaId, enemy)
    if(arcanaId == Card.CARD_FOOL) then ExecuteFoolCardHit(enemy) end
end

--#endregion

--#region ADD EFFECT

local function AddFoolEffectToTear(tear)
    -- Enemy hit turns into their lesser version by extracting the 1 from the first decimal on the monster's id, if that deicmal is not 0,
    -- if it cannot go lower it just hurts the enemy
end

local function AddMagicianEffectToTear(tear)
    -- Augment tear range, make tear hooming
    tear:AddTearFlags(TearFlags.TEAR_HOMING)
    --tear:SetColor(Color(1, 0.5, 1), -1, 1, false, false)
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
    tear:AddTearFlags(TearFlags.TEAR_CHARM)
    --tear:SetColor(Color(1, 0.5, 0.5), -1, 1, false, false)
end

local function AddChariotEffectToTear(tear)
    -- Augment tear range, make it piercing, with rainbow colors and it deals damage the same as My little unicron item
    tear:AddTearFlags(TearFlags.TEAR_PIERCING)
    tear.CollisionDamage = tear.CollisionDamage + 10
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
    -- Turns creature into a shopkeeper, if creature is a boss..
    -- ..will drop a random item?
    -- ..will spawn a shopkeeper?
    -- ..will do nothing?
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
    -- For debugging..
    --local arcanaId = Card.CARD_DEVIL

    if(arcanaId == Card.CARD_FOOL) then AddFoolEffectToTear(tear) end
    if(arcanaId == Card.CARD_MAGICIAN) then AddMagicianEffectToTear(tear) end
    --if(arcanaId == Card.CARD_HIGH_PRIESTESS) then return "AAAAAAAAAAAAAAAAA" end
    --if(arcanaId == Card.CARD_EMPRESS) then return "AAAAAAAAAAAAAAAAA" end
    --if(arcanaId == Card.CARD_EMPEROR) then return "AAAAAAAAAAAAAAAAA" end
    --if(arcanaId == Card.CARD_HIEROPHANT) then return "AAAAAAAAAAAAAAAAA" end
    if(arcanaId == Card.CARD_LOVERS) then AddLoversEffectToTear(tear) end
    if(arcanaId == Card.CARD_CHARIOT) then AddChariotEffectToTear(tear) end
    --if(arcanaId == Card.CARD_JUSTICE) then return "AAAAAAAAAAAAAAAAA" end
    --if(arcanaId == Card.CARD_HERMIT) then return "AAAAAAAAAAAAAAAAA" end
    --if(arcanaId == Card.CARD_WHEEL_OF_FORTUNE) then return "AAAAAAAAAAAAAAAAA" end
    --if(arcanaId == Card.CARD_STRENGTH) then return "AAAAAAAAAAAAAAAAA" end
    --if(arcanaId == Card.CARD_HANGED_MAN) then return "AAAAAAAAAAAAAAAAA" end
    -- Death is the default, hence it being at the bottom
    --if(arcanaId == Card.CARD_TEMPERANCE) then return "AAAAAAAAAAAAAAAAA" end
    if(arcanaId == Card.CARD_DEVIL) then AddDevilEffectToTear(tear) end
    if(arcanaId == Card.CARD_TOWER) then AddTowerEffectToTear(tear) end
    --if(arcanaId == Card.CARD_STARS) then return "AAAAAAAAAAAAAAAAA" end
    --if(arcanaId == Card.CARD_MOON) then return "AAAAAAAAAAAAAAAAA" end
    --if(arcanaId == Card.CARD_SUN) then return "Sun" end
    --if(arcanaId == Card.CARD_JUDGEMENT) then return "AAAAAAAAAAAAAAAAA" end
    --if(arcanaId == Card.CARD_WORLD) then return "AAAAAAAAAAAAAAAAA" end

    --if(arcanaId == Card.CARD_REVERSE_DEVIL) then return "ReverseDevil" end
    --if(arcanaId == Card.CARD_REVERSE_TOWER) then return "ReverseTower" end
    --if(arcanaId == Card.CARD_REVERSE_SUN) then return "ReverseSun" end
    
    --if(arcanaId > 22) then return "ReverseDeath" end
    --return "Death"
end
--#endregion