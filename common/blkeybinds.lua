--BasicLuas Ver. 18.0
--By Aesk (with much help from the Ashita discord members)

local blkeybinds = T{};

--[[
/blmessages		-Toggle messages on and off
/wsdistance		-Toggle block on ws when out of range
/dt				-Toggle damage taken set (fulltime)
/th				-Toggle treasure hunter set (combines with TP set)
/kite			-Equip movement set (fulltime)
/idleset		-Cycles idle sets
/bldrain		-Cast your highest tier Drain spell
/warpme			-Equip warp item (specified in blsettings.lua) and use it
/xpring			-Equip xp ring (specified in blsettings.lua)
/rrset			-Equip reraise set (specified in blsets.lua)
/craftset		-Equip crafing set
/zeniset		-Equip zeni set
/fishset 		-Equip fishing set
/helmset		-Equip gathering set
/disable		-Disables automatic gear swaps for all slots
/weapon			-Cycles weapons
/modes			-Prints a list of your currently set modes.
/nukeset		-(RDM BLM SCH GEO) Cycles nuke sets 
/burst			-(RDM BLM SCH GEO) Toggles magic burst set 
/weapon			-(BLM SCH) Cycles between club or staff 
/elecycle		-(BLM SCH) Cycles element
/nuke			-(RDM BLM SCH GEO) Cast your highest tier spell of chosen element (/elecycle)
/death			-(BLM) Toggle Death spell set 
/fight			-(RDM BRD GEO WHM) Locks mage weapon/ammo 
/sir			-(PLD RUN) Spell interupt down set 
/tankset		-(PLD RUN) Toggle tank set
/pupmode		-(PUP) Toggle puppet mode
/tpgun			-(COR) Toggle TP gun mode
/cormsg			-(COR) Toggle roll messages
/forcestring	-(BRD) Toggle forced harp mode


 KEY BINDS
 ! - Represents ALT key must be pressed with the keybind.
 ^ - Represents CTRL key must be pressed with the keybind.
 @ - Represents Windows key must be pressed with the keybind.
 # - Represents Apps key must be pressed with the keybind.
 + - Represents Shift key must be pressed with the keybind.
]]--

local binds = T{
  ['^F8'] = 'fillmode',
  ['^F9'] = 'dt',
  ['^F10'] = 'th',
  ['^F12'] = 'idleset',
  ['@F12'] = 'warpme',
  ['@C'] = 'craftset',
  ['@F'] = 'fishset',
  ['@H'] = 'helmset',
  ['@X'] = 'xpring',
  ['@D'] = 'disable',
  ['@W'] = 'weapon',
  ['@A'] = 'ammo',
  ['F10'] = 'modes',
};

function blkeybinds.SetKeybinds()

	for key,macro in pairs(binds) do
		AshitaCore:GetChatManager():QueueCommand(-1, string.format('/bind %s /%s', key, macro));
	end

end

function blkeybinds.ClearKeybinds()

	for key,macro in pairs(binds) do
		AshitaCore:GetChatManager():QueueCommand(-1, string.format('/unbind %s', key));
	end

end

function blkeybinds.GetTriggerKey(args)
    for key,macro in pairs(binds) do
        if (macro == args) then
            return key;
        end
    end
    return 'Unknown';
end

return blkeybinds;


