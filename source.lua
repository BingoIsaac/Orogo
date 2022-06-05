-- // Preload Services
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

--// Debug
-- no debug yet

-- // Module Table
local Module = {}

-- // Core Orion Elements
local OrionLibInstance = nil
local OrionInstance = nil

-- // Orion UI Elements
local TitleInstance = nil
local RankInstance = nil

--// Realization
local IsPremiumHidden = false

-- // Core Functions
function Module.SyncOrion()
    if CoreGui:FindFirstChild("Orion") then
    	OrionInstance = CoreGui.Orion
    end
end

function Module.SetLibrary(OrionLib)
	OrionLibInstance = OrionLib
	-- Outdation Reminder
	task.wait(1)

	OrionLibInstance:MakeNotification({
		Name = "Orogo",
		Content = "Version outdated, talk to `isaac deez bungo #0110` on Discord to help set up the newer version.",
		Image = "rbxassetid://4483345998",
		Time = 5
	})
end

function Module:MakeWindow(Table)
    local TitleOfWindow = Table["Name"] or "Orogo"
    IsPremiumHidden = Table["HidePremium"] or false
	local Window = OrionLibInstance:MakeWindow({
		Name = TitleOfWindow,
		HidePremium = IsPremiumHidden,
		SaveConfig = Table["SaveConfig"] or nil,
		ConfigFolder = Table["ConfigFolder"] or nil
	})
	
	for Index, Label in pairs(OrionInstance:GetDescendants()) do
		if Label:IsA("TextLabel") and Label.Text == TitleOfWindow then
			TitleInstance = Label
		end
	end
	
	if not IsPremiumHidden then
    	for Index, Label in pairs(OrionInstance:GetDescendants()) do
    		if Label:IsA("TextLabel") and (Label.Text == "Standard" or Label.Text == "Premium") then
    			RankInstance = Label
    		end
    	end
    end
	
	return Window
end

function Module:ChangeWindowTitle(Title)
	TitleInstance.Text = Title
end

function Module.SetUserRanks(Table)
    if not IsPremiumHidden then
        for Id, Rank in pairs(Table) do
            if LocalPlayer.UserId == Id then
                RankInstance.Text = Rank
            end
        end
    else
        warn("Premium is set to hidden and cannot be set. (Orogo)")
    end
end

function Module:ChangeLiveRank(Rank)
    if not IsPremiumHidden then
        RankInstance.Text = Rank
    else
        warn("Premium is set to hidden and cannot be set. (Orogo)")
    end
end

function Module:AddButton(Tab, Table)
    local TitleOfButton = Table["Name"] or "Button " .. tostring(math.random(1, 100000))
    local Button = Tab:AddButton({
		Name = TitleOfButton,
		Save = Table["Save"] or nil,
		Flag = Table["Flag"] or nil,
		Callback = Table["Callback"] or function() print("Orogo") end
	})
	task.wait()
	if Table["OverrideIcon"] ~= nil then
	    for Index, Icon in pairs(OrionInstance:GetDescendants()) do
		    if Icon:IsA("TextLabel") and Icon.Name == "Content" and Icon.Text == TitleOfButton then
			    Icon = Icon.Parent:FindFirstChild("ImageLabel")
			    Icon.Image = Table["OverrideIcon"]
		    end
	    end
	end
end

return Module
