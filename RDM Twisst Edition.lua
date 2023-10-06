--[[
	SPECIAL TWISST EDITION Ver. 18.6
	By Aesk (with much help from the Ashita discord members)
	
	DIRECT ALL QUESTIONS ON USAGE TO TWISST.
]]--

local profile = {};

blinclude = gFunc.LoadFile('common\\blinclude.lua');
local rangedTable = gFunc.LoadFile('common\\rangedtypes.lua');
local isTargetTagged = gFunc.LoadFile('common\\isTargetTagged.lua');
local conquest = gFunc.LoadFile('common\\conquest.lua');

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
    Idle_Default_Priority = {
        Main = {'Solid Wand','Yew Wand +1'},
        Sub = {'Hatchling Shield'},
        Ammo = {'Fortune Egg'},
        Head = {'Baron\'s Chapeau'},
        Neck = {'Justice Badge'},
        Ear1 = {'Energy Earring'},
        Ear2 = {'Energy Earring'},
        Body = {'Baron\'s Saio'},
        Hands = {'Devotee\'s Mitts'},
        Ring1 = {'Saintly Ring'},
        Ring2 = {'Saintly Ring'},
        Back = {'White Cape +1','Wizard\'s Mantle'},
        Waist = {'Mrc.Cpt. Belt'},
        Legs = {'Custom Slacks','Baron\'s Slops'},
        Feet = {'Custom M Boots'},
	},
	
    Resting = {
		Legs = 'Baron\'s Slops',
		Back = 'Wizard\'s Mantle',
	},
	
	
	Resting_HighMP = {
		Legs = 'Custom Slacks',
		Back = 'Wizard\'s Mantle',
    },
	
	
    Idle_Regen = {},
	
	
    Idle_Refresh = {
	
	},
	
	
	Idle_Defense = {},
	
	
	Idle_HighMP_Priority = {
        Main = {'Solid Wand','Yew Wand +1'},
        Sub = {'Hatchling Shield'},
        Ammo = {'Fortune Egg'},
        Head = {'Baron\'s Chapeau'},
        Neck = {'Justice Badge'},
        Ear1 = {'Energy Earring'},
        Ear2 = {'Energy Earring'},
        Body = {'Baron\'s Saio'},
        Hands = {'Devotee\'s Mitts'},
        Ring1 = {'Astral Ring'},
        Ring2 = {'Astral Ring'},
        Back = {'White Cape +1','Wizard\'s Mantle'},
        Waist = {'Mrc.Cpt. Belt'},
        Legs = {'Custom Slacks','Baron\'s Slops'},
        Feet = {'Custom M Boots'},
	},
	
    Town = {
	},
	
--Defense sets
    Dt = {
	},

--Engaged sets
    Tp_Default = {
		Ear1 = 'Bone earring +1',
		Ear2 = 'Bone earring +1',
        Ring1 = 'Balance Ring',
        Ring2 = 'Balance Ring',
	},
	Tp_Acc = {},
	Tp_Def = {},
	Tp_Eva = {},
	
	Tp_HighMP = {		
	},
	

--Precast sets (Fast Cast + Casting time-%) 
	--Put your total Fast Cast in the settings below.
    Precast = {
	},
	
	Precast_HighMP = {	
	},
	
    Cure_Precast = {
	},
	
    Enhancing_Precast = {
	},
	
	Stun_Precast = {
	},
	
	
    Stoneskin_Precast = {},

--Midcast sets (Magic Attack Bonus / Cure Potency / Skill+ / etc.)
	--Elemental staves will automatically equip according to spell element if Weapon mode is 'Default'. Change staves in \common\blsets.lua
	--Obis will automatically equip for nukes if you have them in the right weather/day.
	--Healing sets
    Cure = {
		Head = 'Traveler\'s Hat',
		Hands = 'Devotee\'s Mitts',
        Ring1 = 'Saintly Ring',
        Ring2 = 'Saintly Ring',
		Back = 'White Cape +1',
		Legs = 'Custom Slacks',
		Feet = 'Cotton Gaiters',
	},
    Self_Cure = {
		Head = 'Traveler\'s Hat',
		Hands = 'Devotee\'s Mitts',
        Ring1 = 'Saintly Ring',
        Ring2 = 'Saintly Ring',
		Back = 'White Cape +1',
		Legs = 'Custom Slacks',
		Feet = 'Cotton Gaiters',
	},
	Cure_HighMP = {
		Head = 'Traveler\'s Hat',
		Hands = 'Devotee\'s Mitts',
        Ring1 = 'Astral Ring',
        Ring2 = 'Astral Ring',
		Back = 'White Cape +1',
		Legs = 'Custom Slacks',
		Feet = 'Cotton Gaiters',
	},
	
	
    Regen = {},
    Cursna = {},

	--Enhancing sets
    Enhancing = {
	},
    Self_Enhancing = {
	},
	Enhancing_HighMP = {
	},
    Stoneskin = {
		Head = 'Traveler\'s Hat',
		Hands = 'Devotee\'s Mitts',
        Ring1 = 'Saintly Ring',
        Ring2 = 'Saintly Ring',
		Back = 'White Cape +1',
		Legs = 'Custom Slacks',
		Feet = 'Cotton Gaiters',
	},
    Phalanx = {
	},
    Refresh = {	
	},
    Refresh_HighMP = {	
	},	
    Self_Refresh = {	
	},

	--Enfeebling sets
    Enfeebling = {
	},
	Enfeebling_HighMP = {	
	},
	
	
	
	DebuffMND = {
		Head = 'Traveler\'s Hat',
		Hands = 'Devotee\'s Mitts',
        Ring1 = 'Saintly Ring',
        Ring2 = 'Saintly Ring',
		Back = 'White Cape',
		Legs = 'Custom Slacks',
		Feet = 'Cotton Gaiters',
	},
	DebuffMND_HighMP = {
		Head = 'Traveler\'s Hat',
		Hands = 'Devotee\'s Mitts',
        Ring1 = 'Astral Ring',
        Ring2 = 'Astral Ring',
		Back = 'White Cape',
		Legs = 'Custom Slacks',
		Feet = 'Cotton Gaiters',
	},
	
	DebuffINT = {
		Head = 'Baron\'s Chapeau',
		Hands = 'Custom M Gloves',
        Ring1 = 'Eremite\'s Ring',
        Ring2 = 'Eremite\'s Ring',
		Back = 'Black Cape +1',
		Legs = 'Custom Slacks',
		Feet = 'Custom M Boots',
	},
	DebuffINT_HighMP = {
		Head = 'Baron\'s Chapeau',
		Hands = 'Custom M Gloves',
        Ring1 = 'Astral Ring',
        Ring2 = 'Astral Ring',
		Back = 'Black Cape +1',
		Legs = 'Custom Slacks',
		Feet = 'Custom M Boots',
	},
	
	
	ElementalDebuff = {},

	--Dark sets
	DarkMagic = {
	},
	DarkMagic_HighMP={
	},
	Stun = {
	},	
    Drain = {
	},

	--Nuking sets
    Nuke = {
		Head = 'Baron\'s Chapeau',
		Hands = 'Custom M Gloves',
        Ring1 = 'Eremite\'s Ring',
        Ring2 = 'Eremite\'s Ring',
		Back = 'Black Cape +1',
		Legs = 'Custom Slacks',
		Feet = 'Custom M Boots',
	},
    NukeACC = {
		Neck = 'Elemental Torque',
	},
	Nuke_HighMP = {
		Head = 'Baron\'s Chapeau',
		Hands = 'Custom M Gloves',
        Ring1 = 'Astral Ring',
        Ring2 = 'Astral Ring',
		Back = 'Black Cape +1',
		Legs = 'Custom Slacks',
		Feet = 'Custom M Boots',
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
	},
	Ws_Acc = {},
	Ws_Elemental = {
	},
	Ws_Hybrid = {},
		
	Vorpal_Blade = {
	},
	
	
	Savage_Blade = {},


--Ability sets
	CS = {}, --Used during activation.
	Chainspell = { --Locked to this set while Chainspell is active.
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
	MacroBook = 5; -- The macro book you want for this job. Otherwise set to false.
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
end

profile.OnUnload = function()
    blinclude.Unload();
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
		elseif (blinclude.GetToggle('HighMP') == true) and (mpp >= Settings.HighMPP) then
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
				if (not isTargetTagged()) then
					gFunc.EquipSet(sets.TH);
				end
				
				-- if conquest:GetInsideControl() then
					-- --if inside nation controlled region
				-- end
				-- if conquest:GetOutsideControl() then
					-- --if outside nation controlled region
				-- end
		
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
		
			-- if conquest:GetInsideControl() then
				-- --if inside nation controlled region
			-- end
			-- if conquest:GetOutsideControl() then
				-- --if outside nation controlled region
			-- end
		
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
		local weather = gData.GetEnvironment();
    
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
