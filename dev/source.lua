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

    local WindowLibrary = {}
    
    function WindowLibrary:MakeTab(Table)
        local TitleOfTab = Table["Name"] or "Tab"
        local Tab = Window:MakeTab({
            Name = TitleOfTab,
    	    Icon = Table["Icon"] or nil,
    	    PremiumOnly = Table["PremiumOnly"] or false
	    })
	
	    local TabLibrary = {}
	    
	    function TabLibrary:AddButton(Table)
	        local TitleOfButton = Table["Name"] or "Button " .. math.huge()
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
	        local TitleOfToggle = Table["Name"] or "Toggle " .. math.huge()
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
            local TitleOfColorpicker = Table["Name"] or "Colorpicker " .. math.huge()
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
	        local TitleOfSlider = Table["Name"] or "Slider " .. math.huge()
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
	        local TextOfLabel = Text or "Label " .. math.huge()
	        local Label = Tab:AddLabel(TextOfLabel)
	        
	        local LabelLibrary = {}
	        
	        function LabelLibrary:Set(NewText)
	            TextOfLabel = NewText or ""
	            Label:Set(TextOfLabel)
	        end
	        
	        return LabelLibrary
	    end
	    
	    function TabLibrary:AddParagraph(Title, Paragraph)
	        local TitleOfParagraph = Title or "Paragraph " .. math.huge()
	        local Paragraph = Tab:AddParagraph(TitleOfParagraph, Paragraph or "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Est pellentesque elit ullamcorper dignissim cras.")
	        
	        local ParagraphLibrary = {}
	        
	        function ParagraphLibrary:Set(NewTitle, NewParagraph)
	            TitleOfParagraph = NewTitle or ""
	            Paragraph:Set(TitleOfParagraph, NewParagraph or "")
	        end
	        
	        return ParagraphLibrary
	    end
	    
	    function TabLibrary:AddTextbox(Table)
	        local TitleOfTextbox = Table["Name"] or "Textbox " .. math.huge()
	        local Textbox = Tab:AddTextbox({
	            Name = TitleOfTextbox,
	            Default = Table["Default"] or nil,
	            TextDisappear = Table["TextDisappear"] or nil,
	            Callback = Table["Callback"] or function(Value) print(Value) end
	        })
	    end
	    
	    function TabLibrary:AddBind(Table)
	        local TitleOfBind = Table["Name"] or "Bind " .. math.huge()
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
	        local TitleOfDropdown = Table["Name"] or "Dropdown " .. math.huge()
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
