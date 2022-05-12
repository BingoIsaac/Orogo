-- // Preload Services
local CoreGui = game:GetService("CoreGui")

-- // Module Table
local Module = {}

-- // Core Orion Elements
local OrionLibInstance = nil
local OrionInstance = nil

-- // Orion UI Elements

local TitleInstance = nil

-- // Core Functions

function Module.SetOrion()
	OrionInstance = CoreGui:FindFirstChild("Orion")
end

function Module.SetLibrary(OrionLib)
	OrionLibInstance = OrionLib
end

function Module:MakeWindow(Table)
	local Name = Table.Name or "Orogo"
	local HidePremium = Table.HidePremium or false
	local SaveConfig = Table.SaveConfig or nil
	local ConfigFolder = Table.ConfigFolder or nil
	local Window = OrionLibInstance:MakeWindow({
		Name = Name
		HidePremium = HidePremium,
		SaveConfig = SaveConfig,
		ConfigFolder = ConfigFolder
	})
	
	for Index, Label in pairs(OrionInstance:GetDescendants()) do
		if Label:IsA("TextLabel") and Label.Text == Name then
			TitleInstance = Label
		end
	end
	
	return Window
end

function Module:ChangeWindowTitle(Title)
	TitleInstance.Text = Title
end

function Module.DoesExist(Object)
	if Object == "Library" then
		if OrionLibInstance ~= nil then
			return true
		else
			return false
		end
	elseif Object == "Orion" then
		if OrionInstance ~= nil then
			return true
		else
			return false
		end
	end
end

return Module
