TarotReaderMod.helpers = {}

function TarotReaderMod.game_validations:GetLesserVersionOf(EnemyId, Variant)
    
    -- IGNORE THE FOLLOWING #########################################################################

    -- Ignore: Brainless knight | Death Scythe | Peep/Bloat Eye | Constant Stone shooters | Small long legs | Gutted Fatty Eye ..
    -- Any Beast boss spawns (id 951) | any pitfall
    if (EnemyId == 41 and Variant == 3) or EnemyId == 66 or EnemyId == 68 or EnemyId == 202 or EnemyId == 951 or EnemyId == 291 or
    -- (Fetal Demon | Dank Death's head | Lil portal | Leper Flesh | Dark Ball | Fanatic | ..
    ((EnemyId == 886 or EnemyId == 212 or EnemyId == 306 or EnemyId == 310 or EnemyId == 404 or EnemyId == 832 or
    -- Dump Head | Singe's Ball)
    EnemyId == 876 or EnemyId == 915) and Variant == 1) or
    -- Gutted/Peeping Fatty Eye
    ((EnemyId == 831 or EnemyId == 835) and Variant == 10) or
    -- Festering Guts | Visage Plasma | Dead Isaac
    ((EnemyId == 831 or EnemyId == 903 or EnemyId == 912) and Variant == 20)
    then return {EnemyId, Variant} end

    -- LIST OF ALL THE ENEMIES #########################################################################

    -- Attack Fly to fly
    if(EnemyId < 50) then
        if(EnemyId == 18) then return {13, 0} end
        -- Maggot to small maggot
        if(EnemyId == 21) then return {853, 0} end
        -- Hive to Mulligan
        if(EnemyId == 22) then return {16, 0} end
        -- Charger to maggot
        if(EnemyId == 23) then return {21, 0} end
        -- Maw to Horf
        if(EnemyId == 26) then return {12, 0} end
        -- Hopper to Pacer
        if(EnemyId == 29) then return {11, 1} end
        -- Leaper to Hopper
        if(EnemyId == 34) then return {29, 0} end
        -- Chubber to Vis
        if(EnemyId == 39 and Variant == 2) then return {39, 0} end
        -- Scarred double Vis to double vis
        if(EnemyId == 39 and Variant == 3) then return {39, 1} end
        -- Black Knight to Loose Knight
        if(EnemyId == 41 and Variant == 4) then return {41, 2} end
    end
    if(EnemyId < 100 and EnemyId >= 50) then
        -- Flaming Hopper to hopper
        if(EnemyId == 54) then return {29, 0} end
        -- Sucker tp attack fly
        if(EnemyId == 61 and Variant == 0) then return {18, 0} end
        -- Bulb to attack fly
        if(EnemyId == 61 and Variant == 5) then return {18, 0} end
        -- Tainted Sucker to Soul Sucker
        if(EnemyId == 61 and Variant == 7) then return {61, 3} end
        -- Moter to attack fly
        if(EnemyId == 80) then return {18, 0} end
        -- Gurgle to Cyclopia
        if(EnemyId == 80) then return {87, 0} end
        -- Big Spider to spider
        if(EnemyId == 94) then return {85, 0} end
    end
    if(EnemyId < 225 and EnemyId >= 100) then
        -- Mobile Host to Host
        if(EnemyId == 204) then return {27, 0} end
        -- Nest to Hive
        if(EnemyId == 205) then return {22, 0} end
        -- Baby Long legs to small
        if(EnemyId == 206 and Variant == 0) then return {206, 1} end
        -- Crazy long legs to small
        if(EnemyId == 207 and Variant == 0) then return {207, 1} end
        -- Small Baby Long legs to Level 2 spider
        if(EnemyId == 206 and Variant == 0) then return {215, 0} end
        -- Small long legs to level 2 spider
        if(EnemyId == 207 and Variant == 0) then return {215, 0} end
        -- Fat Sack to Pale Fatty
        if(EnemyId == 209) then return {208, 1} end
        -- Death's head to Dank Death's head
        if(EnemyId == 212 and Variant == 0) then return {212, 1} end
        -- Level 2 Fly to Attack Fly
        if(EnemyId == 214) then return {18, 0} end
        -- Level 2 Spider to spider
        if(EnemyId == 215) then return {85, 0} end
        -- Ring Fly to Attack Fly
        if(EnemyId == 222) then return {18, 0} end
        -- Dinga to Squirt
        if(EnemyId == 223) then return {20, 0} end
    end
    if(EnemyId < 250 and EnemyId >= 225) then
        -- Black Maw to Oob
        if(EnemyId == 225) then return {224, 0} end
        -- Camilo Jr. to Psy Tumor
        if(EnemyId == 230) then return {253, 0} end
        -- Splasher to Gusher
        if(EnemyId == 238) then return {11, 0} end
        -- Rage creep to soy creep
        if(EnemyId == 241) then return {240, 1} end
        -- Blind creep to wall creep
        if(EnemyId == 242) then return {240, 0} end
        -- Cojoined Spitty
        if(EnemyId == 243) then return {31, 0} end
        -- Ragling (Rag man's too) to trite
        if(EnemyId == 246) then return {29, 1} end
        -- Flesh mobile host to mobile host
        if(EnemyId == 247) then return {204, 0} end
        -- Psychic Horf to Horf
        if(EnemyId == 248) then return {12, 0} end
        -- Full fly to Level 2 fly
        if(EnemyId == 249) then return {214, 0} end
    end
    if(EnemyId < 275 and EnemyId >= 250) then
        -- Ticking Spider to level 2 spider
        if(EnemyId == 250) then return {215, 0} end
        -- Begoten to homunculus
        if(EnemyId == 251) then return {228, 0} end
        -- Nulls to Frowing Gaper
        if(EnemyId == 252) then return {10, 0} end
        -- Psy Tumor to Tumor
        if(EnemyId == 253) then return {229, 0} end
        -- Night Crawler to Round Worm
        if(EnemyId == 255) then return {244, 0} end
        -- Dart Fly to Attack Fly
        if(EnemyId == 256) then return {18, 0} end
        -- Cojoined Fatty to Fatty
        if(EnemyId == 257) then return {208, 0} end
        -- Fat bat to One Tooth
        if(EnemyId == 258) then return {234, 0} end
        -- Imp to Angelic Baby
        if(EnemyId == 259) then return {38, 1} end
        -- Roundy to Round Worm
    end
    if(EnemyId < 300 and EnemyId >= 275) then
        if(EnemyId == 276) then return {244, 0} end
        -- Black Bony to Bony
        if(EnemyId == 277) then return {227, 0} end
        -- Black Globin to Dank Globin
        if(EnemyId == 278) then return {24, 2} end
        -- Swarm to Attack Fly
        if(EnemyId == 281) then return {18, 0} end
        -- Bone Knight to knight
        if(EnemyId == 283) then return {41, 0} end
        -- Cyclopia to Gaper
        if(EnemyId == 284) then return {10, 1} end
        -- Red Ghost to Wizoob
        if(EnemyId == 285) then return {219, 0} end
        -- Flesh Death's head to Dank Death's head
        if(EnemyId == 286) then return {212, 1} end
        -- Mom's Dead Hand to Mom's hand
        if(EnemyId == 287) then return {213, 0} end
        -- Any Ultra Greed Coin to Spinner coin
        if(EnemyId == 293 and Variant ~= 0) then return {193, 0} end
        -- Hush Fly to Attack Fly
        if(EnemyId == 296) then return {18, 0} end
        -- Blue Gaper to Gaper
        if(EnemyId == 297) then return {10, 1} end
        -- Blue Boil to Boil
        if(EnemyId == 298) then return {30, 0} end
        -- Greed Gaper to Gaper
        if(EnemyId == 299) then return {10, 1} end
    end
    if(EnemyId < 800 and EnemyId >= 300) then
        -- Poison Mind to brain
        if(EnemyId == 301) then return {20, 0} end
        -- Stoney to Pale Fatty
        if(EnemyId == 302 and Variant == 0) then return {208, 1} end
        -- Cross Stoney to stoney
        if(EnemyId == 302 and Variant == 10) then return {302, 0} end
        -- Blister to Trite
        if(EnemyId == 303) then return {29, 1} end
        -- The Thing to wall creep
        if(EnemyId == 304) then return {240, 0} end
        -- Portal to Lil portal
        if(EnemyId == 306 and Variant == 0) then return {306, 1} end
        -- Fistuloid to charger
        if(EnemyId == 308) then return {23, 0} end
        -- Gush to boil
        if(EnemyId == 309) then return {30, 0} end
        -- Purple Ball to Dark ball
        if(EnemyId == 409 and Variant == 1) then return {404, 1} end
    end
    if(EnemyId < 850 and EnemyId >= 800) then
        -- Bubbles to Pale Fatty
        if(EnemyId == 806) then return {208, 1} end
        -- Wraith to Gaper
        if(EnemyId == 807) then return {10, 1} end
        -- Willo to attack fly
        if(EnemyId == 808) then return {18, 0} end
        -- Deep Gaper to gaper
        if(EnemyId == 811) then return {10, 1} end
        -- Sub Horf to Horf
        if(EnemyId == 812) then return {12, 0} end
        -- Blurb to Gaper
        if(EnemyId == 813) then return {10, 1} end
        -- Strider to Spider
        if(EnemyId == 814) then return {85, 0} end
        -- Danny to Blurp
        if(EnemyId == 820) then return {813, 0} end
        -- Quakey to Pale Fatty
        if(EnemyId == 823) then return {208, 1} end
        -- Fire Worm to tube worm
        if(EnemyId == 825) then return {244, 1} end
        -- Hardy to Squirt
        if(EnemyId == 826) then return {220, 0} end
        -- Necro to sub Horf
        if(EnemyId == 828) then return {812, 0} end
        -- Big Bony to Quakey
        if(EnemyId == 830) then return {823, 0} end
        -- Gutted Fatty to Big Bony
        if(EnemyId == 831 and Variant == 0) then return {830, 0} end
        -- Peeping Fatty to Big Bony
        if(EnemyId == 835 and Variant == 0) then return {830, 0} end
        -- Vis Versa to Scarred Dpuble Vis
        if(EnemyId == 836) then return {39, 3} end
        -- Level 2 Willo to willo
        if(EnemyId == 838) then return {808, 0} end
    end
    if(EnemyId >= 850) then
        -- Level 2 Gaper to Rotten Gaper
        if(EnemyId == 850 and Variant == 0) then return {10, 3} end
        -- Level 2 Horf to Horf
        if(EnemyId == 850 and Variant == 1) then return {12, 0} end
        -- Level 2 Gusher to Gusher
        if(EnemyId == 850 and Variant == 2) then return {11, 0} end
        -- Twitchy to Trite
        if(EnemyId == 851) then return {29, 1} end
        -- Adult Leech to leech
        if(EnemyId == 854) then return {55, 0} end
        -- Level 2 Charger to charger
        if(EnemyId == 855) then return {23, 0} end
        -- Floast to Mobile Host
        if(EnemyId == 859) then return {204, 0} end
        -- Cyst to Scarred guts
        if(EnemyId == 862) then return {40, 0} end
        -- Army Fly to attack fly
        if(EnemyId == 868) then return {18, 0} end
        -- Migraine to Ticking Spider
        if(EnemyId == 869) then return {250, 0} end
        -- Drip to Dip
        if(EnemyId == 871) then return {217, 0} end
        -- Splurt to Squirt
        if(EnemyId == 871) then return {220, 0} end
        -- Cloggy to Clotty
        if(EnemyId == 872) then return {15, 0} end
        -- Butt Slicker to Buttlicker
        if(EnemyId == 878) then return {89, 0} end
        -- Bloaty to Cojoined Fatty
        if(EnemyId == 879) then return {257, 0} end
        -- Vis Fatty to Fat Sack
        if(EnemyId == 886 and Variant == 0) then return {209, 0} end
        -- Shady to Quakey
        if(EnemyId == 888) then return {823, 0} end
        -- Maze Roamer to Bony
        if(EnemyId == 890) then return {227, 0} end
    end
    
    -- DECREMENT DEFAULT #########################################################################

    if(Variant > 0) then return {EnemyId, Variant - 1} end
    return {EnemyId, Variant}
end