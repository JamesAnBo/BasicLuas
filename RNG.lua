--[[
	BasicLuas Ver. 18.3
	By Aesk (with much help from the Ashita discord members)
]]--

local profile = {};

blinclude = gFunc.LoadFile('common\\blinclude.lua');
local rangedTable = gFunc.LoadFile('common\\rangedtypes.lua');
local isTargetTagged = gFunc.LoadFile('common\\isTargetTagged.lua');


--If you change the names here, Make sure to change the weapon sets below to match.
	--DO NOT CHANGE 'Default'
	--if 'One' is changed to 'Dagger'
	--then Weapon_One must be changed to Weapon_Dagger
blinclude.CreateCycle('Weapon', {[1] = 'Default', [2] = 'Apollo', [3] = 'Fransisca', [4] = 'Fire'});
blinclude.CreateCycle('Ranged', {[1] = 'Default', [2] = 'Damage', [3] = 'Delay'});
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
	Weapon_Default = {--Put your idle weapon in here, or leave this blank if you don't want a default idle weapon.
	}; 
	
--Weapons to cycle through
	Weapon_Apollo = {
		Main = 'Apollo\'s Staff',
	},
	Weapon_Fransisca = {
		Main = 'Fransisca',
	},
	Weapon_Fire = {
		Main = 'Fire Staff',
	},
	
	Weapon_Resting = {--This will equip while resting if weapon mode is 'Default'.
		-- Main = 'Dark staff',
		-- Sub = '';
	},
	
--Ranged weapons to cycle through
	Ranged_Default = {
	};
	Ranged_Damage = {
		Range = 'Othinus\' Bow'
	};
	Ranged_Delay = {
		Range = 'Machine Crossbow'
	};
	
--Ammos to cycle through
	Ammo_Ws = {
		Ammo = 'Darksteel Bolt'
	},
	Ammo_Unlimited = {	--Used for regular shots and Weaponskills if Unlimited Shot is active.
		Ammo = 'Darksteel Bolt' --Irn.Msk. Bolt
	},

	--Crossbow
	Ammo_Default = {-- Put your default crossbow ammo here. Or leave it blank to allow manual ammo changing while on default mode.
		--Ammo = 'Crossbow Bolt'
	},
	Ammo_Acid = {
		Ammo = 'Acid Bolt'
	},
	Ammo_Bloody = {
		Ammo = 'Bloody Bolt'
	},
	Ammo_Sleep = {
		Ammo = 'Sleep Bolt'
	},
	Ammo_Blind = {
		Ammo = 'Blind Bolt'
	},
	Ammo_Holy = {
		Ammo = 'Holy Bolt'
	},
	Ammo_Darksteel = {
		Ammo = 'Darksteel Bolt'
	},

	--Bow
	Ammo_Arrow = {
		--Ammo = 'Wooden Arrow'
	},
		
	--Gun
	Ammo_Bullet = {
		--Ammo = 'Silver Bullet'
	},
	
	--Cannon
	Ammo_Shell = {--Only used with Culverin or Culverin +1
		--Ammo = 'Cannon Shell'
	},
	
	--No ranged weapon
	Ammo_NoRanged = {
		-- Range = '',
		-- Ammo = 'Bomb Core',
	},

--Idle sets
	
    Idle_Default = {
	    Head = 'Optical Hat',
        Neck = 'Faith Torque',
        Ear1 = 'Drone Earring',
        Ear2 = 'Drone Earring',
        Body = 'Kirin\'s Osode',
        Hands = 'Seiryu\'s Kote',
        Ring1 = 'Tamas Ring',
        Ring2 = 'Merman\'s Ring',
        Back = 'Amemet Mantle +1',
        Waist = 'Ryl.Kgt. Belt',
        Legs = 'Hunter\'s Braccae',
        Feet = 'Suzaku\'s Sune-Ate',
		--If you want to idle with a weapon, put the weapon in Weapon_Default above.
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
    Tp_Default = {
	    Head = 'Optical Hat',
        Neck = 'Faith Torque',
        Ear1 = 'Drone Earring',
        Ear2 = 'Drone Earring',
        Body = 'Kirin\'s Osode',
        Hands = 'Seiryu\'s Kote',
        Ring1 = 'Tamas Ring',
        Ring2 = 'Merman\'s Ring',
        Back = 'Amemet Mantle +1',
        Waist = 'Ryl.Kgt. Belt',
        Legs = 'Hunter\'s Braccae',
        Feet = 'Suzaku\'s Sune-Ate',
		},
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
    Preshot_FlurryI = {},
	Preshot_FlurryII = {},
    Midshot = {},
	Midshot_Acc = {        
		Head = 'Optical Hat',
        Neck = 'Ranger\'s Necklace',
        Ear1 = 'Drone Earring',
        Ear2 = 'Drone Earring',
        Body = 'Hunter\'s Jerkin',
        Hands = 'Seiryu\'s Kote',
        Ring1 = 'Coral Ring',
        Ring2 = 'Merman\'s Ring',
        Back = 'Amemet Mantle +1',
        Waist = 'Ryl.Kgt. Belt',
        Legs = 'Hunter\'s Braccae',
        Feet = 'Hunter\'s Socks',
		},
	BarrageOn = { --Equipped during midshot when barrage active.
        Head = 'Optical Hat',
        Neck = 'Ranger\'s Necklace',
        Ear1 = 'Drone Earring',
        Ear2 = 'Drone Earring',
        Body = 'Hunter\'s Jerkin',
        Hands = 'Seiryu\'s Kote',
        Ring1 = 'Coral Ring',
        Ring2 = 'Merman\'s Ring',
        Back = 'Amemet Mantle +1',
        Waist = 'Ryl.Kgt. Belt',
        Legs = 'Hunter\'s Braccae',
        Feet = 'Hunter\'s Socks',
		},
	BarrageOn_Acc = {};
	
--Weaponskill sets
    Ws_Default = {
        Head = 'Wyvern Helm',
        Neck = 'Faith Torque',
        Ear1 = 'Drone Earring',
        Ear2 = 'Drone Earring',
        Body = 'Kirin\'s Osode',
        Hands = 'Seiryu\'s Kote',
        Ring1 = 'Coral Ring',
        Ring2 = 'Merman\'s Ring',
        Back = 'Amemet Mantle +1',
        Waist = 'Ryl.Kgt. Belt',
        Legs = 'Hunter\'s Braccae',
        Feet = 'Hunter\'s Socks',
		},
	Ws_Acc = {},
	Ws_Elemental = {},
	Ws_Hybrid = {},
    Slug_Shot = {--AGI:70% (STR>AGI) 1-hit Acc Light/Aqua/Breeze
	},
	Heavy_Shot = {--AGI:70% 1-hit Crit Light/Flame
	},
	Detonator = {--AGI:70% (STR>AGI) 1-hit fTP: 1.50/2.00/2.50 Light/Flame
	},
	Sidewinder = {--STR:20% AGI:50% 1-hit Acc Light/Aqua/Breeze
	},
	Arching_Arrow = {--STR:20% AGI:50% Crit Light/Flame
	},
	Empyreal_Arrow = {--STR:20 AGI:50 1-hit fTP: 2.00/2.75/3.00 Light/Flame
	},
	
--Ability sets
	--Equipped for activation only
	Sharpshot = {
		Legs = 'Hunter\'s Braccae', --R.Acc +10
	},
    Scavenge = {
		Feet = 'Hunter\'s Socks',
	},
	Shadowbind = {
		Hands = 'Hunter\'s Bracers',
	},
	Camouflage = {
		Body = 'Hunter\'s Jerkin',
	},
	Barrage = {
	},
	
--Other sets
    TH = {},
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
	LockstyleSet = 2; -- Your chosen lockstyleset or set to 0 for just '/lockstyle on'.
	
	Macros = true; -- set to true for macro book and macro set changes on load/sj change.
	MacroBook = 2; -- The macro book you want for this job. Otherwise set to false.
	MacroSets = { --  ['SubJob'] = MacroSet# (set to 0 for no change). DO NOT change the numbers in the [].
		[1] = 0, --WAR
		[2] = 0, --MNK
		[3] = 0, --WHM
		[4] = 0, --BLM
		[5] = 0, --RDM
		[6] = 0, --THF
		[7] = 0, --PLD
		[8] = 0, --DRK
		[9] = 0, --BST
		[10] = 0, --BRD
		[11] = 0, --RNG
		[12] = 0, --SAM
		[13] = 0, --NIN
		[14] = 0, --DRG
		[15] = 0, --SMN
	};
	
	CurrentSubJob = 0;--DO NOT CHANGE. Keep this at 0.
};

profile.Packer = {};

function CheckAmmo()
	if (blinclude.GetCycle('Ammo') == 'Unknown') or (blinclude.GetCycle('Ammo') == nil) then
		return
	end
	
	local ammo = gData.GetEquipment().Ammo;
	local setammo = sets['Ammo_'..blinclude.GetCycle('Ammo')].Ammo;
	
	if (blinclude.GetCycle('Ammo') ~= 'Default') then
		if (ammo ~= nil) then
			if (ammo.Name ~= setammo) then
				print(chat.header('BasicLuas'):append(chat.warning('WARNING: Ammo Equipped: ['..ammo.Name..'] // Ammo Mode: ['..blinclude.GetCycle('Ammo')..']')));
			end
		else
			print(chat.header('BasicLuas'):append(chat.warning('WARNING: No ammo equipped')));
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

function GetRangedType()
	local equip = gData.GetEquipment();
	local rangedType;
	if (equip.Range ~= nil) then
		rangedType = rangedTable[equip.Range.Item.Id];
	end
	return rangedType
end

function CreateAmmoCycle()
	if (GetRangedType() ~= 'crossbow') then
		blinclude.CreateCycle('Ammo', {});
	else
		blinclude.CreateCycle('Ammo', {[1] = 'Default', [2] = 'Acid', [3] = 'Bloody', [4] = 'Sleep', [5] = 'Blind', [6] = 'Holy', [7] = 'Darksteel'});
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
	gSettings.AllowSyncEquip = false;
	
    blinclude.Initialize();
	CreateAmmoCycle:once(1)
	SetLockstyle:once(2);
	SetMacros:once(3);

    blconfig.settings.RefreshGearMPP = 35;
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
	local equip = gData.GetEquipment();
	local player = gData.GetPlayer();
		
	if (player.Status ~= 'Resting') then
		if (blinclude.GetCycle('Weapon') ~= 'Default') then 
			gFunc.EquipSet('Weapon_' .. blinclude.GetCycle('Weapon'))
		else
			gFunc.EquipSet(sets.Weapon_Default)
		end
		if (blinclude.GetCycle('Ranged') ~= 'Default') then 
			gFunc.EquipSet('Ranged_' .. blinclude.GetCycle('Ranged'))
		else
			gFunc.EquipSet(sets.Ranged_Default)
		end
	end
	
	if (GetRangedType() == 'crossbow') then
		if (blinclude.GetCycle('Ammo') == 'Unknown') or (blinclude.GetCycle('Ammo') == nil) then
			CreateAmmoCycle();
		elseif (blinclude.GetCycle('Ammo') ~= 'Default') then
			gFunc.EquipSet('Ammo_' .. blinclude.GetCycle('Ammo'))
		else
			gFunc.EquipSet(sets.Ammo_Default)
		end;
	elseif (GetRangedType() == 'bow') then
		CreateAmmoCycle();
		gFunc.EquipSet(sets.Ammo_Arrow)
	elseif (GetRangedType() == 'gun') then
		CreateAmmoCycle();
		gFunc.EquipSet(sets.Ammo_Bullet)
	elseif (GetRangedType() == 'cannon') then
		CreateAmmoCycle();
		gFunc.EquipSet(sets.Ammo_Shell)
	elseif (equip.Range == nil) then
		gFunc.EquipSet(sets.Ammo_NoRanged);
	else
		CreateAmmoCycle();
	end
	
    if (player.Status == 'Engaged') then
        gFunc.EquipSet(sets.Tp_Default)
		
		if blinclude.GetCycle('TpSet') == 'Acc' then
			gFunc.EquipSet(sets.Tp_Acc)
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
	
    blinclude.CheckDefault();
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
		if string.match(ability.Name, 'Scavenge') then 
			gFunc.EquipSet(sets.Scavenge);
		elseif string.match(ability.Name, 'Shadowbind') then 
			gFunc.EquipSet(sets.Shadowbind) 
		elseif string.match(ability.Name, 'Camouflage') then 
			gFunc.EquipSet(sets.Camouflage) 
		elseif string.match(ability.Name, 'Sharpshot') then 
			gFunc.EquipSet(sets.Sharpshot) 
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
	local LimitedAmmo = T{'Cmb.Cst. Arrow','T.K. Arrow','Ptr.Prt. Arrow','Irn.Msk. Bolt','Gld.Msk. Bolt','Heavy Shell'};
    local flurryI = gData.GetBuffCount(265);
    local flurryII = gData.GetBuffCount(581);
	local unlimitedshot = gData.GetBuffCount('Unlimited Shot');
	local barrage = gData.GetBuffCount('Barrage');
	local ammo = gData.GetEquipment().Ammo;
	
	
	if (ammo ~= nil) and (unlimitedshot <= 0) and (LimitedAmmo:contains(ammo.Name)) then
		print(chat.header('BasicLuas'):append(chat.warning(ammo.Name..' is equipped without Unlimited shot. Canceled shot.')));
		gFunc.CancelAction();
		
	else
		local id, cnt = get_equipped_item(3);
		if (id ~= nil and cnt ~= nil and GetRangedType()) then
			if (cnt == 10) or (cnt == 5) or (cnt == 1) then
				print(chat.header('BasicLuas'):append(chat.warning('WARNING: '..ammo.Name..' is low. '..tostring(cnt)..' left.')));
			end
		end
		
		CheckAmmo();
		
		gFunc.EquipSet(sets.Preshot);
		
		
		if (unlimitedshot > 0) then
			gFunc.EquipSet(sets.Ammo_Unlimited);
		end
		
		if (barrage > 0) then
			gFunc.EquipSet(sets.Ammo_Darksteel);
		end
		
		if flurryII > 0 then
			gFunc.EquipSet(sets.Preshot_FlurryII);
		elseif flurryI > 0 then
			gFunc.EquipSet(sets.Preshot_FlurryI);
		end
	end
end

profile.HandleMidshot = function()
    local barrage = gData.GetBuffCount('Barrage');
	local sharpshot = gData.GetBuffCount('Sharpshot');
	local player = gData.GetPlayer();
	local ammo = gData.GetEquipment().Ammo;
	
    gFunc.EquipSet(sets.Midshot);
	
	if (blinclude.GetCycle('TpSet') == 'Acc') then
		gFunc.EquipSet(sets.Midshot_Acc);
	end

    if barrage > 0 then --ensure acc as base if barrage up
        gFunc.EquipSet(sets.BarrageOn);
    end
	
	if string.match(ammo.Name, 'Holy Bolt') then
		if (player.MPP <= 50) then
			gFunc.Equip('Neck', 'Uggalepih Pendant')
		end
	end
	
	if (blinclude.GetCycle('TH') ~= 'none') then gFunc.EquipSet(sets.TH) end
end

profile.HandleWeaponskill = function()
	local LimitedAmmo = T{'Cmb.Cst. Arrow','T.K. Arrow','Ptr.Prt. Arrow','Irn.Msk. Bolt','Gld.Msk. Bolt','Heavy Shell'};
	local player = gData.GetPlayer();
	local ws = gData.GetAction();
	local unlimitedshot = gData.GetBuffCount('Unlimited Shot');
	local ammo = gData.GetEquipment().Ammo;
    local canWS = blinclude.CheckWsBailout();
	
    if (unlimitedshot <= 0) and (LimitedAmmo:contains(ammo.Name)) and (blinclude.DistanceWS:contains(ws.Name)) then
		print(chat.header('BasicLuas'):append(chat.warning(ammo.Name..' is equipped without Unlimited shot. Canceled WS.')));
		gFunc.CancelAction()
		return;
		
    elseif (canWS == false) then 
		gFunc.CancelAction()
		return;
	else
        gFunc.EquipSet(sets.Ws_Default)
		
		if (blinclude.GetCycle('TpSet') == 'Acc') then
			gFunc.EquipSet(sets.Ws_Acc);
		end
        
		if (unlimitedshot > 0) then
			gFunc.EquipSet(sets.Ammo_Unlimited);
		else
			gFunc.EquipSet(sets.Ammo_Ws);
		end
		
        if string.match(ws.Name, 'Slug Shot') then
            gFunc.EquipSet(sets.Slug_Shot)
		elseif string.match(ws.Name, 'Heavy Shot') then
            gFunc.EquipSet(sets.Heavy_Shot)
		elseif string.match(ws.Name, 'Detonator') then
            gFunc.EquipSet(sets.Detonator)
		elseif string.match(ws.Name, 'Sidewinder') then
            gFunc.EquipSet(sets.Sidewinder)
		elseif string.match(ws.Name, 'Arching Arrow') then
            gFunc.EquipSet(sets.Arching_Arrow)
		elseif string.match(ws.Name, 'Empyreal Arrow') then
            gFunc.EquipSet(sets.Empyreal_Arrow)
		elseif (blinclude.elementalWS:contains(ws.Name)) then
			gFunc.EquipSet(sets.Ws_Elemental)
			if (player.MPP <= 50) then
				gFunc.Equip('Neck', 'Uggalepih Pendant')
			end
		elseif (blinclude.hybridWS:contains(ws.Name)) then
			gFunc.EquipSet(sets.Ws_Hybrid)
			if (string.match(ws.Name, 'Hot Shot') or string.match(ws.Name, 'Flaming Arrow')) then
				if (weather.WeatherElement == 'Fire') or (weather.DayElement == 'Fire') then
					obiLib:Evaluate(0.1);
				end
			end
			if (player.MPP <= 50) then
				gFunc.Equip('Neck', 'Uggalepih Pendant')
			end
		end
    end
end

return profile;
