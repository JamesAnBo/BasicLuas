--[[
	BasicLuas Ver. 18.6
	By Aesk (with much help from the Ashita discord members)
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
		-- Main = 'Dark staff',
		-- Sub = '';
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
	
	Ammo_Arrow = {
		-- Ammo = 'Wooden Arrow'
	},
	
	Ammo_NoRanged = {
		-- Range = '',
		-- Ammo = 'Bomb Core',
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
	Tp_Def = {},
	Tp_Eva = {},

--Precast sets (Fast Cast + Casting time reduction)
	--Put your total Fast Cast in the settings below.
    Precast = {},
    Cure_Precast = {},
    Enhancing_Precast = {},
    Stoneskin_Precast = {},

--Midcast sets (Magic Attack Bonus / Cure Potency / Skill+ / etc.)
	--Obis will automatically equip for nukes if you have them in the right weather/day.
	--Healing sets
    Cure = {},
    Cursna = {},

	--Enhancing sets
    Enhancing = {},
	Dread_Spikes = {},
	Spikes = {},

	--Enfeebling sets
    Enfeebling = {},
	DebuffMND = {},
	DebuffINT = {},
	ElementalDebuff = {},

	--Dark sets
	DarkMagic = {},
    Drain = {},

	--Nuking sets
    Nuke = {},

--Ranged sets
	--Put your total Snapshot in the settings below.
    Preshot = {},
    Midshot = {},

--Weaponskill sets
    Ws_Default = {},
	Ws_Acc = {},
	Ws_Elemental = {},
	Ws_Hybrid = {},
	Ws_Default_SA = {},
	Sickle_Moon ={--STR:40% AGI:40% 2-hit fTP: 1.50/2.00/2.75 Soil/Thunder
	},
	Sickle_Moon_SA ={
	},
	Ground_Strike = {--STR:50% INT:50% 1-hit fTP 1.50/1.75/3.00 Breeze/Thunder/Aqua/Snow
	},
	Ground_Strike_SA = {
	},
	Guillotine = {--STR:30% MND:50% 4-hit Silence Snow
	},
	Spiral_Hell = {--STR:50% INT:50% 1-hit fTP 1.375/1.875/3.625 Soil/Aqua/Snow
	},
	Spiral_Hell_SA = {},


--Ability sets
    BloodWeapon = {},
	LastResort = {},
	
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
	FastCast = (0 + 0); -- Your total Fast Cast (Traits + Gear in precast)
	Snapshot = (0 + 0); -- Your total Snapshot (Traits + Gear in preshot)
	
	Lockstyle = true; -- set to true for lockstyle on load/sj change. Otherwise set to false.
	LockstyleSet = 0; -- Your chosen lockstyleset or set to 0 for just '/lockstyle on'.
	
	Macros = true; -- set to true for macro book and macro set changes on load/sj change.
	MacroBook = 8; -- The macro book you want for this job. Otherwise set to false.
	MacroSets = { --  ['SubJob'] = MacroSet# (set to 0 for no change). DO NOT change the numbers in the [].
		[1] = 4, --WAR
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
		if (mySub ~= nil) then
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
	CreateAmmoCycle:once(1);
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
	local equip = gData.GetEquipment();
	local player = gData.GetPlayer();
	local spikes = gData.GetBuffCount('Dread Spikes');
		
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
	elseif (equip.Range == nil) then
		gFunc.EquipSet(sets.Ammo_NoRanged);
	else
		CreateAmmoCycle();
	end
	
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
	
    if spikes ~= 0 then gFunc.EquipSet(sets.Spikes) end

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
		if string.match(ability.Name, 'Blood Weapon') then
			gFunc.EquipSet(sets.BloodWeapon);
		elseif string.match(ability.Name, 'Last Resort') then
			gFunc.EquipSet(sets.LastResort);
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
	local MndDebuffs = T{ 'Slow', 'Slow II', 'Paralyze', 'Paralyze II', 'Addle', 'Addle II'};
    local ElementalDebuffs = T{ 'Burn', 'Rasp', 'Drown', 'Choke', 'Frost', 'Shock' };
	local player = AshitaCore:GetMemoryManager():GetPlayer();
    local weather = gData.GetEnvironment();
    local spell = gData.GetAction();

	if (spell.Skill == 'Enfeebling Magic') then
		gFunc.EquipSet(sets.Enfeebling);
        if (MndDebuffs:contains(spell.Name)) then
            gFunc.EquipSet(sets.DebuffMND);
        else
            gFunc.EquipSet(sets.DebuffINT);
        end
		--gFunc.Equip('main', blsets.ElementalStaffTable[spell.Element]);
    elseif (spell.Skill == 'Elemental Magic') then
        if (ElementalDebuffs:contains(spell.Name)) then
            gFunc.EquipSet(sets.ElementalDebuff);
        else
            gFunc.EquipSet(sets.Nuke);
			if (spell.Element == weather.WeatherElement) or (spell.Element == weather.DayElement) then
				obiLib:Evaluate(0.1);
			end
        end
		if (spell.MppAftercast <= 50) then
			gFunc.Equip('Neck', 'Uggalepih Pendant')
		end
		--gFunc.Equip('main', blsets.ElementalStaffTable[spell.Element]);
    elseif (spell.Skill == 'Dark Magic') then
		gFunc.EquipSet(sets.DarkMagic);
        if (spell.Name == 'Stun') then
            gFunc.EquipSet(sets.Stun);
		elseif (string.contains(spell.Name, 'Aspir') or string.contains(spell.Name, 'Drain')) then
			gFunc.EquipSet(sets.Drain);
        elseif (string.match(spell.Name, 'Dread Spikes')) then
            gFunc.EquipSet(sets.Dread_Spikes);
        end
		--gFunc.Equip('main', blsets.ElementalStaffTable[spell.Element]);
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
			if (cnt <= 10) then
				print(chat.header('BasicLuas'):append(chat.warning('WARNING: '..ammo.Name..' is low. '..tostring(cnt-1)..' left.')));
			end
		end
	end
	CheckAmmo();
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
        
        if string.match(ws.Name, 'Sickle Moon') then
            gFunc.EquipSet(sets.Sickle_Moon)
        elseif string.match(ws.Name, 'Ground Strike') then
            gFunc.EquipSet(sets.Ground_Strike)
			if (sa >= 1) then
				gFunc.EquipSet(sets.Ground_Strike_SA)
			end
        elseif string.match(ws.Name, 'Guillotine') then
            gFunc.EquipSet(sets.Guillotine)
		elseif string.match(ws.Name, 'Spiral Hell') then
            gFunc.EquipSet(sets.Spiral_Hell)
			if (sa >= 1) then
				gFunc.EquipSet(sets.Spiral_Hell_SA)
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
