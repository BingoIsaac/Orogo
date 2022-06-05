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
local CurrentUserHasPremiumBypassed = false

-- // Core Functions
function Module.Synchronize(OrionLib)
    OrionLibInstance = OrionLib
    if CoreGui:FindFirstChild("Orion") then
    	OrionInstance = CoreGui.Orion
    end
end

function Module:MakeWindow(Table)
    local TitleOfWindow = Table["Name"] or "Orogo"
    IsPremiumHidden = Table["HidePremium"] or false
    local UserRanks = Table["UserRanks"] or nil
    local PremiumBypass = Table["PremiumBypass"] or nil
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
	
	if UserRanks ~= nil then
	    if IsPremiumHidden then warn("Premium is set to hidden and cannot be set. (Orogo)") else
    	    for Id, Rank in pairs(UserRanks) do
    	        if Id == 0 then
    	            RankInstance.Text = Rank
    	        end
    	        if LocalPlayer.UserId == Id then
    	            RankInstance.Text = Rank
    	        end
    	    end
    	end
	end

    if PremiumBypass ~= nil then
	    if IsPremiumHidden then warn("Premium is set to hidden and cannot be set. (Orogo)") else
    	    for Id, BypassedForUser in pairs(PremiumBypass) do
    	        if LocalPlayer.UserId == Id and BypassedForUser == true then
    	            CurrentUserHasPremiumBypassed = true
    	        end
    	    end
    	end
    end

    local WindowLibrary = {}
    
    function WindowLibrary:MakeTab(Table)
        local TitleOfTab = Table["Name"] or "Tab"
        local function HandlePremiumOnly()
            if CurrentUserHasPremiumBypassed then
                return false
            else
                return Table["PremiumOnly"] or false
            end
        end
        local Tab = Window:MakeTab({
            Name = TitleOfTab,
    	    Icon = Table["Icon"] or nil,
    	    PremiumOnly = HandlePremiumOnly()
	    })
	
	    local TabLibrary = {}
	    
	    function TabLibrary:AddButton(Table)
	        local TitleOfButton = Table["Name"] or "Button " .. tostring(math.huge())
            local Button = Tab:AddButton({
		        Name = TitleOfButton,
		        Save = Table["Save"] or nil,
		        Flag = Table["Flag"] or nil,
		        Callback = Table["Callback"] or function() print("Pressed") end
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
	    
	    function TabLibrary:AddToggle(Table)
	        local TitleOfToggle = Table["Name"] or "Toggle " .. tostring(math.huge())
	        local Toggle = Tab:AddToggle({
	            Name = TitleOfToggle,
	            Default = Table["Default"] or nil,
	            Save = Table["Save"] or nil,
	            Flag = Table["Flag"] or nil,
	            Callback = Table["Callback"] or function(Value) print(Value) end
	        })
	    
	        local ToggleLibrary = {}
	        
	        function ToggleLibrary:Set(Boolean)
	            Toggle:Set(Boolean)
	        end
	        
	        return ToggleLibrary
	    end
	    
	    function TabLibrary:AddColorpicker(Table)
            local TitleOfColorpicker = Table["Name"] or "Colorpicker " .. tostring(math.huge())
            local Colorpicker = Tab:AddColorpicker({
                Name = TitleOfColorpicker,
                Default = Table["Default"] or nil,
                Save = Table["Save"] or nil,
                Flag = Table["Flag"] or nil,
                Callback = Table["Callback"] or function(Value) print(Value) end
            })
        
            local ColorpickerLibrary = {}
            
            function ColorpickerLibrary:Set(Color)
                Colorpicker:Set(Color)
            end
            
            return ColorpickerLibrary
	    end
	    
	    function TabLibrary:AddSlider(Table)
	        local TitleOfSlider = Table["Name"] or "Slider " .. tostring(math.huge())
	        local Slider = Tab:AddSlider({
	            Name = TitleOfSlider,
	            Min = Table["Min"] or nil,
	            Max = Table["Max"] or nil,
	            Default = Table["Default"] or nil,
	            Color = Table["Color"] or nil,
	            Increment = Table["Increment"] or 1,
	            ValueName = Table["ValueName"] or nil,
	            Save = Table["Save"] or nil,
	            Flag = Table["Flag"] or nil,
	            Callback = Table["Callback"] or function(Value) print(Value) end
	        })
	    
	        local SliderLibrary = {}
	        
	        function SliderLibrary:Set(Number)
	            Slider:Set(Number)
	        end
	        
	        return SliderLibrary
	    end
	    
	    function TabLibrary:AddLabel(Text)
	        local TextOfLabel = Text or "Label " .. tostring(math.huge())
	        local Label = Tab:AddLabel(TextOfLabel)
	        
	        local LabelLibrary = {}
	        
	        function LabelLibrary:Set(NewText)
	            TextOfLabel = NewText or ""
	            Label:Set(TextOfLabel)
	        end
	        
	        return LabelLibrary
	    end
	    
	    function TabLibrary:AddParagraph(Title, Paragraph)
	        local TitleOfParagraph = Title or "Paragraph " .. tostring(math.huge())
	        local Paragraph = Tab:AddParagraph(TitleOfParagraph, Paragraph or "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Est pellentesque elit ullamcorper dignissim cras.")
	        
	        local ParagraphLibrary = {}
	        
	        function ParagraphLibrary:Set(NewTitle, NewParagraph)
	            TitleOfParagraph = NewTitle or ""
	            Paragraph:Set(TitleOfParagraph, NewParagraph or "")
	        end
	        
	        return ParagraphLibrary
	    end
	    
	    function TabLibrary:AddTextbox(Table)
	        local TitleOfTextbox = Table["Name"] or "Textbox " .. tostring(math.huge())
	        local Textbox = Tab:AddTextbox({
	            Name = TitleOfTextbox,
	            Default = Table["Default"] or nil,
	            TextDisappear = Table["TextDisappear"] or nil,
	            Callback = Table["Callback"] or function(Value) print(Value) end
	        })
	    end
	    
	    function TabLibrary:AddBind(Table)
	        local TitleOfBind = Table["Name"] or "Bind " .. tostring(math.huge())
	        local Bind = Tab:AddBind({
	            Name = TitleOfBind,
	            Default = Table["Default"] or nil,
	            Hold = Table["Hold"] or false,
	            Save = Table["Save"] or nil,
	            Flag = Table["Flag"] or nil,
	            Callback = Table["Callback"] or function() print("Keybind Pressed") end
	        })
	    
	        local BindLibrary = {}
	        
	        function BindLibrary:Set(Key)
	            Bind:Set(Key or Enum.KeyCode.E)
	        end
	        
	        return BindLibrary
	    end
	    
	    function TabLibrary:AddDropdown(Table)
	        local TitleOfDropdown = Table["Name"] or "Dropdown " .. tostring(math.huge())
	        local Dropdown = Tab:AddDropdown({
	            Name = TitleOfDropdown,
	            Default = Table["Default"] or "1",
	            Options = Table["Options"] or {"1", "2", "3"},
	            Save = Table["Save"] or nil,
	            Flag = Table["Flag"] or nil,
	            Callback = Table["Callback"] or function(Value) print(Value) end
	        })
	    
	        local DropdownLibrary = {}
	        
	        function DropdownLibrary:Refresh(Table, Boolean)
	            Dropdown:Refresh(Table, Boolean)
	        end
	        
	        function DropdownLibrary:Set(Option)
	            Dropdown:Set(Option)
	        end
	        
	        return DropdownLibrary
	    end
	    
	    return TabLibrary
    end
	
	return WindowLibrary
end

function Module:ChangeWindowTitle(Title)
	TitleInstance.Text = Title
end

function Module.SetUserRanks(Table)
    OrionLibInstance:MakeNotification({
        Name = "Orogo",
	    Content = "SetUserRanks is outdated and should refer to the new option that can be activated/used when making a window.",
	    Image = "rbxassetid://4483345998",
	    Time = 5
    })
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

return Module
