--[[
	BasicLuas Ver. 18.2
	By Aesk (with much help from the Ashita discord members)
]]--
local profile = {};

blinclude = gFunc.LoadFile('common\\blinclude.lua');
local isTargetTagged = gFunc.LoadFile('common\\isTargetTagged.lua');

--If you change the names here, Make sure to change the weapon sets below to match.
	--DO NOT CHANGE 'Default'
	--if 'One' is changed to 'Dagger'
	--then Weapon_One must be changed to Weapon_Dagger
blinclude.CreateCycle('Weapon', {[1] = 'Default', [2] = 'One', [3] = 'Two'});

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
	Weapon_Default = {}; --Put your idle weapon in here, or leave this blank if you don't want a default idle weapon.
	
--Weapons to cycle through
	Weapon_One = {
		Main = 'Oak Staff',
	},
	Weapon_Two = {
		Main = 'Bronze Axe',
		Sub = 'Maple Shield'
	},
	Weapon_Resting = {--This will equip while resting if weapon mode is 'Default'.
		--Main = 'Dark staff',
		--Sub = '';
	},

--Idle sets
	
    Idle_Default = {--If you want to idle with a weapon, put the weapon in Weapon_Default above.
	},
    Resting = { --If you use a weapon for resting, put the weapon in Weapon_Resting.
	},
    Idle_Regen = {},
    Idle_Refresh = {},
	Idle_Defense = {},
    Town = {},

--Defense sets
	Dt = {},

--Engaged sets
    Tp_Default = {},
	Tp_Acc = {},

--Precast sets (Fast Cast + Casting time reduction)
	--Put your total Fast Cast in the settings below.
    Precast = {},

--Midcast sets (Magic Attack Bonus / Cure Potency / Skill+ / etc.)
	--Obis will automatically equip for nukes if you have them in the right weather/day.
    Cure = {},
	Cursna = {},
    Enhancing = {},
    Enfeebling = {},
    Drain = {},
    Nuke = {},
	
--Ranged sets
	--Put your total Snapshot in the settings below.
    Preshot = {},
    Midshot = {},
	
--Weaponskill sets
    Ws_Default = {},
	Ws_Acc = {},
	Ws_Default_SA = {},
    Raging_Fists = {--STR:30% DEX:30% 5-hit fTP: 1.00/2/20/3.70 Thunder
	},
	Howling_Fist = {--STR:40% VIT:40% fTP: 2.05/3.58/5.70 Light/Thunder
	},
	Howling_Fist_SA = {
	},
	Dragon_Kick = {--STR:50% DEX:50% fTP: 2.00/2.75/3.50 Breeze/Thunder
	},
	Dragon_Kick_SA = {
	},
	Asuran_Fists = {--STR:20% VIT:20% 8-hit Acc Shadow/Soil/Flame
	},
	
--Ability Sets
    Boost = {},
	Focus = {},
	Dodge = {},
	Chakra = {},
	ChiBlast = {},
	
--Stance sets
	Counterstance = {},
	Footwork = {},
	
--Other sets
    TH = {--/th will force this set to equip for 10 seconds
	},
    Movement = {},
	
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
	FastCast = (0 + 0); -- Your total Fast Cast (Traits + Gear in precast)
	Snapshot = (0 + 0); -- Your total Snapshot (Traits + Gear in preshot)
	
	Lockstyle = true; -- set to true for lockstyle on load/sj change. Otherwise set to false.
	LockstyleSet = 0; -- Your chosen lockstyleset or set to 0 for just '/lockstyle on'.
	
	Macros = true; -- set to true for macro book and macro set changes on load/sj change.
	MacroBook = 2; -- The macro book you want for this job. Otherwise set to false.
	MacroSets = { --  ['SubJob'] = MacroSet# (set to 0 for no change). DO NOT change the numbers in the [].
		[1] = 1, --WAR
		[2] = 0, --MNK
		[3] = 0, --WHM
		[4] = 0, --BLM
		[5] = 0, --RDM
		[6] = 2, --THF
		[7] = 0, --PLD
		[8] = 0, --DRK
		[9] = 0, --BST
		[10] = 0, --BRD
		[11] = 0, --RNG
		[12] = 0, --SAM
		[13] = 3, --NIN
		[14] = 4, --DRG
		[15] = 0, --SMN
	};
	
	CurrentSubJob = 0;--DO NOT CHANGE. Keep this at 0.
};

profile.Packer = {};

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

profile.OnLoad = function()
	gSettings.AllowAddSet = true;
	gSettings.AllowSyncEquip = false;
	
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
	UpdateSubJob()
    local counterstance = gData.GetBuffCount('Counterstance');
	local footwork = gData.GetBuffCount('footwork');
	local game = gData.GetEnvironment();
    local player = gData.GetPlayer();
	
	if (player.Status ~= 'Resting') then
		if (blinclude.GetCycle('Weapon') ~= 'Default') then 
			gFunc.EquipSet('Weapon_' .. blinclude.GetCycle('Weapon'))
		else
			gFunc.EquipSet(sets.Weapon_Default)
		end
	end
    
    if (player.Status == 'Engaged') then
        gFunc.EquipSet(sets.Tp_Default);
		
		if blinclude.GetCycle('TpSet') == 'Acc' then
			gFunc.EquipSet(sets.Tp_Acc)
		end
		
        if (counterstance >= 1) then gFunc.EquipSet(sets.Counterstance) end
		if (footwork >= 1) then gFunc.EquipSet(sets.Footwork) end
		if (blinclude.GetCycle('TH') ~= 'none') then
			if (blinclude.GetCycle('TH') == 'Tag') then 
				if (not isTargetTagged()) then
					gFunc.EquipSet(sets.TH);
				end
			elseif (blinclude.GetCycle('TH') == 'Fulltime') then
				gFunc.EquipSet(sets.TH);
			end
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
		if string.match(ability.Name, 'Provoke') then 
			gFunc.EquipSet(sets.Enmity)
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
    gFunc.EquipSet(sets.Precast);

    blinclude.CheckCancels();
end

profile.HandleMidcast = function()
	local player = AshitaCore:GetMemoryManager():GetPlayer();
    local weather = gData.GetEnvironment();
    local spell = gData.GetAction();

	if (spell.Skill == 'Enfeebling Magic') then
		gFunc.EquipSet(sets.Enfeebling);
    elseif (spell.Skill == 'Elemental Magic') then
        gFunc.EquipSet(sets.Nuke);
		if (spell.Element == weather.WeatherElement) or (spell.Element == weather.DayElement) then
			obiLib:Evaluate(0.1);
		end
    elseif (spell.Skill == 'Dark Magic') then
		if (string.contains(spell.Name, 'Aspir') or string.contains(spell.Name, 'Drain')) then
			gFunc.EquipSet(sets.Drain);
        end
	elseif (spell.Skill == 'Healing Magic') then
		gFunc.EquipSet(sets.Cure);
    elseif (spell.Skill == 'Enhancing Magic') then
        gFunc.EquipSet(sets.Enhancing);
    end
	if (blinclude.GetCycle('TH') ~= 'none') then gFunc.EquipSet(sets.TH) end
end

profile.HandlePreshot = function()
	gSettings.Snapshot = Settings.Snapshot
    gFunc.EquipSet(sets.Preshot);
end

profile.HandleMidshot = function()
    gFunc.EquipSet(sets.Midshot);
	if (blinclude.GetCycle('TH') ~= 'none') then gFunc.EquipSet(sets.TH) end
end

profile.HandleWeaponskill = function()
    local canWS = blinclude.CheckWsBailout();
    if (canWS == false) then
		gFunc.CancelAction()
		return;
    else
        local ws = gData.GetAction();
        local sa = gData.GetBuffCount('Sneak Attack');
    
        gFunc.EquipSet(sets.Ws_Default)
		
		if (blinclude.GetCycle('TpSet') == 'Acc') then
			gFunc.EquipSet(sets.Ws_Acc);
		end
		
        if (sa >= 1) then
            gFunc.EquipSet(sets.Ws_Default_SA);
        end

	    if string.match(ws.Name, 'Ragin Fists') then
            gFunc.EquipSet(sets.Raging_Fists)
	    elseif string.match(ws.Name, 'Howling Fist') then
            gFunc.EquipSet(sets.Howling_Fist)
			if (sa >= 1) then
				gFunc.EquipSet(sets.Howling_Fist_SA)
			end
	    elseif string.match(ws.Name, 'Dragon Kick') then
            gFunc.EquipSet(sets.Dragon_Kick)
			if (sa >= 1) then
				gFunc.EquipSet(sets.Dragon_Kick_SA)
			end
	    elseif string.match(ws.Name, 'Asuran Fists') then
            gFunc.EquipSet(sets.Asuran_Fists)
        end
    end
end

return profile;
