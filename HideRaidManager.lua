local manager = CompactRaidFrameManager
manager:SetAlpha(0)

-- look through a frame's parents
local function FindParent(frame, target)
	if frame == target then
		return true
	elseif frame then
		return FindParent(frame:GetParent(), target)
	end
end

manager:HookScript("OnEnter", function(self)
	self:SetAlpha(1)
end)

manager:HookScript("OnLeave", function(self)
	if manager.collapsed and not FindParent(GetMouseFoci()[1], self) then
		self:SetAlpha(0)
	end
end)

-- pick buttton between classic/retail
local button = manager.toggleButtonBack or manager.toggleButton
button:HookScript("OnClick", function()
	if manager.collapsed then
		manager:SetAlpha(0)
	end
end)

if manager.containerResizeFrame then
	-- not in retail
	manager.containerResizeFrame:SetIgnoreParentAlpha(true)
end
