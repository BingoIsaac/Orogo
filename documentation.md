# OROGO DOCS

Welcome to the documentation. Find where you are looking for.

## LOADSTRING

```lua
local Orogo = loadstring(game:HttpGet(('orogo.bingoisaac.workers.dev')))()
```

## API REFERENCE

### SetLibrary
**Signature:** `Orogo.SetLibrary(inst: Instance)` <br>
**Aliases:** N/A
**Description:** Set the Orion library for Orogo so it can use it. <br>
**Example:**
```lua
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Orogo = loadstring(game:HttpGet(('orogo.bingoisaac.workers.dev')))()
Orogo.SetLibrary(OrionLib)
```

### SyncOrion
**Signature:** `Orogo.SyncOrion(nil: nil)` <br>
**Aliases:** N/A
**Description:** Runs a line of code that gets the UI of Orion and uses it to edit text and other changes. <br>
**Example:**
```lua
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Orogo = loadstring(game:HttpGet(('orogo.bingoisaac.workers.dev')))()
Orogo.SyncOrion()
```

### MakeWindow
**Signature:** `Orogo:MakeWindow(table: Table)` <br>
**Aliases:** N/A
**Description:** This is a customized version of Orion's MakeWindow. Refer to [this section of this documentation](https://github.com/shlexware/orion/blob/main/Documentation.md#creating-a-window) for more reference. <br>
**Example:**
```lua
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Orogo = loadstring(game:HttpGet(('orogo.bingoisaac.workers.dev')))()
Orogo.SetLibrary(OrionLib)
Orogo.SyncOrion()

local Window = Orogo:MakeWindow({
	Name = "Orogo", 
    HidePremium = false,
	SaveConfig = true,
	ConfigFolder = "OrogoFiles"
})
```

### SetUserRanks
**Signature:** `Orogo.SetUserRanks(table: Table)` <br>
**Aliases:** N/A
**Description:** When the script loads it checks if you are a user and then sets your rank to the specified text. THIS WILL NOT WORK IF HIDEPREMIUM IS ON WHEN MAKING A WINDOW! <br>
**Example:**
```lua
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Orogo = loadstring(game:HttpGet(('orogo.bingoisaac.workers.dev')))()
Orogo.SetLibrary(OrionLib)
Orogo.SyncOrion()

local Window = Orogo:MakeWindow({
	Name = "Orogo", 
    HidePremium = false,
	SaveConfig = true,
	ConfigFolder = "OrogoFiles"
})
Orogo.SetUserRanks({
    [1] = "Roblox",
    [156] = "Builderman",
    [2939439910] = "SirMeme V2",
    [27933249] = "This rank is way too long and I am unable to turn on TextWrapping without it breaking"
})
```

### ChangeWindowTitle
**Signature:** `Orogo:ChangeWindowTitle(str: String)` <br>
**Aliases:** N/A
**Description:** Change the title of the made window. <br>
**Example:**
```lua
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Orogo = loadstring(game:HttpGet(('orogo.bingoisaac.workers.dev')))()
Orogo.SetLibrary(OrionLib)
Orogo.SyncOrion()

local Window = Orogo:MakeWindow({
	Name = "Orogo", 
    HidePremium = false,
	SaveConfig = true,
	ConfigFolder = "OrogoFiles"
})

task.wait(5)

Orogo:ChangeWindowTitle("Orogo v2")
```

### ChangeLiveRank
**Signature:** `Orogo:ChangeLiveRank(str: String)` <br>
**Aliases:** N/A
**Description:** Change the text of the rank label. <br>
**Example:**
```lua
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Orogo = loadstring(game:HttpGet(('orogo.bingoisaac.workers.dev')))()
Orogo.SetLibrary(OrionLib)
Orogo.SyncOrion()

local Window = Orogo:MakeWindow({
	Name = "Orogo", 
    HidePremium = false,
	SaveConfig = true,
	ConfigFolder = "OrogoFiles"
})

task.wait(5)

Orogo:ChangeLiveRank("Used Orogo: 5s")
```
