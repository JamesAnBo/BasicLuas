--[[
	SPECIAL TWISST EDITION Ver. 18.4
	By Aesk (with much help from the Ashita discord members)
	
	DIRECT ALL QUESTIONS ON USAGE TO TWISST.
]]--

local profile = {};

blinclude = gFunc.LoadFile('common\\blinclude.lua');
local rangedTable = gFunc.LoadFile('common\\rangedtypes.lua');
local isTargetTagged = gFunc.LoadFile('common\\isTargetTagged.lua');

--If you change the names here, Make sure to change the weapon sets below to match.
	--DO NOT CHANGE 'Default'
	--if 'One' is changed to 'Dagger'
	--then Weapon_One must be changed to Weapon_Dagger
blinclude.CreateCycle('Weapon', {[1] = 'Default', [2] = 'Sword', [3] = 'Dagger', [4] = 'DW'});

--[[

Example_set = {
	Main = 'Bronze Axe',
	Sub = 'Spartha',
	Range = 'Lgn. Crossbow',
	Ammo = 'Crossbow Bolt',
	Head = 'Mrc.Cpt. Headgear',
	Neck = 'Spike Necklace',
	Ear1 = 'Bone Earring',
	Ear2 = 'Bone Earring',
	Body = 'Armada Hauberk',
	Hands = 'Battle Gloves',
	Ring1 = 'Astral Ring',
	Ring2 = 'Astral Ring',
	Back = 'Rabbit Mantle',
	Waist = 'Leather Belt',
	Legs = 'Byakko\'s Haidate', --use \ before any 's in equipment names
	Feet = 'Bronze Leggings',
},

It's recommended for melee jobs to not put main and sub weapons in your sets. You should delete those lines.


See \common\blsets.lua for universal sets (Fishing, HELM, and Crafting sets and Elemental Staves/Obis)
See \common\blconfig.lua for universal settings (WS distance, XP ring, Warp item)
see \common\blkeybinds.lua for universal keybinds and a list of commands

For level sync priorities:

Sets with level sync gear must have their name end with _Priority.
Each slot should be a list of gear in highest to lowest level gear.

Example_set_Priority = {
		Head = { 'Optical Hat', 'Celata', 'Fighter\'s Mask', 'Centurion\'s Visor' },
        Neck = { 'Peacock Amulet', 'Spike Necklace' },
        Ear1 = { 'Bushinomimi', 'Coral Earring','Beetle Earring +1' },
        Ear2 = { 'Coral Earring','Beetle Earring +1' },
        Body = { 'Haubergeon', 'Ryl.Kgt. Chainmail', 'Brigandine', 'Ryl.Sqr. Chainmail', 'Ctr. Scale Mail' },
        Hands = { 'Thick Mufflers', 'Fighter\'s Mufflers', 'Custom M Gloves' },
        Ring1 = { 'Rajas Ring', 'Balance Ring' },
		Ring2 = { 'Sniper\'s Ring', 'Bastokan Ring' },
        Back = { 'Amemet Mantle', 'Rabbit Mantle' },
        Waist = { 'Warrior\'s Belt +1' },
        Legs = { 'Byakko\'s Haidate', 'Ryl.Kgt. Breeches', 'Republic Subligar' },
        Feet = { 'Fighter\'s Calligae', 'Ctr. Greaves' },
},

]]--

local sets = {
	Weapon_Default = {
	},
	Weapon_Default_HighMP = {
	
	},
--Weapons to cycle through
	--Elemental staves will automatically change with spell element if Weapon mode is 'Default'. Change staves in \common\blsets.lua
	Weapon_Sword = {
		Main = 'Martial Anelace',
        Sub = 'Genbu\'s Shield',
	},
	
	
	Weapon_Dagger = {
		Main = 'Misericorde',
		Sub = 'Genbu\'s Shield'
	},
	
	Weapon_DW = {
		Main = 'Misericorde',
		Sub = 'Misericorde'
	},
	
	Weapon_Resting = {--This will equip while resting if weapon mode is 'Default'.
		Main = 'Pluto\'s Staff',
		Sub = '',
	},	
	
--Idle sets
    Idle_Default = {
		Head = '',	
		Body = 'Vermillion Cloak',
		Ear1 = 'Geist Earring',
		Ear2 = 'Geist Earring',
		Hands = 'Errant Cuffs',
		Ring1 = 'Ether Ring',
		Ring2 = 'Tamas Ring',
		Neck = 'Holy Phial',
		Legs = 'Wise Braconi',
		Feet = 'Mahatma Pigaches',
		Waist = 'Hierarch Belt',
	},
	
    Resting = {
		--Main = 'Pluto\'s Staff',  Moved to Weapon_Resting
		Body = 'Errant Hpl.',
		Neck = 'Checkered Scarf',
		Head = 'Warlock\'s Chapeau',
		Legs = 'Wise Braconi',
	},
	
	
	Resting_HighMP = {
        --Main = 'Pluto\'s Staff',	Moved to Weapon_Resting
        Ammo = 'Phtm. Tathlum',
        Head = 'Warlock\'s Chapeau',
        Neck = 'Holy Phial',
        Ear1 = 'Geist Earring',
        Ear2 = 'Geist Earring',
        Body = 'Warlock\'s Tabard',
        Hands = 'Errant Cuffs',
        Ring1 = 'Ether Ring',
        Ring2 = 'Tamas Ring',
        Back = 'White Cape +1',
        Waist = 'Hierarch Belt',
        Legs = 'Wise Braconi',
        Feet = 'Mahatma Pigaches',
    },
	
	
    Idle_Regen = {},
	
	
    Idle_Refresh = {
	
	},
	
	
	Idle_Defense = {},
	
	
	Idle_HighMP = {
	    Main = '',
        Ammo = '',
        Head = 'Warlock\'s Chapeau',
        Neck = 'Holy Phial',
        Ear1 = 'Geist Earring',
        Ear2 = 'Geist Earring',
        Body = 'Warlock\'s Tabard',
        Hands = 'Errant Cuffs',
        Ring1 = 'Ether Ring',
        Ring2 = 'Tamas Ring',
        Back = 'White Cape +1',
        Waist = 'Hierarch Belt',
        Legs = 'Wise Braconi',
        Feet = 'Mahatma Pigaches',
	},
	
    Town = {
		Body = 'Kingdom Aketon', 
	},
	
--Defense sets
    Dt = {
		Body = 'Warlock\'s Tabard',
		Head = 'Warlock\'s chapeau',
	},

--Engaged sets
    Tp_Default = {
		Head = 'Optical Hat',
		Neck = 'Peacock Amulet',
		Body = 'Cerise Doublet',
		hands = 'Dusk Gloves',
		Waist = 'Swift Belt',
		Back = 'Amemet Mantle',
		Feet = 'Wise Pigaches',
		Legs = 'Wise Braconi',
		Ear1 = 'Bone earring +1',
		Ear2 = 'Bone earring +1',
	},
	Tp_Acc = {},
	Tp_Def = {},
	
	Tp_HighMP = {
		Head = 'Optical Hat',
		Neck = 'Peacock Amulet',
		Body = 'Cerise Doublet',
		Back = 'Amemet Mantle',		
		hands = 'Dusk Gloves',
		Waist = 'Swift Belt',	
		Feet = 'Wise Pigaches',
		Legs = 'Wise Braconi',	
		Ear1 = 'Bone earring +1',
		Ear2 = 'Bone earring +1',		
	},
	

--Precast sets (Fast Cast + Casting time-%) 
	--Put your total Fast Cast in the settings below.
    Precast = {
				
		Body = 'Warlock\'s Tabard',
		Head = 'Warlock\'s chapeau',
		Ammo = 'Phtm. Tathlum',
		hands = '',
		Waist = 'Swift Belt',
	},
	
	Precast_HighMP = {
	Head = 'Warlock\'s chapeau',	
	},
	
    Cure_Precast = {
		Body = 'Warlock\'s Tabard',
        Neck = 'Holy Phial',
        Ear1 = 'Geist Earring',
        Ear2 = 'Geist Earring',
        hands = '',
        Ring1 = 'Aqua Ring',
        Ring2 = 'Tamas Ring',
        Back = 'White Cape +1',
        Waist = 'Swift Belt',
	},
	
    Enhancing_Precast = {
		Head = 'Warlock\'s chapeau',
		Legs = 'Warlock\'s Tights', 
		Neck = 'Enhancing Torque',
		Waist = 'Swift Belt',
		Hands = '',
	},
	
	    Stun_Precast = {
		Main = 'Thunder Staff',
		Legs = '', 
		Neck = '',
		Waist = '',
		Hands = '',
	},
	
	
    Stoneskin_Precast = {},

--Midcast sets (Magic Attack Bonus / Cure Potency / Skill+ / etc.)
	--Elemental staves will automatically equip according to spell element if Weapon mode is 'Default'. Change staves in \common\blsets.lua
	--Obis will automatically equip for nukes if you have them in the right weather/day.
	--Healing sets
    Cure = {
		Head = 'Errant Hat',
		Body = 'Errant Hpl.',
        Neck = 'Holy Phial',
        Ear1 = 'Geist Earring',
        Ear2 = 'Geist Earring',
        Hands = 'Devotee\'s Mitts',
        Ring1 = 'Aqua Ring',
        Ring2 = 'Tamas Ring',
        Back = 'White Cape +1',
        Waist = 'Penitent\'s Rope',
        Legs = 'Warlock\'s Tights',    
        Feet = 'Mahatma Pigaches',
	},
    Self_Cure = {
		Head = 'Errant Hat',
		Body = 'Errant Hpl.',
        Neck = 'Holy Phial',
        Ear1 = 'Geist Earring',
        Ear2 = 'Geist Earring',
        Hands = 'Devotee\'s Mitts',
        Ring1 = 'Aqua Ring',
        Ring2 = 'Tamas Ring',
        Back = 'White Cape +1',
        Waist = 'Penitent\'s Rope',
        Legs = 'Warlock\'s Tights',    
        Feet = 'Mahatma Pigaches', 
	},
	Cure_HighMP = {
		Head = 'Errant Hat',
		Body = 'Errant Hpl.',
        Neck = 'Holy Phial',
        Ear1 = 'Geist Earring',
        Ear2 = 'Geist Earring',
        Hands = 'Devotee\'s Mitts',
        Ring1 = 'Aqua Ring',
        Ring2 = 'Tamas Ring',
        Back = 'White Cape +1',
        Waist = 'Penitent\'s Rope',
        Legs = 'Warlock\'s Tights',    
        Feet = 'Mahatma Pigaches',	
	},
	
	
    Regen = {},
    Cursna = {},

	--Enhancing sets
    Enhancing = {
			
		Body = 'Glamor Jupon',
		Legs = 'Warlock\'s Tights', 
		Neck = 'Enhancing Torque',
	},
    Self_Enhancing = {
		Body = 'Glamor Jupon',
		Legs = 'Warlock\'s Tights', 
		Neck = 'Enhancing Torque',
	},
	Enhancing_HighMP = {
		Body = 'Glamor Jupon',
		Legs = 'Warlock\'s Tights', 
		Neck = 'Enhancing Torque',	
	},
    Stoneskin = {
		Ammo = 'Phtm. Tathlum',
		Body = 'Glamor Jupon',
		Neck = 'Enhancing Torque',
		Ear1 = 'Geist Earring',
		Ear2 = 'Geist Earring',
		Hands = 'Devotee\'s Mitts',
		Ring1 = 'Aqua Ring',
		Ring2 = 'Tamas Ring',
		Back = 'White Cape +1',
		Waist = 'Penitent\'s Rope',
		Legs = 'Warlock\'s Tights',  
		Feet = 'Mahatma Pigaches',
	},
    Phalanx = {
		Body = 'Glamor Jupon',
		Legs = 'Warlock\'s Tights', 
		Neck = 'Enhancing Torque',
	},
    Refresh = {
        Neck = 'Holy Phial',
        Body = 'Warlock\'s Tabard',		
	},
	
    Refresh_HighMP = {
        Neck = 'Holy Phial',
        Body = 'Warlock\'s Tabard',		
	},	
	
    Self_Refresh = {
        Neck = 'Holy Phial',
        Body = 'Warlock\'s Tabard',		
	},

	--Enfeebling sets
    Enfeebling = {
		Head = 'Wise Cap',
		Body = 'Warlock\'s Tabard',
		Neck = 'Enfeebling Torque',
		Legs = 'Wise Braconi',
		Feet = 'Wise Pigaches',
	},
	Enfeebling_HighMP = {
		Head = 'Wise Cap',
		Body = 'Warlock\'s Tabard',
		Neck = 'Enfeebling Torque',	
		Legs = 'Wise Braconi',
		Feet = 'Wise Pigaches',		
	},
	
	
	
	DebuffMND = {
		Ammo = 'Phtm. Tathlum',
		Head = 'Errant Hat',
		Body = 'Warlock\'s Tabard',
		Neck = 'Enfeebling Torque',
        Ear1 = 'Geist Earring',
        Ear2 = 'Geist Earring',
        Hands = 'Devotee\'s Mitts',
        Ring1 = 'Aqua Ring',
        Ring2 = 'Tamas Ring',
        Back = 'White Cape +1',
        Waist = 'Penitent\'s Rope',
        Legs = 'Errant Slops',  
        Feet = 'Mahatma Pigaches',
	},
	
	
	DebuffINT = {
		Ammo = 'Phtm. Tathlum',
		Body = 'Warlock\'s Tabard',
        Head = 'Warlock\'s chapeau',
        Neck = 'Enfeebling Torque',
        Ear1 = 'Abyssal Earring',
        Ear2 = 'Morion Earring',
        Hands = 'Errant Cuffs',
        Ring1 = 'Snow Ring',
        Ring2 = 'Tamas Ring',
		Back = 'Black Cape +1',
        Waist = 'Penitent\'s Rope',
        Legs = 'Errant Slops',  
		Feet = 'Wise Pigaches',	
	},
	
	
	ElementalDebuff = {},

	--Dark sets
	DarkMagic = {
        body = 'Glamor Jupon',	
	},
	DarkMagic_HighMP={
	body = 'Glamor Jupon',	
	},
	Stun = {
        Main = 'Thunder Staff',
		body = 'Glamor Jupon',	
		Head = 'Wise Cap',
		Ring2 = 'Tamas Ring',
		Feet = 'Wise Pigaches',
	},	
    Drain = {
		Head = 'Wise Cap',
		body = 'Glamor Jupon',
		waist = 'Swift Belt',
		Hands = '',
		Legs = 'Wise Braconi',
		Feet = 'Wise Pigaches',
	},

	--Nuking sets
    Nuke = {
		Ammo = 'Phtm. Tathlum',
		Body = 'Errant Hpl.',
        Head = 'Warlock\'s chapeau',
        Neck = 'Elemental Torque',
        Ear1 = 'Abyssal Earring',
        Ear2 = 'Moldavite Earring',
        Hands = 'Errant Cuffs',
        Ring1 = 'Snow Ring',
        Ring2 = 'Tamas Ring',
        Waist = 'Penitent\'s Rope',
		Back = 'Black Cape +1',
        Legs = 'Errant Slops',  
		Feet = 'Wise Pigaches',	
	},
    NukeACC = {
		Neck = 'Elemental Torque',
	},
	Nuke_HighMP = {
		Ammo = 'Phtm. Tathlum',
		Body = 'Errant Hpl.',
        Head = 'Warlock\'s chapeau',
        Neck = 'Elemental Torque',
        Ear1 = 'Abyssal Earring',
        Ear2 = 'Moldavite Earring',
        Hands = 'Errant Cuffs',
        Ring1 = 'Snow Ring',
        Ring2 = 'Tamas Ring',
        Waist = 'Penitent\'s Rope',
		Back = 'Black Cape +1',
        Legs = 'Errant Slops',  
		Feet = 'Wise Pigaches',	
	},
    Burst = {},
	Divine = {},
	Divine_HighMP = {},

--Ranged sets
	--Put your total Snapshot in the settings below.
    Preshot = {},
    Midshot = {},

--Weaponskill sets
    Ws_Default = {
		Head = 'Optical Hat',
		Body = 'Cerise Doublet',		
		Neck = 'Spike Necklace',
		Hands = 'Ogre Gloves',
		ring1 = 'Aqua Ring',
		ring2 = 'Courage Ring',
		Waist = 'Brave Belt',
		Ear1 = 'Bone Earring +1',
		Ear2 = 'Bone Earring +1',
		Back = 'Amemet Mantle',	
	},
	
	Ws_Acc = {},
	Ws_Elemental = {
		Head = 'Optical Hat',
		Body = 'Cerise Doublet',
		Hands = 'Devotee\'s Mitts',
		Legs = 'Warlock\'s Tights',
		Feet = 'Mahatma pigaches',
		Neck = 'Peacock amulet',
		ring1 = 'Tamas Ring',
		ring2 = 'Aqua Ring',
		Waist = 'Penitent\'s rope',
		Ear1 = 'Geist Earring',
		Ear2 = 'Moldavite Earring',
		Back = 'White cape +1'
	},
	Ws_Hybrid = {},
		
	Vorpal_Blade = {
		Head = 'Optical Hat',
		Body = 'Cerise Doublet',		
		Neck = 'Spike Necklace',
		Hands = 'Ogre Gloves',
		ring1 = 'Aqua Ring',
		ring2 = 'Courage Ring',
		Waist = 'Brave Belt',
		Ear1 = 'Bone Earring +1',
		Ear2 = 'Bone Earring +1',
		Back = 'Amemet Mantle',
	},
	
	
	Savage_Blade = {},


--Ability sets
	CS = {}, --Used during activation.
	Chainspell = { --Locked to this set while Chainspell is active.
        Main = 'Thunder Staff',
		body = 'Glamor Jupon',	
		Head = 'Wise Cap',
		Ring2 = 'Tamas Ring',
		Legs = 'Wise Braconi',
		Feet = 'Wise Pigaches',
	},

--Other sets
    TH = {--/th will force this set to equip for 10 seconds
	},
    Movement = {
	},
	
--While debuffed sets
	ImParalyzed = {
		Waist = 'Flagellant\'s Rope'
	},
	ImSlept = {
		Neck = 'Opo-opo Necklace'
	},
	ImBlind = {
		-- Ear1 = 'Bat Earring',
		-- Ear2 = 'Bat Earring',
	},
	ImCharmed = {
		Main = 'Remove',
		Sub = 'Remove',
		-- Range = 'Remove',
		-- Ammo = 'Remove',
		-- Head = 'Remove',
        -- Neck = 'Remove',
        -- Ear1 = 'Remove',
        -- Ear2 = 'Remove',
        -- Body = 'Remove',
        -- Hands = 'Remove',
        -- Ring1 = 'Remove',
        -- Ring2 = 'Remove',
        -- Back = 'Remove',
        -- Waist = 'Remove',
        -- Legs = 'Remove',
        -- Feet = 'Remove',
	},
	
    ['export'] = {
        Main = 'Terra\'s Staff',
        Ammo = 'Phtm. Tathlum',
        Head = 'Warlock\'s Chapeau',
        Neck = 'Holy Phial',
        Ear1 = 'Geist Earring',
        Ear2 = 'Geist Earring',
        Body = 'Warlock\'s Tabard',
        Hands = 'Devotee\'s Mitts',
        Ring1 = 'Aqua Ring',
        Ring2 = 'Tamas Ring',
        Back = 'White Cape +1',
        Waist = 'Penitent\'s Rope',
        Legs = 'Warlock\'s Tights',
        Feet = 'San d\'Orian Clogs',
    },
};
profile.Sets = sets;

local Settings = {
	
	--[[
	Fast Cast I (RDM15) = 10%
	Fast Cast II (RDM35) = 15%
	Fast Cast III (RDM55) = 20%
	]]--
	FastCast = (20 + 0); -- Your total Fast Cast (Traits + Gear in precast)
	Snapshot = (0 + 0); -- Your total Snapshot (Traits + Gear in preshot)
	
	HighMPP = 85; --Put the MP% you want to trigger your _HighMP sets at.
	
	Lockstyle = true; -- set to true for lockstyle on load/sj change. Otherwise set to false.
	LockstyleSet = 2; -- Your chosen lockstyleset or set to 0 for just '/lockstyle on'.
	
	Macros = true; -- set to true for macro book and macro set changes on load/sj change.
	MacroBook = 1; -- The macro book you want for this job. Otherwise set to false.
	MacroSets = { --  ['SubJob'] = MacroSet# (set to 0 for no change). DO NOT change the numbers in the [].
		[1] = 0, --WAR
		[2] = 0, --MNK
		[3] = 2, --WHM
		[4] = 1, --BLM
		[5] = 0, --RDM
		[6] = 0, --THF
		[7] = 0, --PLD
		[8] = 10, --DRK
		[9] = 0, --BST
		[10] = 0, --BRD
		[11] = 0, --RNG
		[12] = 0, --SAM
		[13] = 3, --NIN
		[14] = 0, --DRG
		[15] = 0, --SMN
	};
	
	CurrentSubJob = 0;--DO NOT CHANGE. Keep this at 0.
};

profile.Packer = {};

local function MCHighMPTrue()
	local MndDebuffs = T{ 'Slow', 'Slow II', 'Paralyze', 'Paralyze II', 'Addle', 'Addle II'};
    local ElementalDebuffs = T{ 'Burn', 'Rasp', 'Drown', 'Choke', 'Frost', 'Shock' };
	local player = AshitaCore:GetMemoryManager():GetPlayer();
    local weather = gData.GetEnvironment();
    local spell = gData.GetAction();
    local target = gData.GetActionTarget();
    local me = AshitaCore:GetMemoryManager():GetParty():GetMemberName(0);

	if (spell.Skill == 'Enfeebling Magic') then
		gFunc.EquipSet(sets.Enfeebling_HighMP)
		if (blinclude.GetCycle('Weapon') == 'Default') then 
			gFunc.Equip('main', blsets.ElementalStaffTable[spell.Element]);
		end;
		
	elseif (spell.Skill == 'Elemental Magic') then
		if (ElementalDebuffs:contains(spell.Name)) then
			return
		else
			gFunc.EquipSet(sets.Nuke_HighMP)
			if (spell.Element == weather.WeatherElement) or (spell.Element == weather.DayElement) then
				obiLib:Evaluate(0.1);
			end
			if (spell.MppAftercast <= 50) then
				gFunc.Equip('Neck', 'Uggalepih Pendant')
			end
		end
		if (blinclude.GetCycle('Weapon') == 'Default') then 
			gFunc.Equip('main', blsets.ElementalStaffTable[spell.Element]);
		end;
	elseif (spell.Skill == 'Dark Magic') then
		gFunc.EquipSet(sets.DarkMagic_HighMP)
		if (string.contains(spell.Name, 'Aspir') or string.contains(spell.Name, 'Drain')) then
			
		end
			
		if (blinclude.GetCycle('Weapon') == 'Default') then 
			gFunc.Equip('main', blsets.ElementalStaffTable[spell.Element]);
		end;
	elseif (spell.Skill == 'Healing Magic') then
		if string.contains(spell.Name, 'Cure') or string.contains(spell.Name, 'Curaga') then
			gFunc.EquipSet(sets.Cure_HighMP)
			if (blinclude.GetCycle('Weapon') == 'Default') then 
				gFunc.Equip('main', blsets.ElementalStaffTable[spell.Element]);
			end;
		end
	elseif (spell.Skill == 'Enhancing Magic') then
		gFunc.EquipSet(sets.Enhancing_HighMP);

		if string.match(spell.Name, 'Phalanx') then
			gFunc.EquipSet(sets.Phalanx_HighMP);
		elseif string.match(spell.Name, 'Stoneskin') then
			gFunc.EquipSet(sets.Stoneskin_HighMP);
		elseif string.contains(spell.Name, 'Regen') then
			gFunc.EquipSet(sets.Regen_HighMP);
		elseif string.contains(spell.Name, 'Refresh') then
			gFunc.EquipSet(sets.Refresh_HighMP);
		end
	elseif (spell.Skill == 'Divine Magic') then
		if (string.contains(spell.Name, 'Banish')) or (string.contains(spell.Name, 'Holy')) then
			gFunc.EquipSet(sets.Divine_HighMP)
			if (spell.Element == weather.WeatherElement) or (spell.Element == weather.DayElement) then
				obiLib:Evaluate(0.1);
			end
			if (spell.MppAftercast <= 50) then
				gFunc.Equip('Neck', 'Uggalepih Pendant')
			end
			if (blinclude.GetCycle('Weapon') == 'Default') then 
				gFunc.Equip('main', blsets.ElementalStaffTable[spell.Element]);
			end
		end
	end
end

local function MCHighMPFalse()
	local MndDebuffs = T{ 'Slow', 'Slow II', 'Paralyze', 'Paralyze II', 'Addle', 'Addle II'};
    local ElementalDebuffs = T{ 'Burn', 'Rasp', 'Drown', 'Choke', 'Frost', 'Shock' };
	local player = AshitaCore:GetMemoryManager():GetPlayer();
    local weather = gData.GetEnvironment();
    local spell = gData.GetAction();
    local target = gData.GetActionTarget();
    local me = AshitaCore:GetMemoryManager():GetParty():GetMemberName(0);
	
	if (spell.Skill == 'Enfeebling Magic') then
		gFunc.EquipSet(sets.Enfeebling);
		if (MndDebuffs:contains(spell.Name)) then
			gFunc.EquipSet(sets.DebuffMND);
		else
			gFunc.EquipSet(sets.DebuffINT);
		end
		if (blinclude.GetCycle('Weapon') == 'Default') then 
			gFunc.Equip('main', blsets.ElementalStaffTable[spell.Element]);
		end;
		
	elseif (spell.Skill == 'Elemental Magic') then
		if (ElementalDebuffs:contains(spell.Name)) then
			gFunc.EquipSet(sets.ElementalDebuff);
		else
			gFunc.EquipSet(sets.Nuke);
			if (blinclude.GetCycle('NukeSet') == 'Macc') then
				gFunc.EquipSet(sets.NukeACC);
			end
			if (blinclude.GetToggle('Burst') == true) then
				gFunc.EquipSet(sets.Burst);
			end
			if (spell.Element == weather.WeatherElement) or (spell.Element == weather.DayElement) then
				obiLib:Evaluate(0.1);
			end
			if (spell.MppAftercast <= 50) then
				gFunc.Equip('Neck', 'Uggalepih Pendant')
			end
		end
		if (blinclude.GetCycle('Weapon') == 'Default') then 
			gFunc.Equip('main', blsets.ElementalStaffTable[spell.Element]);
		end;
	elseif (spell.Skill == 'Dark Magic') then
		gFunc.EquipSet(sets.DarkMagic);
		if (spell.Name == 'Stun') then
			gFunc.EquipSet(sets.Stun);
		elseif (string.contains(spell.Name, 'Aspir') or string.contains(spell.Name, 'Drain')) then
			gFunc.EquipSet(sets.Drain);
			if (blinclude.GetCycle('NukeSet') == 'Power') then
				if (spell.Element == weather.WeatherElement) or (spell.Element == weather.DayElement) then
					obiLib:Evaluate(0.1);
				end
			end
		end
		if (blinclude.GetCycle('Weapon') == 'Default') then 
			gFunc.Equip('main', blsets.ElementalStaffTable[spell.Element]);
		end;
	elseif (spell.Skill == 'Healing Magic') then
		gFunc.EquipSet(sets.Cure);
		if (target.Name == me) then
			gFunc.EquipSet(sets.Self_Cure);
		end
		if string.contains(spell.Name, 'Cure') or string.contains(spell.Name, 'Curaga') then
			if (blinclude.GetCycle('Weapon') == 'Default') then 
				gFunc.Equip('main', blsets.ElementalStaffTable[spell.Element]);
			end;
		elseif string.match(spell.Name, 'Cursna') then
			gFunc.EquipSet(sets.Cursna);
		end

	elseif (spell.Skill == 'Enhancing Magic') then
		gFunc.EquipSet(sets.Enhancing);
		if (target.Name == me) then
			gFunc.EquipSet(sets.Self_Enhancing);
		end

		if string.match(spell.Name, 'Phalanx') then
			gFunc.EquipSet(sets.Phalanx);
		elseif string.match(spell.Name, 'Stoneskin') then
			gFunc.EquipSet(sets.Stoneskin);
		elseif string.contains(spell.Name, 'Regen') then
		gFunc.EquipSet(sets.Regen);
		elseif string.contains(spell.Name, 'Refresh') then
			gFunc.EquipSet(sets.Refresh);
			if (target.Name == me) then
				gFunc.EquipSet(sets.Self_Refresh);
			end
		end
	elseif (spell.Skill == 'Divine Magic') then
		gFunc.EquipSet(sets.Divine);
		if (string.contains(spell.Name, 'Banish')) or (string.contains(spell.Name, 'Holy')) then
			if (spell.Element == weather.WeatherElement) or (spell.Element == weather.DayElement) then
				obiLib:Evaluate(0.1);
			end
			if (spell.MppAftercast <= 50) then
				gFunc.Equip('Neck', 'Uggalepih Pendant')
			end
			if (blinclude.GetCycle('Weapon') == 'Default') then 
				gFunc.Equip('main', blsets.ElementalStaffTable[spell.Element]);
			end
		end
	end
end


function SetMacros()
	if (Settings.Macros == true) then
		if (Settings.MacroBook >= 1) and (Settings.MacroBook <= 20) then
			AshitaCore:GetChatManager():QueueCommand(1, '/macro book '.. Settings.MacroBook);
		end
		local mySub = AshitaCore:GetMemoryManager():GetPlayer():GetSubJob();
		if (Settings.MacroSets[mySub] ~= nil) then
			if (Settings.MacroSets[mySub] == 0) then
				return
			elseif (Settings.MacroSets[mySub] >= 1) and (Settings.MacroSets[mySub] <= 10) then
				AshitaCore:GetChatManager():QueueCommand(1, '/macro set '.. Settings.MacroSets[mySub]);
			end
		end
	end
end

function SetLockstyle()
	if (Settings.Lockstyle == true) then
		if (Settings.LockstyleSet > 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/lockstyleset '.. Settings.LockstyleSet);
		elseif (Settings.LockstyleSet == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/lockstyle on');
		end
	end
end

function UpdateSubJob()
    local mySub = AshitaCore:GetMemoryManager():GetPlayer():GetSubJob();
	
    if (mySub ~= Settings.CurrentSubJob) and (mySub > 0) then
		if (Settings.CurrentSubJob > 0) then
			SetLockstyle:once(2);
			SetMacros:once(3);
		end
		Settings.CurrentSubJob = mySub;
    end
end

local function get_equipped_item(slot)
    local inv = AshitaCore:GetMemoryManager():GetInventory();

    local eitem = inv:GetEquippedItem(slot);
    if (eitem == nil or eitem.Index == 0) then
        return nil;
    end

    local iitem = inv:GetContainerItem(bit.band(eitem.Index, 0xFF00) / 0x0100, eitem.Index % 0x0100);
    if(iitem == nil or T{ nil, 0, -1, 65535 }:hasval(iitem.Id)) then return nil; end

    return iitem.Id, iitem.Count;
end

profile.OnLoad = function()
	gSettings.AllowAddSet = true;
	
    blinclude.Initialize();

	SetLockstyle:once(2);
	SetMacros:once(3);
	
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^F1 /idleset');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^F2 /xpring');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^F12 /meleeset');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^F11 /fight');
	AshitaCore:GetChatManager():QueueCommand(-1, '/alias /rdm /lac fwd');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind !R /ma "Refresh" <stal> ;/echo |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| Refresh ');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind !Y /ma "Phalanx" <me> ;/echo |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| Phalanx ');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind !Q /ma "Regen" <stal> ;/echo |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| Regen ');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind !E /ma "Haste" <stal> ;/echo |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| Haste ');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind !S /ma "Sleep II" <stnpc> ;/echo ----------------------------------------------------  Sleep 2');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind !D /ma "Dispel" <stnpc> ;/echo ----------------------------------------------------  Dispel');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind !G /ma "Gravity" <stnpc> ;/echo ----------------------------------------------------  Gravity');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind !B /ma "Bind" <stnpc> ;/echo ----------------------------------------------------  Bind');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind @B /ma "Blink" <me> ;/echo |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| Blink ');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind @S /ma "Stoneskin" <me> ;/echo |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| Stoneskin ');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^A /ma "Aquaveil" <me> ;/echo ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| Aquaveil ');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^V /ma "Viruna" <stal> ;/echo ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| Viruna ');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^D /ma "Dia" <t> ;/echo ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| Dia ');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^- /ma "Utsusemi: Ichi" <me> ;/echo ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| Ichi ');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^= /ma "Utsusemi: Ni" <me> ;/echo ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| Ni ');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind @1 /equipset 12 ;/echo  Sword and Shield ');
end

profile.OnUnload = function()
    blinclude.Unload();
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^G');
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^F1');
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^F11');
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^F12');
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind !R');
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind !Y');
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind !Q');
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind !E');
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind !S');
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind !D');
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind !G');
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind !B');   
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind @B');
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind @S');
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^A');
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^D');
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^V');
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind @1');
end

profile.HandleCommand = function(args)
    blinclude.SetCommands(args);
end

profile.HandleDefault = function()
    blinclude.CheckLevelSync(profile.Sets);
    UpdateSubJob();
    local mpp = AshitaCore:GetMemoryManager():GetParty():GetMemberMPPercent(0);	
	local chainspell = gData.GetBuffCount('Chainspell');
	
	if (chainspell >= 1) then
		gFunc.EquipSet(sets.Chainspell);
		return
	end
    
    
    local player = gData.GetPlayer();
	if (player.Status ~= 'Resting') then
		if (blinclude.GetCycle('Weapon') ~= 'Default') and (player.Status ~= 'Resting') then 
			gFunc.EquipSet('Weapon_' .. blinclude.GetCycle('Weapon'))
		elseif (blinclude.GetToggle('HighMP') == true) and (mpp >= 85) then
			gFunc.EquipSet(sets.Weapon_Default_HighMP)
		else
			gFunc.EquipSet(sets.Weapon_Default)
		end;
	end
	


	if (blinclude.GetToggle('HighMP') == true) and (mpp >= Settings.HighMPP) then
	    if (player.Status == 'Engaged') then
			gFunc.EquipSet(sets.Tp_HighMP)
			if (blinclude.GetToggle('Fight') == false) then
				AshitaCore:GetChatManager():QueueCommand(1, '/fight')
			end
			if (blinclude.GetCycle('TH') ~= 'none') then
				if (blinclude.GetCycle('TH') == 'Tag') then 
				--if (not isTargetTagged()) then
					gFunc.EquipSet(sets.TH);
				--end
				elseif (blinclude.GetCycle('TH') == 'Fulltime') then
					gFunc.EquipSet(sets.TH);
				end
			end	
		elseif (player.Status == 'Resting') then
			gFunc.EquipSet(sets.Resting_HighMP);
		else
			gFunc.EquipSet(sets.Idle_HighMP);
			if (blinclude.GetCycle('IdleSet') ~= 'Default') then gFunc.EquipSet('Idle_' .. blinclude.GetCycle('IdleSet')) end;
		end
	else
		if (player.Status == 'Engaged') then
			gFunc.EquipSet(sets.Tp_Default)
			
			if (blinclude.GetCycle('TpSet') ~= 'Default') then 
				gFunc.EquipSet('Tp_' .. blinclude.GetCycle('TpSet'))
			end
			
			if (blinclude.GetCycle('TH') ~= 'none') then
				if (blinclude.GetCycle('TH') == 'Tag') then 
					if (not isTargetTagged()) then
						gFunc.EquipSet(sets.TH);
					end
				elseif (blinclude.GetCycle('TH') == 'Fulltime') then
					gFunc.EquipSet(sets.TH);
				end
			end	
			if (blinclude.GetToggle('Fight') == false) then
				AshitaCore:GetChatManager():QueueCommand(1, '/fight')
			end
		elseif (player.Status == 'Resting') then
			gFunc.EquipSet(sets.Resting);
			if (blinclude.GetCycle('Weapon') == 'Default') then 
				gFunc.EquipSet(sets.Weapon_Resting);
			end
		elseif (player.IsMoving == true) then
			gFunc.EquipSet(sets.Movement);
		else
			gFunc.EquipSet(sets.Idle_Default);
			if (blinclude.GetCycle('IdleSet') ~= 'Default') then gFunc.EquipSet('Idle_' .. blinclude.GetCycle('IdleSet')) end;
		end
	end

	local paralysis = gData.GetBuffCount('Paralysis');
	local sleep = gData.GetBuffCount('Sleep');
	local blind = gData.GetBuffCount('Blind');
	local charm = gData.GetBuffCount('Charm');
	
	if (paralysis > 0) then
		gFunc.EquipSet(sets.ImParalyzed);
	end
	if (sleep > 0) then
		gFunc.EquipSet(sets.ImSlept);
	end
	if (blind > 0) then
		gFunc.EquipSet(sets.ImBlind);
	end
	if (charm > 0) then
		gFunc.EquipSet(sets.ImCharmed);
	end
    
    blinclude.CheckDefault ();
    if (blinclude.GetToggle('DTset') == true) then gFunc.EquipSet(sets.Dt) end;
    if (blinclude.GetToggle('Kite') == true) then gFunc.EquipSet(sets.Movement) end;
    
end

profile.HandleAbility = function()
    local ability = gData.GetAction();
	local canJA = blinclude.CheckAbilityBailout();
    if (blinclude.GetToggle('JACancel') == true) and  (canJA == false) then
		print(chat.header('BasicLuas'):append(chat.message('~~~Ability canceled due to status~~~')));
		print(chat.header('BasicLuas'):append(chat.message('You can toggle this feature with /jacancel or /jac')));
		gFunc.CancelAction()
		return;
	else
		if ability.Name == 'Chainspell' then
			gFunc.EquipSet(sets.CS);
		end
	end

    blinclude.CheckCancels();
end

profile.HandleItem = function()
    local item = gData.GetAction();

	if string.match(item.Name, 'Holy Water') then gFunc.EquipSet(blsets.sets.Holy_Water) end
end

profile.HandlePrecast = function()
    gSettings.FastCast = Settings.FastCast
    local spell = gData.GetAction();
	local mpp = AshitaCore:GetMemoryManager():GetParty():GetMemberMPPercent(0);
	local chainspell = gData.GetBuffCount('Chainspell');
	
	if (chainspell >= 1) then
		return
	elseif (blinclude.GetToggle('HighMP') == true) and (mpp >= Settings.HighMPP) then
		gFunc.EquipSet(sets.Precast_HighMP)
		
		if (spell.Skill == 'Dark Magic') then
			if (spell.Name == 'Stun') then
				if (blinclude.GetCycle('Weapon') == 'Default') then 
					gFunc.Equip('main', blsets.ElementalStaffTable[spell.Element]);
				end
			end
		end
	else
		gFunc.EquipSet(sets.Precast)
		
		if (spell.Skill == 'Dark Magic') then
			if (spell.Name == 'Stun') then
				if (blinclude.GetCycle('Weapon') == 'Default') then 
					gFunc.Equip('main', blsets.ElementalStaffTable[spell.Element]);
				end
			end
		elseif (spell.Skill == 'Enhancing Magic') then
			gFunc.EquipSet(sets.Enhancing_Precast);

			if string.contains(spell.Name, 'Stoneskin') then
				gFunc.EquipSet(sets.Stoneskin_Precast);
			end
		elseif (spell.Skill == 'Healing Magic') then
			gFunc.EquipSet(sets.Cure_Precast);
		end
	end
    blinclude.CheckCancels();
end

profile.HandleMidcast = function()
	local mpp = AshitaCore:GetMemoryManager():GetParty():GetMemberMPPercent(0);
	local chainspell = gData.GetBuffCount('Chainspell');
	
	if (chainspell >= 1) then
		return
	elseif (blinclude.GetToggle('HighMP') == true) and (mpp >= Settings.HighMPP) then
		MCHighMPTrue();
	else
		MCHighMPFalse();
	end
	if (blinclude.GetCycle('TH') ~= 'none') then gFunc.EquipSet(sets.TH) end
end

profile.HandlePreshot = function()
	gSettings.Snapshot = Settings.Snapshot
	local LimitedAmmo = T{'Cmb.Cst. Arrow','T.K. Arrow','Ptr.Prt. Arrow','Irn.Msk. Bolt','Gld.Msk. Bolt','Heavy Shell'};
	local ammo = gData.GetEquipment().Ammo;
	
	if (ammo ~= nil) and (LimitedAmmo:contains(ammo.Name)) then
		print(chat.header('BasicLuas'):append(chat.warning('WARNING: '..ammo.Name..' is equipped.')));
	else
		local id, cnt = get_equipped_item(3);
		if (id ~= nil and cnt ~= nil) then
			if (cnt == 10) or (cnt == 5) or (cnt == 1)then
				print(chat.header('BasicLuas'):append(chat.warning('WARNING: '..ammo.Name..' is low. '..tostring(cnt-1)..' left.')));
			end
		end
	end
    gFunc.EquipSet(sets.Preshot);
end

profile.HandleMidshot = function()
    gFunc.EquipSet(sets.Midshot);
	if (blinclude.GetCycle('TH') ~= 'none') then gFunc.EquipSet(sets.TH) end
end

profile.HandleWeaponskill = function()
	local ws = gData.GetAction();
    local canWS = blinclude.CheckWsBailout();
    if (canWS == false) then 
		gFunc.CancelAction() 
		return;
	elseif string.match(ws.Name, 'Spirits Within') then
		return;
    else
		local player = gData.GetPlayer();
    
        gFunc.EquipSet(sets.Ws_Default)
		
		if (blinclude.GetCycle('TpSet') == 'Acc') then
			gFunc.EquipSet(sets.Ws_Acc);
		end
		
		if string.match(ws.Name, 'Vorpal Blade') then
            gFunc.EquipSet(sets.Vorpal_Blade)
		elseif string.match(ws.Name, 'Savage Blade') then
            gFunc.EquipSet(sets.Savage_Blade)
		elseif (blinclude.elementalWS:contains(ws.Name)) then
			gFunc.EquipSet(sets.Ws_Elemental)
			if (player.MPP <= 50) then
				gFunc.Equip('Neck', 'Uggalepih Pendant')
			end
		elseif (blinclude.hybridWS:contains(ws.Name)) then
			gFunc.EquipSet(sets.Ws_Hybrid)
			if (player.MPP <= 50) then
				gFunc.Equip('Neck', 'Uggalepih Pendant')
			end
		end
    end
end

return profile;
