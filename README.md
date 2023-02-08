# Wookiee Tutorial: Party Animal

This repository represents a single Project Zomboid mod (called *Wookiee Tutorial: Party Animal*) packaged for distribution as an item on the Steam Workshop (which I generally reference as *the workshop* below).

Please feel free to [clone this repository](https://git-scm.com/book/en/v2/Git-Basics-Getting-a-Git-Repository) as a starting point for making your own Project Zomboid Workshop Items.

## On Workshop Items and Mods

In Project Zomboid, a workshop item is a container for game mods. Any item on the workshop may contain any number of game mods, but most workshop items (including this one) only contain a single mod.

## Using This Repository to Make a New Mod

In order to use this repository to make a new mod, please follow these steps:

1. Clone this repository into **%userprofile%/Zomboid/Workshop/**.
2. Edit, rename, or delete its Lua files at will.
    * Two Lua files exist in this mod. Each is in a different folder in **Contents/mods/WookieeTutorialPartyAnimal/media/lua/**.
    * Within that directory, one Lua file is in the **client** folder, and the other is in the **shared** folder.
3. Modify or delete the **ui** folder based on your image requirements.
    * You won't need this folder at all if you do not intend to use images.
4. Modify the translation files in **Contents/mods/WookieeTutorialPartyAnimal/media/lua/shared/Translate/**.
5. Change the name of all folders named *Wookiee Tutorial Party Animal* or *WookieeTutorialPartyAnimal* to reflect your mod's name.
    * Both names and IDs allow the use of spaces, but using spaces in IDs will make people's server.ini files a little harder for other players to understand and edit, so I do not recommend doing that.
6. Edit **workshop.txt** and **mod.info** files.
    * These should reflect your new *item name*, *mod name*, and *mod ID*. 
    * Change the descriptions, and add a **require** tag in *mod.info* if necessary.
7. Update your mod's **poster.png** and your workshop item's **preview.png**.
    * _Be **absolutely certain** that you **flatten your images** and **export them at the same size as the ones in this template**._
8. Launch Project Zomboid and select:
    * WORKSHOP
    * Create or update items
    * *Your Workshop Item Name*
    * NEXT
    * NEXT (again)
    * Upload to Steam Workshop now!

That's it! You're done! A workshop ID will be automatically generated when you publish a new item for the first time.