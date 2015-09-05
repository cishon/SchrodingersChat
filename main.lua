--[[
--
-- Schrodinger's Chat - Cishon @ US-Dunemaul
--
]]--

-- init

local addonName, sc=...
sc.characterName, _ = UnitName("player");
sc.className = select(2, UnitClass("player"));

-- event functions

local function SCEventAddonLoaded (self, name)
    if name ~= addonName then
        return
    end

    print("Schrodinger's Chat Loaded");
end

local SCEventHandlers = {
    "ADDON_LOADED" = SCEventAddonLoaded,
}

local function SCEventHandler (self, event, ...)
    if (SCEventHandlers[event] == nil) then
        return
    end

    SCEventHandlers[event](self,...);
end

-- create main frame

sc.mainFrame = CreateFrame("Frame");
sc.mainFrame:SetScript("OnEvent", SCEventHandler);

sc.mainFrame:RegisterEvent("ADDON_LOADED");
