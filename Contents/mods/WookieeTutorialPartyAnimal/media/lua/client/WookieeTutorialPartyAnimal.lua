--------------------------------------
----Wookiee Tutorial: Party Animal----
--------------------------------------
-----------author: Burryaga-----------
--------------------------------------

-- The module that contains all fields & function in this file is declared below.

-- Your module can have any name. WTPA means Wookiee Tutorial: Party Animal.
-- You could rename WTPA as PartyAnimal if you do not like abbreviations.

local WTPA = {}

-- If you believe your table needs to be global in order for your mod to 
-- accomplish its goals, remove the "local " prefix above and remove the
-- return statement at the end of this example; additionally, if you plan to
-- use the same global table in more than one file, use:

--      WTPA = WTPA or {}

-- . . . to initialize the table only if it is necessary to do so.

-- Sometimes you may want a module within your main module:

WTPA.PartyAnimal = {}

-- Counted in our translation file. Needs to be manually updated when you add new lines.

WTPA.PartyAnimal.knownPhrases = 20

WTPA.PartyAnimal.comments = {}

for index = 1, WTPA.PartyAnimal.knownPhrases do
    
    -- Translations that pertain directly to the PartyAnimal trait are prefixed
    -- UI_WTPA_traits_PartyAnimal_ in this mod's translation file. I did this so that you
    -- could in theory expand this format into an organized way of creating a mod with
    -- more than one trait.
    
    WTPA.PartyAnimal.comments[index] = getText("UI_WTPA_traits_PartyAnimal_partyOn_" .. tostring(index))

end

-- We could have done this, but comments would be less flexibly 
-- based on the number of lines in the translation file:

-- WTPA.PartyAnimal.comments = {

--     -- Using translation files allows other modders to add translations for your mod 
--     -- more easily if you happen to make something with global popularity.

--     [1] = getText("UI_WTPA_traits_PartyAnimal_partyOn_1"),
--     [2] = getText("UI_WTPA_traits_PartyAnimal_partyOn_2"),
--     [3] = getText("UI_WTPA_traits_PartyAnimal_partyOn_3"),
--     . . . . . . . . . . . . . . . . . . . . . . . . . . .
--     [X] = getText("UI_WTPA_traits_PartyAnimal_partyOn_X") -- Final comma is optional!

-- }

WTPA.PartyAnimal.nextComment = 1

WTPA.PartyAnimal.frequency = {

    [1] = false, -- You can mix and match types in Lua tables in very useful ways.
    [2] = 10, [3] = 20, [4] = 30, [5] = 40, [6] = 50, [7] = 60, 
    [8] = 70, [9] = 80, [10] = 90, [11] = 100, [12] = 110, [13] = 120 -- Final comma is optional!

}

-- Mod Option data management begins below. Mod Options is a mod on the Steam Workshop that
-- can be very useful for maximizing user satisfaction on high population servers.

WTPA.mod = {

    options = {
        exampleOption = true,
        randomizePartyComments = false,
        frequencyOfPartyTalk = 6 -- This is for dropdown options.
    },

    names = {
        exampleOption = getText("UI_WTPA_exampleOption"), -- This references a translation file.
        randomizePartyComments = getText("UI_WTPA_randomizePartyComments"),
        frequencyOfPartyTalk = getText("UI_WTPA_frequencyOfPartyTalk")
    },

    mod_id = "WookieeTableModTemplate",

    mod_shortname = getText("UI_WTPA_shortName") -- This references a translation file.

}

-- I recommend you don't bother with default bindings in your mods, because
-- there are too many conflicts to pick bindings that work for everyone. Let players
-- use Mod Options to set them.

local none = 0

WTPA.helloKnoxCountryShortcut = {
    key = Keyboard.KEY_0, -- I recommend you use "key = none" (or "key = 0") here in a real mod, and require Mod Options.
    name = "WTPA_sayHelloKnoxCountry" -- This automatically references a translation file.
}

-- Visible Keyboard class fields can be found here: https://zomboid-javadoc.com/41.65/org/lwjglx/input/Keyboard.html

-- My example requires Mod Options to be enabled for binding the keyboard shortcut, but you could 
-- also make Mod Options optional and provide a default shortcut in WTPA.helloKnoxCountryShortcut above.

-- See Mod Options on the Steam Workshop for more on available categories.

WTPA.category = "[Player Control]"

WTPA.loadModOptions = function()

    -- Connecting the options to the menu, so user can change and save them.
    if ModOptions and ModOptions.getInstance then

        ModOptions:AddKeyBinding(WTPA.category, WTPA.helloKnoxCountryShortcut)

        WTPA.modSettings = ModOptions:getInstance(WTPA.mod)

        local exampleOption = WTPA.modSettings:getData("exampleOption")
        local randomizePartyComments = WTPA.modSettings:getData("randomizePartyComments")
        local frequencyOfPartyTalk = WTPA.modSettings:getData("frequencyOfPartyTalk")

        exampleOption.tooltip = getText("UI_WTPA_exampleOption_tooltip") -- This references a translation file.
        randomizePartyComments.tooltip = getText("UI_WTPA_randomizePartyComments_tooltip") 
        frequencyOfPartyTalk.tooltip = getText("UI_WTPA_frequencyOfPartyTalk_tooltip") 

        frequencyOfPartyTalk[1] = getText("UI_optionscreen_render_precipNever") -- Sometimes, vanilla functions can be used
        frequencyOfPartyTalk[2] = getText("UI_WTPA_traits_PartyAnimal_frequency_2")
        frequencyOfPartyTalk[3] = getText("UI_WTPA_traits_PartyAnimal_frequency_3")
        frequencyOfPartyTalk[4] = getText("UI_WTPA_traits_PartyAnimal_frequency_4")
        frequencyOfPartyTalk[5] = getText("UI_WTPA_traits_PartyAnimal_frequency_5")
        frequencyOfPartyTalk[6] = getText("UI_WTPA_traits_PartyAnimal_frequency_6")
        frequencyOfPartyTalk[7] = getText("UI_WTPA_traits_PartyAnimal_frequency_7")
        frequencyOfPartyTalk[8] = getText("UI_WTPA_traits_PartyAnimal_frequency_8")
        frequencyOfPartyTalk[9] = getText("UI_WTPA_traits_PartyAnimal_frequency_9")
        frequencyOfPartyTalk[10] = getText("UI_WTPA_traits_PartyAnimal_frequency_10")
        frequencyOfPartyTalk[11] = getText("UI_WTPA_traits_PartyAnimal_frequency_11")
        frequencyOfPartyTalk[12] = getText("UI_WTPA_traits_PartyAnimal_frequency_12")
        frequencyOfPartyTalk[13] = getText("UI_WTPA_traits_PartyAnimal_frequency_13")

    end

end

WTPA.loadModOptions()

-- Protects Against a Known Mod Options Bug. This will create a global table named Exterminator whose soul
-- purpose is to fix the bug IF you are not already running one of my many other mods that may have created
-- Exterminator for you.

if not Exterminator then

    Exterminator = {}

    Exterminator.onEnterFromGame = MainScreen.onEnterFromGame

    function MainScreen:onEnterFromGame()

        Exterminator.onEnterFromGame(self)

        -- Guarantee that when you ENTER the options menu, the game does not think you've already changed your options.

        MainOptions.instance.gameOptions.changed = false

    end

end

-- End Mod Options

-- A simple integer you might use throughout your mod.
WTPA.fieldExample = 1

-- A simple function inside of your module. The player parameter will be treated as optional.
-- Responds to both key presses and the EveryTenMinutes Event.
WTPA.speak = function(key, player, commanded)

    if not player then player = getPlayer() end -- Grab keyboard player by default if player is nil.

    if not (instanceof(player, "IsoPlayer") and player:isAlive()) then return end -- Bad player input, so bail.

    -- You can avoid excessive nesting by returning from functions instead
    -- if you read a condition beyond which the function does not need to
    -- do anything. In pseudocode (you cannot use hyphens in real variable names): 
    --
    --      if bad-Time-For-This-Function-To-Be-Running then return end
    --
    -- Three examples of this pattern follow.

    -- Key will not exist if this was called by the EveryTenMinutes event.
    -- We don't want to count 10 minutes on key press.
    if not key then 
        -- If this doesn't exist yet, we will initialize it as 0
        if WTPA.minutesPassed then
            WTPA.minutesPassed = WTPA.minutesPassed + 10
        else
            WTPA.minutesPassed = 0
        end
        
    end

    -- If this is being called EveryTenMinutes, we will check out time counter.
    --      Note: WTPA.minutesPassed % WTPA.PartyAnimal.frequency[WTPA.mod.options.frequencyOfPartyTalk] will be 0
    --            whenever the number of minutes passed is evenly divisible by the number of minutes you would like
    --            to wait between automatic speaking events, as set via the Mod Options frequency setting.
    --              
    --            The purpose of WTPA.PartyAnimal.frequency[WTPA.mod.options.frequencyOfPartyTalk] is to convert the user's
    --            selected mod option (WTPA.mod.options.frequencyOfPartyTalk) to an integer value between 10 and 120.
    --
    --            We make sure that the key does not exist in the condition below, because if it does, we will inadvertently
    --            spam speech on any key press whenever minutesPassed is divisible by 10.

    local timedSpeech = WTPA.PartyAnimal.frequency[WTPA.mod.options.frequencyOfPartyTalk] and  WTPA.minutesPassed and
        not key and WTPA.minutesPassed % WTPA.PartyAnimal.frequency[WTPA.mod.options.frequencyOfPartyTalk] == 0

    if key ~= WTPA.helloKnoxCountryShortcut.key and not timedSpeech and not commanded then return end -- Wrong key or not enough time passed; we're good.

    -- Below is a simple example of using fields to decide whether we proceed with speaking.

    if WTPA.fieldExample ~= 1 or not WTPA.mod.options.exampleOption then return end 

    -- Other available functions and their classes can be explored here:
    --      https://projectzomboid.com/modding/

    if player:HasTrait("PartyAnimal") then

        -- SayShout WILL BE seen by other online players.
        player:SayShout(WTPA.PartyAnimal.comments[WTPA.PartyAnimal.nextComment])
    
        if WTPA.mod.options.randomizePartyComments then
            -- ZombRand(input) returns an int from 0 to input - 1.
            WTPA.PartyAnimal.nextComment = ZombRand(#WTPA.PartyAnimal.comments) + 1
        else
            -- Modulo arithmetic can allow you to loop to the next valid index in a single line of code.
            WTPA.PartyAnimal.nextComment = (WTPA.PartyAnimal.nextComment % #WTPA.PartyAnimal.comments) + 1
        end

    else

        -- Say if a Java function available to IsoPlayer objects. You will call this function
        -- by typing "WTPA.speak(getPlayer())" in the debug console after launching Zomboid
        -- with the -debug Launch Option. 
        
        player:Say(getText("UI_WTPA_helloKnoxCountry"))

    end
    
end

-- "Pressed" below actually means "Released". OnKeyStartPressed is actually the function
-- that catches the initial press. Zomboid functions are often named oddly.

Events.OnKeyPressed.Add(WTPA.speak)

-- Speech can be triggered on a variety of events.

Events.EveryTenMinutes.Add(WTPA.speak)

-- Gamepad support is complicated. Using buttons should be done sparingly and in a context-dependent way,
-- because we don't have many buttons available. A context menu option is generally a reliable way to offer
-- a "cross-input" way of accepting a command from any player (one that works for KBM and gamepad).

WTPA.addPartyAnimalSpeechOption = function(playerIndex, contextMenu, worldObjects, test)
    
    -- The test variable is purely for checking whether functions exist. 
    -- It is used by vanilla code. Don't worry too much about it.
    if test then return true end

    -- When we have a player index available, we use getSpecificPlayer(index) instead of getPlayer()
    -- Knowing your player index is crucial for splitscreen gamepad support.
    --      Note: We do not need to check whether player exists because the game would not allow you to draw 
    --            a menu if they were dead.
    local player = getSpecificPlayer(playerIndex) 

    if not player:HasTrait("PartyAnimal") then return end

    -- Can also addOption, which will cause it to appear alphabetized somewhere down the menu.

    -- Can call any function with any number of parameters using this format.
    contextMenu:addOptionOnTop(getText("UI_WTPA_traits_PartyAnimal_speak"), player, 
        function() 
            WTPA.speak(0, player, true)
        end
    )
    
end

Events.OnFillWorldObjectContextMenu.Add(WTPA.addPartyAnimalSpeechOption)

-- Below is an example of a backup table for members of a vanilla global table called ISInventoryPaneContextMenu,
-- which has functions that get called when you do stuff with inventory items.

WTPA.ISInventoryPaneContextMenu = {}

-- We'll be decorating the onEatItems function. We'll allow it to do everything it normally, does, but we'll also
-- add some code that makes us happier when we eat.

WTPA.ISInventoryPaneContextMenu.onEatItems = ISInventoryPaneContextMenu.onEatItems

-- This function will override the original global function and also call our backup of that function.
-- But first, it will check whether we are eating a food item, and, if so, we will become a little happier.

ISInventoryPaneContextMenu.onEatItems = function(items, percentage, playerIndex)

    if items and instanceof(items[1], "Food") then

        local player = getSpecificPlayer(playerIndex)

        local currentUnhappiness = player:getBodyDamage():getUnhappynessLevel()

        player:getBodyDamage():setUnhappynessLevel(math.max(currentUnhappiness - 3, 0))

        player:SayShout(getText("UI_WTPA_traits_PartyAnimal_satisfied"))

    end

    WTPA.ISInventoryPaneContextMenu.onEatItems(items, percentage, playerIndex)

end

-- Below is an example of a backup table for members of a vanilla global table called ISReadWorldMap, 
-- which is used to define the features of the Timed Action for opening your world map.

WTPA.ISReadWorldMap = {}

-- Example of decorating a vanilla global function called ISReadWorldMap.new, which
-- is used to create the Timed Action object that will be used to open your world map.

WTPA.ISReadWorldMap.new = ISReadWorldMap.new

-- Parameters in parentheses below (i.e., character) must match the original function.
-- The decoration below is featured in Mobile Reader (one of my published mods).

function ISReadWorldMap:new(character)

    -- If your function uses a : as above, it is passing 'self' implicitly, and you should forward 
    -- self to your copy of the original function. Including a call to the original function within
    -- your override of the function is what qualifies this override as a "decoration function".

    local mapReadingAction = WTPA.ISReadWorldMap.new(self, character)

    -- A new ISReadWorldMap Timed Action has a field called "stopOnWalk" that dictates
    -- whether walking stops this Timed Action when it is active.

    mapReadingAction.stopOnWalk = false

    -- Now you can walk while you open your map!

    -- The original :new function returns its completed object, so it's vital that you also do this.

    return mapReadingAction

end

-- Return your module so that other players who need it may include it.
-- If you believe your table needs to be global in order for your mod to accomplish
-- its goals, remove the return statement below.

return WTPA
