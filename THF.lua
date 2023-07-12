--[[
	BasicLuas Ver. 18.0
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
--Ammos to cycle through
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
	
	--Bow
	Ammo_Arrow = {
		--Ammo = 'Wooden Arrow'
	},
		
	--Gun
	Ammo_Bullet = {
	},
	
	--Cannon
	Ammo_Shell = {
	},
	
	--No ranged weapon
	Ammo_NoRanged = {
		-- Range = '',
		-- Ammo = 'Bomb Core',
	},
	
	Weapon_Resting = {--This will equip while resting if weapon mode is 'Default'.
		-- Main = 'Dark staff',
		-- Sub = '';
	},

--Idle sets
	
    Idle_Default = {--If you want to idle with a weapon, put the weapon in Weapon_Default above.
		Head = 'Optical Hat',
		Neck = 'Nanaa\'s Charm',
		Ear1 = 'Coral Earring',
		Ear2 = 'Coral Earring',
		Body = 'Rapparee Harness',
		Hands = 'War Gloves +1',
		Ring1 = 'Spinel Ring',
		Ring2 = 'Spinel Ring',
		Back = 'Amemet Mantle',
		Waist = 'Life Belt',
		Legs = 'Rogue\'s Culottes',
		Feet = 'Rogue\'s Poulaines',
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
		Neck = 'Nanaa\'s Charm',
		Ear1 = 'Coral Earring',
		Ear2 = 'Coral Earring',
		Body = 'Rapparee Harness',
		Hands = 'War Gloves +1',
		Ring1 = 'Spinel Ring',
		Ring2 = 'Spinel Ring',
		Back = 'Amemet Mantle',
		Waist = 'Life Belt',
		Legs = 'Rogue\'s Culottes',
		Feet = 'Rogue\'s Poulaines',
	},

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
    Ws_Default = {
		Hands = 'Hecatomb Mittens',
		Feet = 'Hct. Leggings', 
	},
    Ws_Default_SA = {
		Hands = 'Hecatomb Mittens',
		Feet = 'Hct. Leggings', 
	},
    Ws_Default_TA = {
		Hands = 'Hecatomb Mittens',
		Feet = 'Hct. Leggings', 
	},
    Ws_Default_SATA = {
		Hands = 'Hecatomb Mittens',
		Feet = 'Hct. Leggings', 
	},
    Dancing_Edge = {
		Body = 'Scorpion Harness',
	},
    Dancing_Edge_SA = {
		Body = 'Scorpion Harness',
	},
    Dancing_Edge_TA = {
		Body = 'Scorpion Harness',
	},
    Dancing_Edge_SATA = {
		Body = 'Scorpion Harness',
	},
    Evisceration = {
		Body = 'Scorpion Harness',
	},
    Evisceration_SA = {
		Body = 'Scorpion Harness',
	},
    Evisceration_TA = {
		Body = 'Scorpion Harness',
	},
    Evisceration_SATA = {
		Body = 'Scorpion Harness',
	},

--Ability sets
    SATA = {
		Hands = 'Hecatomb Mittens',
		Feet = 'Hct. Leggings', 
	},
    SA = {
		Hands = 'Hecatomb Mittens',
		Feet = 'Hct. Leggings', 
	},
    TA = {
		Hands = 'Hecatomb Mittens',
		Feet = 'Hct. Leggings', 
	},
	Flee = {
		Feet = 'Rogue\'s Poulaines',
	},
	Hide = {
		Body = 'Rogue\'s Vest',
	},
	Steal = {
		Head = 'Rogue\'s bonnet',
		Hands = 'Thief\'s Kote',
	},
	Mug = {},

--Other sets
    TH = {
		Neck = 'Nanaa\'s Charm',
		Hands = 'Assassin\'s Armlets'
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
	MacroBook = 6; -- The macro book you want for this job. Otherwise set to false.
	MacroSets = { --  ['SubJob'] = MacroSet# (set to 0 for no change). DO NOT change the numbers in the [].
		[1] = 2, --WAR
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
		[13] = 1, --NIN
		[14] = 0, --DRG
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
	local player = gData.GetPlayer();
	
	if (player.Status ~= 'Resting') then
		if (blinclude.GetCycle('Weapon') ~= 'Default') then 
			gFunc.EquipSet('Weapon_' .. blinclude.GetCycle('Weapon'))
		else
			gFunc.EquipSet(sets.Weapon_Default)
		end
	end
	if not GetRangedType() then
		gFunc.EquipSet(sets.Ammo_NoRanged);
	elseif (GetRangedType() == 'crossbow') then
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
	else
		CreateAmmoCycle();
	end

    if (player.Status == 'Engaged') then
        gFunc.EquipSet(sets.Tp_Default)
		
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
	
	local sa = gData.GetBuffCount('Sneak Attack');
	local ta = gData.GetBuffCount('Trick Attack');
	
	if (sa >= 1) and (ta >= 1) then
		gFunc.EquipSet(sets.SATA);
	elseif (sa >= 1) then
		gFunc.EquipSet(sets.SA);
	elseif (ta >= 1) then
		gFunc.EquipSet(sets.TA);
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
		if string.match(ability.Name, 'Flee') then
			gFunc.EquipSet(sets.Flee);
		elseif string.match(ability.Name, 'Hide') then
			gFunc.EquipSet(sets.Hide);
		elseif string.match(ability.Name, 'Steal') then
			gFunc.EquipSet(sets.Steal);
		elseif string.match(ability.Name, 'Mug') then
			gFunc.EquipSet(sets.Mug);
		end
	end

    blinclude.CheckCancels();
end

profile.HandleItem = function()
    local item = gData.GetAction();

	if string.match(item.Name, 'Holy Water') then gFunc.EquipSet(blsets.setss.Holy_Water) end
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
		if (string.contains(spell.Name, 'Aspir')) or (string.contains(spell.Name, 'Drain')) then
			gFunc.EquipSet(sets.Drain);
        end
	elseif (spell.Skill == 'Healing Magic') then
		gFunc.EquipSet(sets.Cure);
		if string.match(spell.Name, 'Cursna') then
			gFunc.EquipSet(sets.Cursna);
		end
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
    gFunc.EquipSet(sets.Preshot);
end

profile.HandleMidshot = function()
    gFunc.EquipSet(sets.Midshot);
    
    if (blinclude.GetCycle('TH') ~= 'none') then gFunc.EquipSet(sets.TH) end
end

profile.HandleWeaponskill = function()
    local canWS = blinclude.CheckWsBailout();
    if (canWS == false) then gFunc.CancelAction() return;
    else
        local ws = gData.GetAction();
        local sa = gData.GetBuffCount('Sneak Attack');
        local ta = gData.GetBuffCount('Trick Attack');
    
        gFunc.EquipSet(sets.Ws_Default)
        if (sa >= 1) and (ta >= 1) then
            gFunc.EquipSet(sets.Ws_Default_SATA);
        elseif (sa >= 1) then
            gFunc.EquipSet(sets.Ws_Default_SA);
        elseif (ta >= 1) then
            gFunc.EquipSet(sets.Ws_Default_TA);
        end
        if string.match(ws.Name, 'Dancing Edge') then
			gFunc.EquipSet(sets.Dancing_Edge)
            if (sa >= 1) and (ta >= 1) then
                gFunc.EquipSet(sets.Dancing_Edge_SATA);
            elseif (sa >= 1) then
                gFunc.EquipSet(sets.Dancing_Edge_SA);
            elseif (ta >= 1) then
                gFunc.EquipSet(sets.Dancing_Edge_TA);
            end
        elseif string.match(ws.Name, 'Evisceration') then
            gFunc.EquipSet(sets.Evisceration)
            if (sa >= 1) and (ta >= 1) then
                gFunc.EquipSet(sets.Evisceration_SATA);
            elseif (sa >= 1) then
                gFunc.EquipSet(sets.Evisceration_SA);
            elseif (ta >= 1) then
                gFunc.EquipSet(sets.Evisceration_TA);
            end
        end
    end
end

return profile;
