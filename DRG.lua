--[[
	BasicLuas Ver. 18.5
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

    Idle_Default_Priority = {--If you want to idle with a weapon, put the weapon in Weapon_Default above.
		Ammo = {'Bomb Core', 'Balm Sachet', 'Happy Egg'},
        Head = {'Optical Hat', 'Walkure Mask', 'Mrc.Cpt. Headgear','Beetle Mask +1'},
        Neck = {'Peacock Amulet', 'Spike Necklace'},
        Ear1 = {'Coral Earring','Spike Earring','Beetle Earring +1'},
        Ear2 = {'Coral Earring','Spike Earring','Beetle Earring +1'},
        Body = {'Scp. Harness +1','Brigandine','Mrc.Cpt. Doublet','Bettle Harness +1'},
		Hands = {'Battle Gloves'},
		Ring1 = {'Rajas Ring', 'Balance Ring'},
		Ring2 = {'Sniper\'s Ring','Balance Ring'},
        Back = {'Amemet Mantle +1','Wolf Mantle +1','Rabbit Mantle'},
        Waist = {'Warwolf Belt','Swift Belt','Life Belt','Tilt Belt','Brave Belt'},
        Legs = {'Drachen Brais','Republic Subligar'},
        Feet = {'Federation Gaiters','Ctr. Greaves'},
	},
    Resting = { --If you use a weapon for resting, put the weapon in Weapon_Resting.
	},
    Idle_Regen = {},
    Idle_Refresh = {},
	Idle_Defense = {},
    Town = {},
	
--Defense sets
	Dt = {},
	Pet_Dt = {},
	Pet_HP = {},
	
--Engaged sets
    Tp_Default_Priority = {
		Ammo = {'Bomb Core', 'Balm Sachet', 'Happy Egg'},
        Head = {'Optical Hat', 'Walkure Mask', 'Mrc.Cpt. Headgear','Beetle Mask +1'},
        Neck = {'Peacock Amulet', 'Spike Necklace'},
        Ear1 = {'Coral Earring','Spike Earring','Beetle Earring +1'},
        Ear2 = {'Coral Earring','Spike Earring','Beetle Earring +1'},
        Body = {'Scp. Harness +1','Brigandine','Mrc.Cpt. Doublet','Bettle Harness +1'},
		Hands = {'Battle Gloves'},
		Ring1 = {'Rajas Ring', 'Balance Ring'},
		Ring2 = {'Sniper\'s Ring','Balance Ring'},
        Back = {'Amemet Mantle +1','Wolf Mantle +1','Rabbit Mantle'},
        Waist = {'Swift Belt','Life Belt','Tilt Belt','Brave Belt'},
        Legs = {'Republic Subligar'},
        Feet = {'Federation Gaiters','Ctr. Greaves'},
	},
	Tp_Acc = {},
	Tp_Def = {},
	Tp_Eva = {},
	Tp_Night = {
		--Head = 'Vampire Mask',
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
    Midshot = { },

--Weaponskill sets
    Ws_Default_Priority = {
		Ammo = {'Bomb Core', 'Balm Sachet', 'Happy Egg'},
        Head = {'Optical Hat', 'Walkure Mask', 'Mrc.Cpt. Headgear','Beetle Mask +1'},
        Neck = {'Peacock Amulet', 'Spike Necklace'},
        Ear1 = {'Coral Earring','Spike Earring','Beetle Earring +1'},
        Ear2 = {'Coral Earring','Spike Earring','Beetle Earring +1'},
        Body = {'Scp. Harness +1','Brigandine','Mrc.Cpt. Doublet','Bettle Harness +1'},
		Hands = {'Custom M Gloves'},
		Ring1 = {'Rajas Ring', 'Courage Ring'},
		Ring2 = {'Sniper\'s Ring','Courage Ring'},
        Back = {'Amemet Mantle +1','Wolf Mantle +1','Rabbit Mantle'},
        Waist = {'Warwolf Belt','Swift Belt','Life Belt','Tilt Belt','Brave Belt'},
        Legs = {'Republic Subligar'},
        Feet = {'Federation Gaiters','Ctr. Greaves'},
	},
	Ws_Acc = {},
	Ws_Elemental = {},
	Ws_Hybrid = {},
	Ws_Default_SA = {},
    Penta_Thrust = {--STR:20% DEX:20% 5-hit Acc Shadow
	},
	Impulse_Drive = {--STR:100% 2-hit fTP: 1.00/1.50/2.50 Shadow/Soil/Snow
	},
	Impulse_Drive_SA = {
	},

--Ability sets
    All_Jumps_Priority = {
		Ammo = {'Bomb Core', 'Balm Sachet', 'Happy Egg'},
        Head = {'Optical Hat', 'Walkure Mask', 'Mrc.Cpt. Headgear','Beetle Mask +1'},
        Neck = {'Peacock Amulet', 'Spike Necklace'},
        Ear1 = {'Coral Earring','Spike Earring','Beetle Earring +1'},
        Ear2 = {'Coral Earring','Spike Earring','Beetle Earring +1'},
        Body = {'Barone Corazza','Scp. Harness +1','Brigandine','Mrc.Cpt. Doublet','Bettle Harness +1'},
		Hands = {'Custom M Gloves'},
		Ring1 = {'Rajas Ring', 'Courage Ring'},
		Ring2 = {'Sniper\'s Ring','Courage Ring'},
        Back = {'Amemet Mantle +1','Wolf Mantle +1','Rabbit Mantle'},
        Waist = {'Warwolf Belt','Swift Belt','Life Belt','Tilt Belt','Brave Belt'},
        Legs = {'Barone Cosciales','Republic Subligar'},
        Feet = {'Federation Gaiters', 'Ctr. Greaves'},
	},
	Jump_Priority = {
		Feet = {'Drachen Greaves', 'Volans Greaves'},
	},
	High_Jump_Priority = {
		--Legs = {'Wyrm Brais'},
	},
	Angon = {
		Ammo = 'Angon',
	},

--Other sets
	--Drachen Armet is not needed here. It will be equipped on cast with the appropiate subjob when your, or a party member's, HP is low enough.
	Healing_Breath = { --Will be equipped on breath use.
		Head = 'Wyrm Armet',
		Body = 'Wyvern Mail',
		Legs = 'Drachen Brais',
	},
	Steady_Wing = {
		Legs = 'Drachen Brais',
	},
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
    ['export'] = {
        Main = 'Lance +1',
        Ammo = 'Balm Sachet',
        Head = 'Mrc.Cpt. Headgear',
        Neck = 'Peacock Amulet',
        Ear1 = 'Beetle Earring +1',
        Ear2 = 'Beetle Earring +1',
        Body = 'Mrc.Cpt. Doublet',
        Hands = 'Battle Gloves',
        Ring1 = 'Rajas Ring',
        Ring2 = 'Balance Ring',
        Back = 'Wolf Mantle +1',
        Waist = 'Brave Belt',
        Legs = 'Republic Subligar',
        Feet = 'Volans Greaves',
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
	LockstyleSet = 18; -- Your chosen lockstyleset or set to 0 for just '/lockstyle on'.
	
	Macros = true; -- set to true for macro book and macro set changes on load/sj change.
	MacroBook = 14; -- The macro book you want for this job. Otherwise set to false.
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

local function HandlePetAction(PetAction)
	local name = string.sub(PetAction.Name,1,string.len(PetAction.Name)-1);
	
	if string.match(name, 'Healing Breath') then
        gFunc.EquipSet(sets.Healing_Breath);
    end
end

function checkPartyHPP()
	local player = AshitaCore:GetMemoryManager():GetPlayer();
	local party = AshitaCore:GetMemoryManager():GetParty();

	for i = 0, 5 do
	
		local isInZone = party:GetMemberZone(i) == party:GetMemberZone(0);
		local active = party:GetMemberIsActive(i);
		local serverId = party:GetMemberServerId(i)
		
		if (isInZone) and (active == 1) and (serverId ~= 0) then
			if (player:GetSubJob() == 3) or (player:GetSubJob() == 4) or (player:GetSubJob() == 5) or (player:GetSubJob() == 16) then
				if (party:GetMemberHPPercent(i) < 50) then
					return true
				end
			elseif (player:GetSubJob() == 7) or (player:GetSubJob() == 8) or (player:GetSubJob() == 10) or (player:GetSubJob() == 13) then
				if (party:GetMemberHPPercent(i) < 33) then
					return true
				end
			end
		end
	end
end


profile.OnLoad = function()
	gSettings.AllowAddSet = true;
	gSettings.AllowSyncEquip = false;
	
    blinclude.Initialize();
	SetLockstyle:once(2);
	SetMacros:once(3);

    blconfig.settings.RefreshGearMPP = 40;
    --blconfig.settings.PetDTGearHPP = 0;
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
	local game = gData.GetEnvironment();
	local player = gData.GetPlayer();
	local petAction = gData.GetPetAction();
	
	if (player.Status ~= 'Resting') then
		if (blinclude.GetCycle('Weapon') ~= 'Default') then 
			gFunc.EquipSet('Weapon_' .. blinclude.GetCycle('Weapon'))
		else
			gFunc.EquipSet(sets.Weapon_Default)
		end
	end
	
	if (petAction ~= nil) then
        HandlePetAction(petAction);
        return;
    end
	
    if (player.Status == 'Engaged') then
		gFunc.EquipSet(sets.Tp_Default)
		
		if (blinclude.GetCycle('TpSet') ~= 'Default') then 
			gFunc.EquipSet('Tp_' .. blinclude.GetCycle('TpSet'))
		end
		
		if (game.Time < 6.00) or (game.Time > 18.00) then
			gFunc.EquipSet(sets.Tp_Night)
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
		if (string.contains(ability.Name, 'Jump')) then
			gFunc.EquipSet(sets.All_Jumps);
			if (string.match(ability.Name, 'Jump')) then
				gFunc.EquipSet(sets.Jump);
			elseif (string.match(ability.Name, 'High Jump')) then
				gFunc.EquipSet(sets.High_Jump);
			end
		elseif string.match(ability.Name, 'Steady Wing') then
			gFunc.EquipSet(sets.Steady_Wing);
		elseif (ability.Name == 'Angon') then
			gFunc.EquipSet(sets.Angon);
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
	if checkPartyHPP() then
		gFunc.Equip('Head', 'Drachen Armet');
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
		local player = gData.GetPlayer();
        local ws = gData.GetAction();
		local weather = gData.GetEnvironment();
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
