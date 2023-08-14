--[[
	BasicLuas Ver. 18.3
	By Aesk (with much help from the Ashita discord members)
]]--

local profile = {};

blinclude = gFunc.LoadFile('common\\blinclude.lua');
local rangedTable = gFunc.LoadFile('common\\rangedtypes.lua');
local isTargetTagged = gFunc.LoadFile('common\\isTargetTagged.lua');

--If you change the names here, Make sure to change the weapon/ammo sets below to match.
	--DO NOT CHANGE 'Default'
	--if 'Great_Axe' is changed to 'Dagger'
	--then Weapon_Great_Axe must be changed to Weapon_Dagger
blinclude.CreateCycle('Weapon', {[1] = 'Default', [2] = 'Great_Axe', [3] = 'Polearm', [4] = 'Axe_Axe', [5] = 'Axe_Sword'});


--[[

Example_Set = {
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
        Back = { 'Amemet Mantle +1', 'Rabbit Mantle' },
        Waist = { 'Warrior\'s Belt +1' },
        Legs = { 'Byakko\'s Haidate', 'Ryl.Kgt. Breeches', 'Republic Subligar' },
        Feet = { 'Fighter\'s Calligae', 'Ctr. Greaves' },
},

]]--

local sets = {
	Weapon_Default = {}; --Put your idle weapon in here, or leave this blank if you don't want a default idle weapon.
	
--Weapons to cycle through
	Weapon_Great_Axe_Priority = {
		Main = {'Byakko\'s Axe','Gigant Axe'}
	},
	Weapon_Polearm_Priority = {
		Main = 'Couse',
	},
	-- Weapon_Great_Sword_Priority = {
		-- Main = 'Skofnung',
	-- },
	Weapon_Axe_Axe_Priority = {
		Main = {'Martial Axe','Tungi'},
		Sub = {'Maneater', 'Tungi','Viking Axe'}
	},
	Weapon_Axe_Sword_Priority = {
			Main = {'Maneater','Tungi'},
			Sub = {'Joyeuse', 'Tungi','Viking Axe'}
		},
	
	Weapon_Resting = {--This will equip while resting if weapon mode is 'Default'.
		--Main = 'Dark staff',
		--Sub = '';
	},
	
--Ammos to cycle through
	--Crossbow
	Ammo_Default = {-- Put your default crossbow ammo here. Or leave it blank to allow manual ammo changing while on default mode.
		--Ammo = 'Crossbow Bolt'
	},
	Ammo_Holy = {
		Ammo = 'Holy Bolt'
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
	
	Ammo_Arrow = {
		--Ammo = 'Wooden Arrow'
	},
	
	Ammo_NoRanged_Priority = {
		Range = '',
		Ammo = { 'Bomb Core', 'Balm Sachet' }
	},

--Idle sets
    Idle_Default_Priority = {--If you want to idle with a weapon, put the weapon in Weapon_Default above.
		Head = { 'Genbu\'s Kabuto','Optical Hat', 'Celata', 'Fighter\'s Mask', 'Centurion\'s Visor' },
        Neck = { 'Fortitude Torque', 'Peacock Amulet', 'Spike Necklace' },
        Ear1 = { 'Bushinomimi', 'Coral Earring','Beetle Earring +1' },
        Ear2 = { 'Coral Earring','Beetle Earring +1' },
        Body = { 'Kirin\'s Osode', 'Haubergeon', 'Ryl.Kgt. Chainmail', 'Brigandine', 'Ryl.Sqr. Chainmail', 'Ctr. Scale Mail' },
        Hands = { 'Seiryu\'s Kote', 'Thick Mufflers', 'Fighter\'s Mufflers', 'Custom M Gloves' },
        Ring1 = { 'Rajas Ring', 'Balance Ring' },
		Ring2 = { 'Sniper\'s Ring', 'Bastokan Ring' },
        Back = { 'Amemet Mantle +1', 'Rabbit Mantle' },
        Waist = { 'Warwolf Belt','Warrior\'s Belt +1' },
        Legs = { 'Byakko\'s Haidate', 'Ryl.Kgt. Breeches', 'Republic Subligar' },
        Feet = { 'Suzaku\'s Sune-Ate', 'Fighter\'s Calligae','Irn.Msk. Sabatons', 'Ctr. Greaves' },
    },
    Resting_Priority = {--If you use a weapon for resting, put the weapon in Weapon_Resting.
	},
    Idle_Regen_Priority = {},
    Idle_Refresh_Priority = {},
	Idle_Defense_Priority = {},
    Town_Priority = {},

--Defense sets
	Dt_Priority = {
        Head = 'Genbu\'s Kabuto',
        Neck = 'Fortitude Torque',
        Ear1 = 'Bushinomimi',
        Ear2 = 'Coral Earring',
        Body = 'Kirin\'s Osode',
        Hands = 'Seiryu\'s Kote',
        Ring1 = 'Rajas Ring',
		Ring2 = 'Bomb Queen Ring',
        Back = 'Amemet Mantle +1',
        Waist = 'Warwolf Belt',
        Legs = 'Byakko\'s Haidate',
        Feet = 'Suzaku\'s Sune-Ate',
    },

--Engaged sets
    Tp_Default_Priority = {
		
		Head = { 'Optical Hat', 'Celata', 'Fighter\'s Mask', 'Centurion\'s Visor' },
        Neck = { 'Fortitude Torque','Peacock Amulet', 'Spike Necklace' },
        Ear1 = { 'Bushinomimi', 'Coral Earring', 'Beetle Earring +1' },
        Ear2 = { 'Coral Earring','Beetle Earring +1' },
        Body = { 'Haubergeon', 'Ryl.Kgt. Chainmail', 'Brigandine', 'Ryl.Sqr. Chainmail', 'Ctr. Scale Mail' },
        Hands = { 'Dusk Gloves', 'Thick Mufflers', 'Custom M Gloves' },
        Ring1 = { 'Rajas Ring', 'Balance Ring' },
		Ring2 = { 'Sniper\'s Ring', 'Balance Ring' },
        Back = { 'Amemet Mantle +1', 'Rabbit Mantle' },
        Waist = { 'Swift Belt','Life Belt', 'Tilt Belt', 'Brave Belt' },
        Legs = { 'Byakko\'s Haidate', 'Fighter\'s Cuisses', 'Republic Subligar' },
        Feet = { 'Fighter\'s Calligae','Irn.Msk. Sabatons', 'Ctr. Greaves' },
    },
	Tp_Acc_Priority = {
		Neck = 'Peacock Amulet',
		Waist = 'Warrior\'s Stone',
	},

--Precast sets (Fast Cast + Casting time reduction)
	--Put your total Fast Cast in the settings below.
    Precast_Priority = {},

--Midcast sets (Magic Attack Bonus / Cure Potency / Skill+ / etc.)
	--Obis will automatically equip for nukes if you have them in the right weather/day.
    Cure_Priority = {},
	Cursna_Priority = {},
    Enhancing_Priority = {},
    Enfeebling_Priority = {},
    Drain_Priority = {},
    Nuke_Priority = {},
	
--Ranged sets
	--Put your total Snapshot in the settings below.
    Preshot_Priority = {},
    Midshot_Priority = {
		Head = 'Optical Hat',
		Neck = 'Peacock Amulet',
		Body = 'Kirin\'s Osode',
		Hands = 'Seiryu\'s Kote',
		Ring1 = 'Coral Ring',
		Ring2 = 'Coral Ring',
		Feet = 'Irn.Msk. Sabatons'
	},
	
--Weaponskill sets
    Ws_Default_Priority = {
        Head = {'Optical Hat'},
        Neck = {'Peacock Amulet'},
        Ear1 = {'Bushinomimi'},
        Ear2 = {'Coral Earring'},
        Body = {'Hecatomb Harness', 'Haubergeon'},
        Hands = {'Thick Mufflers'},
        Ring1 = {'Rajas Ring'},
        Ring2 = {'Sniper\'s Ring'},
        Back =  {'Amemet Mantle +1'},
        Waist = { 'Warwolf Belt', 'Life Belt' },
        Legs = {'Byakko\'s Haidate'},
		Feet = {'Hct. Leggings'}
	},
	Ws_Acc_Priority = {
		Waist = 'Warrior\'s Stone',
	},
	Ws_Elemental_Priority = {},
	Ws_Hybrid_Priority = {},
	Ws_Default_SA_Priority = {
		Body = 'Kirin\'s Osode',
	},
    Penta_Thrust_Priority = {--STR:20% DEX:20% 5-hit Acc Shadow
	},
	Impulse_Drive_Priority = {--STR:100% 2-hit fTP: 1.00/1.50/2.50 Shadow/Soil/Snow
	},
	Impulse_Drive_SA_Priority = {
        Head = 'Celata',
        Neck = 'Spike Necklace',
        Body = 'Kirin\'s Osode',
        Hands = 'Fighter\'s Mufflers',
        Ring2 = 'Courage Ring',
	},
	Ground_Strike_Priority = {--STR:50% INT:50% 1-hit fTP 1.50/1.75/3.00 Breeze/Thunder/Aqua/Snow
	},
	Ground_Strike_SA_Priority = {
        Head = 'Wyvern Helm',
        Neck = 'Spike Necklace',
        Body = 'Kirin\'s Osode',
        Hands = 'Fighter\'s Mufflers',
        Ring2 = 'Courage Ring',
	},
	Rampage_Priority = {--STR:50% 5-hit Crit Soil
		Waist = 'Warrior\'s Stone',
	},
	Decimation_Priority = {--STR:50% 3-hit Acc Flame/Light/Aqua
		Waist = 'Warrior\'s Stone',
		Ring2 = 'Flame Ring',
	},
	Raging_Rush_Priority = {--STR:50% 3-hit Crit Aqua/Snow
		Neck = 'Fortitude Torque',
		Waist = 'Warrior\'s Stone',
	},
    Steel_Cyclone_Priority = {--STR:60% VIT60% 1-hit fTP: 1.50/1.75/3.00 Breeze/Aqua/Snow
        Head = 'Genbu\'s Kabuto',
		Neck = 'Fortitude Torque',
        Body = 'Kirin\'s Osode',
        Hands = 'Fighter\'s Mufflers',
		Ring2 = 'Flame Ring',
    },
	Steel_Cyclone_SA_Priority = {
        Head = 'Genbu\'s Kabuto',
        Neck = 'Fortitude Torque',
        Body = 'Kirin\'s Osode',
        Hands = 'Fighter\'s Mufflers',
        Ring2 = 'Flame Ring',
    },
	
--Ability Sets
    Tomahawk = {
        Ammo = 'Thr. Tomahawk',
	},
	Provoke_Priority = {--Emnity stuff
		Head = 'Fighter\'s Mask',
		Body = 'Fighter\'s Lorica',
		Hands = 'Fighter\'s Mufflers',
		Waist = 'Warwolf Belt',
		Legs = 'Fighter\'s Cuisses',
		Feet = 'Fighter\'s Calligae',
	},
    Warcry = {
		Head = 'Warrior\'s Mask',
	},
    Aggressor = {},
    Defender = {},
    Berserk = {},
	
--Other sets
    TH = {--/th will force this set to equip for 10 seconds
		--Head = 'Dream Hat +1',
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
        Hands = 'Dusk Gloves',
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
	MacroBook = 1; -- The macro book you want for this job. Otherwise set to false.
	MacroSets = { --  ['SubJob'] = MacroSet# (set to 0 for no change). DO NOT change the numbers in the [].
		[1] = 0, --WAR
		[2] = 0, --MNK
		[3] = 0, --WHM
		[4] = 0, --BLM
		[5] = 0, --RDM
		[6] = 1, --THF
		[7] = 0, --PLD
		[8] = 0, --DRK
		[9] = 0, --BST
		[10] = 0, --BRD
		[11] = 0, --RNG
		[12] = 2, --SAM
		[13] = 3, --NIN
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
		blinclude.CreateCycle('Ammo', {[1] = 'Default', [2] = 'Acid', [3] = 'Bloody', [4] = 'Sleep', [5] = 'Blind', [6] = 'Holy'});
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
	SetMacros:once(2);
	SetLockstyle:once(3);
	
    blconfig.settings.RegenGearHPP = 65;
    blconfig.settings.RefreshGearMPP = 40;
	
	
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
	elseif (equip.Range == nil) and (blinclude.GetCycle('Ammo') == 'Default') then
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
		if ability.Name == 'Tomahawk' then gFunc.EquipSet(sets.Tomahawk);
		elseif ability.Name == 'Provoke' then gFunc.EquipSet(sets.Provoke);
		elseif ability.Name == 'Berserk' then gFunc.EquipSet(sets.Berserk);
		elseif ability.Name == 'Aggressor' then gFunc.EquipSet(sets.Aggressor);
		elseif ability.Name == 'Warcry' then gFunc.EquipSet(sets.Warcry);
		elseif ability.Name == 'Defender' then gFunc.EquipSet(sets.Defender);
		end;
	end

    blinclude.CheckCancels();
end

profile.HandleItem = function()
    local item = gData.GetAction();

	if string.match(item.Name, 'Holy Water') then gFunc.EquipSet(blsets.Holy_Water) end
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
		if (spell.MppAftercast <= 50) then
			gFunc.Equip('Neck', 'Uggalepih Pendant')
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
	local ammo = gData.GetEquipment().Ammo;
	
	if (ammo ~= nil) and (LimitedAmmo:contains(ammo.Name)) then
		print(chat.header('BasicLuas'):append(chat.warning('WARNING: '..ammo.Name..' is equipped.')));
	else
		local id, cnt = get_equipped_item(3);
		if (id ~= nil and cnt ~= nil and GetRangedType()) then
			if (cnt == 10) or (cnt == 5) or (cnt == 1) then
				print(chat.header('BasicLuas'):append(chat.warning('WARNING: '..ammo.Name..' is low. '..tostring(cnt)..' left.')));
			end
		end
	end
	CheckAmmo();
	gFunc.EquipSet(sets.Preshot);
end

profile.HandleMidshot = function()
	local ammo = gData.GetEquipment().Ammo;
	
    gFunc.EquipSet(sets.Midshot);
	
	if (blinclude.GetCycle('TH') ~= 'none') then gFunc.EquipSet(sets.TH) end
end

profile.HandleWeaponskill = function()
    local canWS = blinclude.CheckWsBailout();

    if (canWS == false) then 
		gFunc.CancelAction()
		return;
    else
		local player = gData.GetPlayer();
		local ws = gData.GetAction();
        local sa = gData.GetBuffCount('Sneak Attack');
    
        gFunc.EquipSet(sets.Ws_Default)
		
		if (blinclude.GetCycle('TpSet') == 'Acc') then
			gFunc.EquipSet(sets.Ws_Acc);
		end
		
        if (sa >= 1) then
            gFunc.EquipSet(sets.Ws_Default_SA);
        end
    
        if string.match(ws.Name, 'Penta Thrust') then
            gFunc.EquipSet(sets.Penta_Thrust)
        elseif string.match(ws.Name, 'Impulse Drive') then
            gFunc.EquipSet(sets.Impulse_Drive)
			if (sa >= 1) then
				gFunc.EquipSet(sets.Impulse_Drive_SA)
			end
        elseif string.match(ws.Name, 'Ground Strike') then
            gFunc.EquipSet(sets.Ground_Strike)
			if (sa >= 1) then
				gFunc.EquipSet(sets.Ground_Strike_SA)
			end
        elseif string.match(ws.Name, 'Smash Axe') then
            gFunc.EquipSet(sets.Smash_Axe)
        elseif string.match(ws.Name, 'Rampage') then
            gFunc.EquipSet(sets.Rampage)
        elseif string.match(ws.Name, 'Rampage') then
            gFunc.EquipSet(sets.Rampage)
        elseif string.match(ws.Name, 'Decimation') then
            gFunc.EquipSet(sets.Decimation)
        elseif string.match(ws.Name, 'Raging Rush') then
            gFunc.EquipSet(sets.Raging_Rush)
		elseif string.match(ws.Name, 'Steel Cyclone') then
            gFunc.EquipSet(sets.Steel_Cyclone)
			if (sa >= 1) then
				gFunc.EquipSet(sets.Steel_Cyclone_SA)
			end
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
