local Module = {}

local OrionLibInstance = nil
local WindowInstance = nil

function Module.SetLibrary(OrionLib)
	OrionLibInstance = OrionLib
end

function Module.SetWindow(Window)
	WindowInstance = Window
end

function Module.DoesExist(Object)
	if Object == "Library" then
		if OrionLibInstance ~= nil then
			return true
		else
			return false
		end
	elseif Object == "Window" then
		if WindowInstance ~= nil then
			return true
		else
			return false
		end
	end
end

return Module
