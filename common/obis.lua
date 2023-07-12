--[[
    Instructions for use:
    -Copy this file to Ashita/config/addons/luashitacast/player_id/obis.lua for each character using it.
    -Comment out (add a -- to the start of the line) any obis that character doesn't have in obiTable.
    -Add this line to the start of your profile:
        local obiLib = gFunc.LoadFile('obis.lua');
    -To evaluate obis, call the function:
        obiLib:Evaluate(minimumBonus, element);
    -Minimum bonus is used for cases like orpheus's sash, where you only want it active during double weather.
    -Element is not needed if you are in precast or midcast of a spell.
    -This function returns true if an obi is put on, false if it is not.
    
    -For example, basic usage for spells is simply:
        obiLib:Evaluate(0.1);
    -An example usage for melee range leaden salute might be:
        obiLib:Evaluate(0.15, 'Dark');
    -In this example, because it is not a spell, the element needs specified.
    -Because orpheus's sash is going to give 15% damage in a unique term, obi needs double weather to win.
]]
    
blsets = gFunc.LoadFile('common\\blsets.lua');

local strongElement = {
    Fire = 'Water',
    Earth = 'Wind',
    Water = 'Thunder',
    Wind = 'Ice',
    Ice = 'Fire',
    Thunder = 'Earth',
    Light = 'Dark',
    Dark = 'Light'
};

local obiClass = {};

function obiClass:Evaluate(minimumModifier, element)
    if (element == nil) then
        element =  gData.GetAction().Element;
        if (element == nil) then
            return false;
        end
    end
    
    local env = gData.GetEnvironment();
    local positiveMods = 0;
    local negativeMods = 0;
    
    if (env.DayElement == element) then
        positiveMods = positiveMods + 0.1;
    elseif (env.DayElement == strongElement[element]) then
        negativeMods = negativeMods + 0.1;
    end
    
    if (env.WeatherElement == element) then
        local modifier = (string.match(env.Weather, 'x2') ~= nil) and 0.25 or 0.1;
        positiveMods = positiveMods + modifier;
    elseif (env.WeatherElement == strongElement[element]) then
        local modifier = (string.match(env.Weather, 'x2') ~= nil) and 0.25 or 0.1;
        negativeMods = negativeMods + modifier;
    end
    
    local overallMod = positiveMods - negativeMods;
    
    --If no negative mods, simply prioritize universal obi over single for the extra chance to save MP.
    if (negativeMods == 0) then
        if (overallMod >= minimumModifier) then        
            if (blsets.obiTable.Universal ~= nil) then
                gFunc.Equip('waist', blsets.obiTable.Universal);
                return true;
            elseif (blsets.obiTable[element] ~= nil) then
                gFunc.Equip('waist', blsets.obiTable[element]);
                return true;
            end
        end
        return false;
    end
    
    --If there are negative mods, but positive mod is above minimum, can use single element obi.
    --This will only force the positive mod, and give the required bonus.
    if (positiveMods >= minimumModifier) and (blsets.obiTable[element] ~= nil) then
        gFunc.Equip('waist', blsets.obiTable[element]);
        return true;
    end
    
    --[[
        If there are negative mods, but positive mods outweigh it(double positive weather, negative day),
        then it's fine to use universal obi and force both to proc.
    ]]--
    if (overallMod >= minimumModifier) and (blsets.obiTable.Universal ~= nil) then
        gFunc.Equip('waist', blsets.obiTable.Universal);
        return true;
    end
    
    return false;
end

return obiClass;