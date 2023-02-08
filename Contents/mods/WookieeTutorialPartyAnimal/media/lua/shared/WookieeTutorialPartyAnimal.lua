-- Party Animal is an example of a custom trait!

-- Note that you could use the same filename in this folder as you used in client if
-- that style makes sense for your situation.

-- We first declare a local module as in the client folder example. 
-- You could use a unique name below, but it's not necessary. Since this file
-- is intimately tied to the clientside file, I gave them both the same name.
-- You could rename WTPA as PartyAnimal if you do not like abbreviations.

local WTPA = {}

-- If you are using a GLOBAL module and you want to use the same one from client, 
-- you could use the following declaration in both files:

--      WTPA = WTPA or {}

-- This will only create a new empty table if WTPA does not already exist.

-- You could also add:

--      WTPA.PartyAnimal = {}

-- . . . to create a new module within your parent module.

-- IMPORTANT: You MUST add traits in lua/shared (this folder) for them to work correctly!
-- There are circumstances in which clientside-only traits will be deleted from players 
-- if the server doesn't know they exist!

WTPA.trait = function()
    TraitFactory.addTrait("PartyAnimal", getText("UI_WTPA_traits_PartyAnimal"), 1, "You party more animalistically than anyone else. Gain additional happiness when you eat most food or drink certain beverages.", false)
end

-- The trait above has a 16x16 pixel .png icon called trait_PartyAnimal. The trait_ prefix is NOT optional! 
-- PartyAnimal MUST match the first parameter in the call to "TraitFactory.addTrait" above.

-- Add the trait to the game as soon as it boots. If you don't add the trait early enough, players will not be able to see the trait during trait selection.

Events.OnGameBoot.Add(WTPA.trait)

-- Unlikely to be useful to anyone, but still a good habit, because the needs of future modders are unpredictable:

return WTPA