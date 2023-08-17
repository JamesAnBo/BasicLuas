--BasicLuas Ver. 18.3
--By Aesk (with much help from the Ashita discord members)

--[[

	WARNING: DO NOT MAKE CHANGES HERE UNLESS YOU KNOW WHAT YOU ARE DOING.
	
	See blconfig.lua, blsets.lua, and blkeybinds.lua in the common folder for editable options, universal gear sets, and universal keybinds. 
	
	Thank You
		GetAwayCoxn, from whom I took most of this code from. (sorry!)
		Thorny, for luashitacast and many many other things.
		Will, for the isTargetTagged lua, among other things.
	
]]--

local blinclude = T{};

blkeybinds = gFunc.LoadFile('common\\blkeybinds.lua');
blconfig = gFunc.LoadFile('common\\blconfig.lua');
blsets = gFunc.LoadFile('common\\blsets.lua');
obiLib = gFunc.LoadFile('common\\obis.lua');


blinclude.AliasList = T{'blmessages','wsdistance','dt','th','kite','tpset','idleset','weapon','ranged','ammo','weaponlock','wlock','disable','modes','bldrain','nukeset','burst','elecycle','nuke','fight', 'sir','tankset','pupmode','tpgun','cormsg','forcestring','warpme','xpring','rrset','craftset','fishset','helmset','zeniset','showswaps','testcheck','highmp','bldebug','jacancel','jac'};
blinclude.Towns = T{'Tavnazian Safehold','Al Zahbi','Aht Urhgan Whitegate','Nashmau','Southern San d\'Oria [S]','Bastok Markets [S]','Windurst Waters [S]','San d\'Oria-Jeuno Airship','Bastok-Jeuno Airship','Windurst-Jeuno Airship','Kazham-Jeuno Airship','Southern San d\'Oria','Northern San d\'Oria','Port San d\'Oria','Chateau d\'Oraguille','Bastok Mines','Bastok Markets','Port Bastok','Metalworks','Windurst Waters','Windurst Walls','Port Windurst','Windurst Woods','Heavens Tower','Ru\'Lude Gardens','Upper Jeuno','Lower Jeuno','Port Jeuno','Rabao','Selbina','Mhaura','Kazham','Norg','Mog Garden','Celennia Memorial Library','Western Adoulin','Eastern Adoulin'};
blinclude.LockingRings = T{'Echad Ring', 'Trizek Ring', 'Endorsement Ring', 'Return Ring', 'Homing Ring', 'Warp Ring','Facility Ring','Dim. Ring (Dem)','Dim. Ring (Mea)','Dim. Ring (Holla)','Altep Ring','Dem Ring','Holla Ring','Mea Ring','Vahzl Ring','Yhoat Ring'};
blinclude.LockingWeapons = T{'Warp Cudgel', 'Treat Staff II', 'Trick Staff II'};
blinclude.DistanceWS = T{'Flaming Arrow','Piercing Arrow','Dulling Arrow','Sidewinder','Blast Arrow','Arching Arrow','Empyreal Arrow','Refulgent Arrow','Apex Arrow','Namas Arrow','Jishnu\'s Randiance','Hot Shot','Split Shot','Sniper Shot','Slug Shot','Blast Shot','Heavy Shot','Detonator','Numbing Shot','Last Stand','Coronach','Wildfire','Trueflight','Leaden Salute','Myrkr','Dagan','Moonlight','Starlight'};
blinclude.elementalWS = T{'Gust Slash','Cyclone','Aeolian Edge','Burning Blade','Red Lotus Blade','Shining Blade','Seraph Blade','Sanguine Blade','Frostbite','Freezebite','Herculean Slash','Cloudspltter','Primal Rend','Dark Harvest','Shadow of Death','Infernal Scythe','Thunder Thrust','Raiden Thrust','Blade: Ei','Blade: Yu','Shining Strike','Seraph Strike','Flash Nova','Rock Crusher','Earth Crusher','Starburst','Sunburst','Cataclysm','Vidohunir','Garland of Bliss','Omniscience','Wildfire','Trueflight','Leaden Salute'};
blinclude.hybridWS = T{'Blade: Teki','Blade: To','Blade: Chi','Tachi: Goten','Tachi: Kagero','Tachi: Jinpu','Tachi: Koki','Flaming Arrow','Hot Shot'};
blinclude.BstPetAttack = T{'Foot Kick','Whirl Claws','Big Scissors','Tail Blow','Blockhead','Sensilla Blades','Tegmina Buffet','Lamb Chop','Sheep Charge','Pentapeck','Recoil Dive','Frogkick','Queasyshroom','Numbshroom','Shakeshroom','Nimble Snap','Cyclotail','Somersault','Tickling Tendrils','Sweeping Gouge','Grapple','Double Claw','Spinning Top','Suction','Tortoise Stomp','Power Attack','Rhino Attack','Razor Fang','Claw Cyclone','Crossthrash','Scythe Tail','Ripper Fang','Chomp Rush','Pecking Flurry','Sickle Slash','Mandibular Bite','Wing Slap','Beak Lunge','Head Butt','Wild Oats','Needle Shot','Disembowel','Extirpating Salvo','Mega Scissors','Back Heel','Hoof Volley','Fluid Toss','Fluid Spread'};
blinclude.BstPetMagicAttack = T{'Gloom Spray','Fireball','Acid Spray','Molting Plumage','Cursed Sphere','Nectarous Deluge','Charged Whisker','Nepenthic Plunge'};
blinclude.BstPetMagicAccuracy = T{'Toxic Spit','Acid Spray','Leaf Dagger','Venom Spray','Venom','Dark Spore','Sandblast','Dust Cloud','Stink Bomb','Slug Family','Intimidate','Gloeosuccus','Spider Web','Filamented Hold','Choke Breath','Blaster','Snow Cloud','Roar','Palsy Pollen','Spore','Brain Crush','Choke Breath','Silence Gas','Chaotic Eye','Sheep Song','Soporific','Predatory Glare','Sudden Lunge','Numbing Noise','Jettatura','Bubble Shower','Spoil','Scream','Noisome Powder','Acid Mist','Rhinowrecker','Swooping Frenzy','Venom Shower','Corrosive Ooze','Spiral Spin','Infrasonics','Hi-Freq Field','Purulent Ooze','Foul Waters','Sandpit','Infected Leech','Pestilent Plume'};
blinclude.SmnSkill = T{'Shining Ruby','Glittering Ruby','Crimson Howl','Inferno Howl','Frost Armor','Crystal Blessing','Aerial Armor','Hastega II','Fleet Wind','Hastega','Earthen Ward','Earthen Armor','Rolling Thunder','Lightning Armor','Soothing Current','Ecliptic Growl','Heavenward Howl','Ecliptic Howl','Noctoshield','Dream Shroud','Altana\'s Favor','Reraise','Reraise II','Reraise III','Raise','Raise II','Raise III','Wind\'s Blessing'};
blinclude.SmnMagical = T{'Searing Light','Meteorite','Holy Mist','Inferno','Fire II','Fire IV','Meteor Strike','Conflag Strike','Diamond Dust','Blizzard II','Blizzard IV','Heavenly Strike','Aerial Blast','Aero II','Aero IV','Wind Blade','Earthen Fury','Stone II','Stone IV','Geocrush','Judgement Bolt','Thunder II','Thunder IV','Thunderstorm','Thunderspark','Tidal Wave','Water II','Water IV','Grand Fall','Howling Moon','Lunar Bay','Ruinous Omen','Somnolence','Nether Blast','Night Terror','Level ? Holy'};
blinclude.SmnHealing = T{'Healing Ruby','Healing Ruby II','Whispering Wind','Spring Water'};
blinclude.SmnHybrid = T{'Flaming Crush','Burning Strike'};
blinclude.SmnEnfeebling = T{'Diamond Storm','Sleepga','Shock Squall','Slowga','Tidal Roar','Pavor Nocturnus','Ultimate Terror','Nightmare','Mewing Lullaby','Eerie Eye'};
blinclude.BluMagPhys = T{'Foot Kick','Sprout Smack','Wild Oats','Power Attack','Queasyshroom','Battle Dance','Feather Storm','Helldive','Bludgeon','Claw Cyclone','Screwdriver','Grand Slam','Smite of Rage','Pinecone Bomb','Jet Stream','Uppercut','Terror Touch','Mandibular Bite','Sickle Slash','Dimensional Death','Spiral Spin','Death Scissors','Seedspray','Body Slam','Hydro Shot','Frenetic Rip','Spinal Cleave','Hysteric Barrage','Asuran Claws','Cannonball','Disseverment','Ram Charge','Vertical Cleave','Final Sting','Goblin Rush','Vanity Dive','Whirl of Rage','Benthic Typhoon','Quad. Continuum','Empty Thrash','Delta Thrust','Heavy Strike','Quadrastrike','Tourbillion','Amorphic Spikes','Barbed Crescent','Bilgestorm','Bloodrake','Glutinous Dart','Paralyzing Triad','Thrashing Assault','Sinker Drill','Sweeping Gouge','Saurian Slide'};
blinclude.BluMagDebuff = T{'Filamented Hold','Cimicine Discharge','Demoralizing Roar','Venom Shell','Light of Penance','Sandspray','Auroral Drape','Frightful Roar','Enervation','Infrasonics','Lowing','CMain Wave','Awful Eye','Voracious Trunk','Sheep Song','Soporific','Yawn','Dream Flower','Chaotic Eye','Sound Blast','Blank Gaze','Stinking Gas','Geist Wall','Feather Tickle','Reaving Wind','Mortal Ray','Absolute Terror','Blistering Roar','Cruel Joke'};
blinclude.BluMagStun = T{'Head Butt','Frypan','Tail Slap','Sub-zero Smash','Sudden Lunge'};
blinclude.BluMagBuff = T{'Cocoon','Refueling','Feather Barrier','Memento Mori','Zephyr Mantle','Warm-Up','Amplification','Triumphant Roar','Saline Coat','Reactor Cool','Plasma Charge','Regeneration','Animating Wail','Battery Charge','Winds of Promy.','Barrier Tusk','Orcish Counterstance','Pyric Bulwark','Nat. Meditation','Restoral','Erratic Flutter','Carcharian Verve','Harden Shell','Mighty Guard'};
blinclude.BluMagSkill = T{'Metallic Body','Diamondhide','Magic Barrier','Occultation','Atra. Libations'};
blinclude.BluMagDiffus = T{'Erratic Flutter','Carcharian Verve','Harden Shell','Mighty Guard'};
blinclude.BluMagCure = T{'Pollen','Healing Breeze','Wild Carrot','Magic Fruit','Plenilune Embrace'};
blinclude.BluMagEnmity = T{'Actinic Burst','Exuviation','Fantod','Jettatura','Temporal Shift'};
blinclude.BluMagTH = T{'Actinic Burst','Dream Flower','Subduction'};
blinclude.Elements = T{'Thunder', 'Blizzard', 'Fire', 'Stone', 'Aero', 'Water', 'Light', 'Dark'};
blinclude.NinNukes = T{'Katon: Ichi', 'Katon: Ni', 'Katon: San', 'Hyoton: Ichi', 'Hyoton: Ni', 'Hyoton: San', 'Huton: Ichi', 'Huton: Ni', 'Huton: San', 'Doton: Ichi', 'Doton: Ni', 'Doton: San', 'Raiton: Ichi', 'Raiton: Ni', 'Raiton: San', 'Suiton: Ichi', 'Suiton: Ni', 'Suiton: San'};
blinclude.Rolls = T{{'Fighter\'s Roll',5,9}, {'Monk\'s Roll',3,7}, {'Healer\'s Roll',3,7}, {'Corsair\'s Roll',5,9}, {'Ninja Roll',4,8},{'Hunter\'s Roll',4,8}, {'Chaos Roll',4,8}, {'Magus\'s Roll',2,6}, {'Drachen Roll',4,8}, {'Choral Roll',2,6},{'Beast Roll',4,8}, {'Samurai Roll',2,6}, {'Evoker\'s Roll',5,9}, {'Rogue\'s Roll',5,9}, {'Warlock\'s Roll',4,8},
	{'Puppet Roll',3,7}, {'Gallant\'s Roll',3,7}, {'Wizard\'s Roll',5,9}, {'Dancer\'s Roll',3,7}, {'Scholar\'s Roll',2,6},{'Naturalist\'s Roll',3,7}, {'Runeist\'s Roll',4,8}, {'Bolter\'s Roll',3,9}, {'Caster\'s Roll',2,7}, {'Courser\'s Roll',3,9},{'Blitzer\'s Roll',4,9}, {'Tactician\'s Roll',5,8}, {'Allies\' Roll',3,10}, {'Miser\'s Roll',5,7},
	{'Companion\'s Roll',2,10},{'Avenger\'s Roll',4,8},}; -- {name,lucky,unlucky}

CurrentLevel = 0;--DO NOT CHANGE. Keep this at 0.
RRSET = false;
CraftSet = false;
ZeniSet = false;
FishSet = false;
HELMSet = false;
CORmsg = true;
XpRing = false;
Toggles = {};
Cycles = {};
Values = {};

function blinclude.AdvanceCycle(name)
	local ctable = Cycles[name];
	if (type(ctable) ~= 'table') then
		return;
	end
	
	ctable.Index = ctable.Index + 1;
	if (ctable.Index > #ctable.Array) then
		ctable.Index = 1;
	end
end

function blinclude.AdvanceToggle(name)
	if (type(Toggles[name]) ~= 'boolean') then
		return;
	elseif Toggles[name] then
		Toggles[name] = false;
	else
		Toggles[name] = true;
	end
end

function blinclude.CreateToggle(name, default)
	Toggles[name] = default;
end

function blinclude.GetToggle(name)
	if (Toggles[name] ~= nil) then
		return Toggles[name];
	else
		return false;
	end
end

function blinclude.CreateCycle(name, values)
	local newCycle = {
		Index = 1,
		Array = values
	};
	Cycles[name] = newCycle;
end

function blinclude.GetCycle(name)
	local ctable = Cycles[name];
	if (type(ctable) == 'table') then
		return ctable.Array[ctable.Index];
	else
		return 'Unknown';
	end
end

function blinclude.SetCycle(name, item)
	local ctable = Cycles[name];
	if (type(ctable) ~= 'table') then
		return;
	end
	if string.lower(item) == 'reset' then
		ctable.Index = 1;
	elseif type(tonumber(item)) == "number" then
		ctable.Index = tonumber(item);
	else
		for key,value in pairs(ctable.Array) do
			if (string.lower(value) == string.lower(item)) then
				ctable.Index = key;
			end
		end
	end
end



function blinclude.Message(toggle, status)
	if toggle ~= nil and status ~= nil then
		print(chat.header('BasicLuas'):append(chat.message(toggle .. ' is now ' .. tostring(status))))
	end
end

function blinclude.TestCheck(var)
	local player = AshitaCore:GetMemoryManager():GetPlayer();
	local party = AshitaCore:GetMemoryManager():GetParty();
	local weather = gData.GetEnvironment();
	local gear = gData.GetEquipment();
	
			

	print(chat.header('BasicLuas'):append(chat.warning('Test: [Name-'..party:GetMemberName(0)..'] [MaxHP-'..player:GetHPMax()..'] [HPP-'.. party:GetMemberHPPercent(0) ..'] [MaxHP-'..player:GetMPMax()..'] [MPP-'.. party:GetMemberMPPercent(0) ..'] [TP-'.. party:GetMemberTP(0) ..']')));
	print(chat.header('BasicLuas'):append(chat.warning('[Weather Element-'..weather.WeatherElement..'] [Day Element-'.. weather.DayElement ..']')));
end

function blinclude.GetModes()
	local player = gData.GetPlayer();
	if (player.MainJob == 'RDM') then
		print(chat.header('BasicLuas'):append(chat.message('[Disabled: '..tostring(blinclude.GetToggle('Disabled'))..'] [WeaponLock: '..tostring(blinclude.GetToggle('WeaponLock'))..'] [Weapon: '..tostring(blinclude.GetCycle('Weapon'))..'] [IdleSet: '..tostring(blinclude.GetCycle('IdleSet'))..'] [Tpset: '..tostring(blinclude.GetCycle('TpSet'))..'] [NukeSet: '..tostring(blinclude.GetCycle('NukeSet'))..'] [NukeMode: '..tostring(blinclude.GetToggle('Burst'))..'] [Fight: '..tostring(blinclude.GetToggle('Fight'))..'] [TH: '..tostring(blinclude.GetCycle('TH'))..']')));
	elseif (player.MainJob == 'BLM') then
		print(chat.header('BasicLuas'):append(chat.message('[Disabled: '..tostring(blinclude.GetToggle('Disabled'))..'] [WeaponLock: '..tostring(blinclude.GetToggle('WeaponLock'))..'] [Weapon: '..tostring(blinclude.GetCycle('Weapon'))..'] [IdleSet: '..tostring(blinclude.GetCycle('IdleSet'))..'] [Tpset: '..tostring(blinclude.GetCycle('TpSet'))..'] [NukeSet: '..tostring(blinclude.GetCycle('NukeSet'))..'] [NukeMode: '..tostring(blinclude.GetToggle('Burst'))..'] [Element: '..tostring(blinclude.GetCycle('Element'))..'] [TH: '..tostring(blinclude.GetCycle('TH'))..']')));
	elseif (player.MainJob == 'WHM') then
		print(chat.header('BasicLuas'):append(chat.message('[Disabled: '..tostring(blinclude.GetToggle('Disabled'))..'] [WeaponLock: '..tostring(blinclude.GetToggle('WeaponLock'))..'] [Weapon: '..tostring(blinclude.GetCycle('Weapon'))..'] [IdleSet: '..tostring(blinclude.GetCycle('IdleSet'))..'] [Tpset: '..tostring(blinclude.GetCycle('TpSet'))..'] [Fight: '..tostring(blinclude.GetToggle('Fight'))..'] [TH: '..tostring(blinclude.GetCycle('TH'))..']')));
	elseif (player.MainJob == 'BRD') then
		print(chat.header('BasicLuas'):append(chat.message('[Disabled: '..tostring(blinclude.GetToggle('Disabled'))..'] [WeaponLock: '..tostring(blinclude.GetToggle('WeaponLock'))..'] [Weapon: '..tostring(blinclude.GetCycle('Weapon'))..'] [IdleSet: '..tostring(blinclude.GetCycle('IdleSet'))..'] [Tpset: '..tostring(blinclude.GetCycle('TpSet'))..'] [ForceString: '..tostring(blinclude.GetToggle('String'))..'] [Fight: '..tostring(blinclude.GetToggle('Fight'))..'] [TH: '..tostring(blinclude.GetCycle('TH'))..']')));
	elseif (player.MainJob == 'PLD') then
		print(chat.header('BasicLuas'):append(chat.message('[Disabled: '..tostring(blinclude.GetToggle('Disabled'))..'] [WeaponLock: '..tostring(blinclude.GetToggle('WeaponLock'))..'] [Weapon: '..tostring(blinclude.GetCycle('Weapon'))..'] [IdleSet: '..tostring(blinclude.GetCycle('IdleSet'))..'] [Tpset: '..tostring(blinclude.GetCycle('TpSet'))..'] [TankSet: '..tostring(blinclude.GetCycle('TankSet'))..'] [SIR: '..tostring(blinclude.GetToggle('SIR'))..'] [TH: '..tostring(blinclude.GetCycle('TH'))..']')));
	elseif (player.MainJob == 'PUP') then
		print(chat.header('BasicLuas'):append(chat.message('[Disabled: '..tostring(blinclude.GetToggle('Disabled'))..'] [WeaponLock: '..tostring(blinclude.GetToggle('WeaponLock'))..'] [Weapon: '..tostring(blinclude.GetCycle('Weapon'))..'] [IdleSet: '..tostring(blinclude.GetCycle('IdleSet'))..'] [Tpset: '..tostring(blinclude.GetCycle('TpSet'))..'] [PupMode: '..tostring(blinclude.GetCycle('PupMode'))..'] [TH: '..tostring(blinclude.GetCycle('TH'))..']')));
	elseif (player.MainJob == 'COR') then
		print(chat.header('BasicLuas'):append(chat.message('[Disabled: '..tostring(blinclude.GetToggle('Disabled'))..'] [WeaponLock: '..tostring(blinclude.GetToggle('WeaponLock'))..'] [Weapon: '..tostring(blinclude.GetCycle('Weapon'))..'] [IdleSet: '..tostring(blinclude.GetCycle('IdleSet'))..'] [Tpset: '..tostring(blinclude.GetCycle('TpSet'))..'] [TPgun: '..tostring(blinclude.GetToggle('TPgun'))..'] [TH: '..tostring(blinclude.GetCycle('TH'))..']')));
	else
		print(chat.header('BasicLuas'):append(chat.message('[Disabled: '..tostring(blinclude.GetToggle('Disabled'))..'] [WeaponLock: '..tostring(blinclude.GetToggle('WeaponLock'))..'] [Weapon: '..tostring(blinclude.GetCycle('Weapon'))..'] [IdleSet: '..tostring(blinclude.GetCycle('IdleSet'))..'] [Tpset: '..tostring(blinclude.GetCycle('TpSet'))..'] [TH: '..tostring(blinclude.GetCycle('TH'))..']')));
	end
end


function blinclude.SetAlias()
	for _, v in ipairs(blinclude.AliasList) do
		AshitaCore:GetChatManager():QueueCommand(-1, '/alias /' .. v .. ' /lac fwd ' .. v);
	end
end

function blinclude.ClearAlias()
	for _, v in ipairs(blinclude.AliasList) do
		AshitaCore:GetChatManager():QueueCommand(-1, '/alias del /' .. v);
	end
end

function blinclude.SetVariables()
	local player = gData.GetPlayer();

	blinclude.CreateToggle('Disabled', false);
	blinclude.CreateToggle('WeaponLock', false);
	blinclude.CreateToggle('JACancel', true);
	blinclude.CreateToggle('DTset', false);
	blinclude.CreateToggle('Kite', false);
	blinclude.CreateToggle('Debug', false);
	blinclude.CreateToggle('SIR', false);
	blinclude.CreateCycle('TpSet', {[1] = 'Default', [2] = 'Acc', [3] = 'Def'});
	blinclude.CreateCycle('IdleSet', {[1] = 'Default', [2] = 'Defense', [3] = 'Refresh', [4] = 'Regen'});
	if (player.MainJob == 'RDM') or (player.MainJob == 'BLM') then
		blinclude.CreateToggle('HighMP', false);
		blinclude.CreateToggle('Burst', true);
		blinclude.CreateCycle('NukeSet', {[1] = 'Power', [2] = 'Macc',});
		if (player.MainJob == 'BLM') then
			blinclude.CreateCycle('Element', {[1] = 'Thunder', [2] = 'Blizzard', [3] = 'Fire', [4] = 'Stone', [5] = 'Aero', [6] = 'Water', [7] = 'Light', [8] = 'Dark'});
		end
	end
	if (player.MainJob == 'THF') then
		blinclude.CreateCycle('TH', {[1] = 'tag', [2] = 'Fulltime', [3] = 'none'});
	else
		blinclude.CreateCycle('TH', {[1] = 'None', [2] = 'Tag', [3] = 'Fulltime'});
	end
	if (player.MainJob == 'RDM') or (player.MainJob == 'BRD') or (player.MainJob == 'WHM') then
		blinclude.CreateToggle('Fight', false);
	end
	if (player.MainJob == 'PLD') then
		blinclude.CreateCycle('TankSet', {[1] = 'PDT', [2] = 'MDT', [3] = 'MEVA', [4] = 'None'});
	end
	if (player.MainJob == 'PUP') then
		blinclude.CreateCycle('PupMode', {[1] = 'Tank', [2] = 'Melee', [3] = 'Ranger', [4] = 'Mage'});
	end
	if (player.MainJob == 'BRD') then
		blinclude.CreateToggle('String', false);
	end
	if (player.MainJob == 'COR') then
		blinclude.CreateToggle('TPgun', false);
	end
end




function blinclude.SetCommands(args)
	
	if not blinclude.AliasList:contains(args[1]) then
		return
	end
	
	local player = gData.GetPlayer();
	local toggle = nil;
	local status = nil;
	
	if args[1] == 'blmessages' then
		if blconfig.settings.Messages then
			blconfig.settings.Messages = false;
			print(chat.header('BasicLuas'):append(chat.message('Chat messanges are disabled')));
		else
			blconfig.settings.Messages = true;
			print(chat.header('BasicLuas'):append(chat.message('Chat messanges are enabled')));
		end
	elseif args[1] == 'modes' then
		blinclude.GetModes();
	elseif (args[1] == 'wsdistance') then
		if (tonumber(args[2])) then 
			blconfig.settings.WScheck = true;
			blconfig.settings.WSdistance = tonumber(args[2]);
			print(chat.header('BasicLuas'):append(chat.message('WS Distance is on and set to ' .. blconfig.settings.WSdistance)));
		else
			blconfig.settings.WScheck = not blconfig.settings.WScheck;
			print(chat.header('BasicLuas'):append(chat.message('WS distance check is now ' .. tostring(blconfig.settings.WScheck))));
			print(chat.header('BasicLuas'):append(chat.message('Can change WS distance allowed by using /wsdistance ##')));
		end
	elseif (args[1] == 'showswaps') then
		AshitaCore:GetChatManager():QueueCommand(-1, '/lac debug')
	elseif (args[1] == 'testcheck') then
		blinclude.TestCheck();
	elseif (args[1] == 'bldebug') then
		blinclude.AdvanceToggle('Debug');
		toggle = 'Debug';
		status = blinclude.GetToggle('Debug');
	elseif (args[1] == 'jacancel') or (args[1] == 'jac') then
		blinclude.AdvanceToggle('JACancel');
		toggle = 'JACancel';
		status = blinclude.GetToggle('JACancel');
	elseif (args[1] == 'dt') then
		blinclude.AdvanceToggle('DTset');
		toggle = 'DT Set';
		status = blinclude.GetToggle('DTset');
    elseif (args[1] == 'tpset') then
		if (#args > 1) then
			blinclude.SetCycle('TpSet', args[2])
			toggle = 'TP Set';
			status = blinclude.GetCycle('TpSet');
		else
			blinclude.AdvanceCycle('TpSet');
			toggle = 'TP Set';
			status = blinclude.GetCycle('TpSet');
		end
    elseif (args[1] == 'idleset') then
		if (#args > 1) then
			blinclude.SetCycle('IdleSet', args[2])
			toggle = 'Idle Set';
			status = blinclude.GetCycle('IdleSet');
		else
			blinclude.AdvanceCycle('IdleSet');
			toggle = 'Idle Set';
			status = blinclude.GetCycle('IdleSet');
		end
	elseif (args[1] == 'weapon') then
		if (#args > 1) then
			blinclude.SetCycle('Weapon', args[2])
			toggle = 'Weapon';
			status = blinclude.GetCycle('Weapon');
		else
			blinclude.AdvanceCycle('Weapon');
			toggle = 'Weapon';
			status = blinclude.GetCycle('Weapon');
		end
	elseif (args[1] == 'ammo') then
		if (#args > 1) then
			blinclude.SetCycle('Ammo', args[2])
			toggle = 'Ammo';
			status = blinclude.GetCycle('Ammo');
		else
			blinclude.AdvanceCycle('Ammo');
			toggle = 'Ammo';
			status = blinclude.GetCycle('Ammo');
		end
	elseif (args[1] == 'weaponlock') or (args[1] == 'wlock') then
		if (blinclude.GetToggle('Disabled') == false) then
			if (blinclude.GetToggle('WeaponLock') == false) then
				AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable Main');
				AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable Sub');
				AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable Range');
				AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable Ammo');
				blinclude.AdvanceToggle('WeaponLock');
				toggle = 'Weapon Lock';
				status = blinclude.GetToggle('WeaponLock');
			else
				AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable Main');
				AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable Sub');
				AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable Range');
				AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable Ammo');
				blinclude.AdvanceToggle('WeaponLock');
				toggle = 'Weapon Lock';
				status = blinclude.GetToggle('WeaponLock');
			end
		end
	elseif (args[1] == 'sir') then
		blinclude.AdvanceToggle('SIR');
		toggle = 'Spell Interupt Set';
		status = blinclude.GetToggle('SIR');
	elseif (args[1] == 'kite') then
		blinclude.AdvanceToggle('Kite');
		toggle = 'Kite Set';
		status = blinclude.GetToggle('Kite');
	elseif (args[1] == 'th') then
		if (#args > 1) then
			blinclude.SetCycle('TH', args[2])
			toggle = 'TH Mode';
			status = blinclude.GetCycle('TH');
		else
			blinclude.AdvanceCycle('TH');
			toggle = 'TH Mode';
			status = blinclude.GetCycle('TH');
		end
	elseif (args[1] == 'bldrain') then
		blinclude.DoDrain();
	elseif (args[1] == 'warpme') then
		blinclude.UseWarpItem();
	elseif (args[1] == 'xpring') then
		blinclude.XpRing = not blinclude.XpRing;
		toggle = 'XP Ring';
		status = blinclude.XpRing;
	elseif (args[1] == 'rrset') then
		blinclude.RRSET = not blinclude.RRSET;
		toggle = 'Reraise Set';
		status = blinclude.RRSET;
	elseif (args[1] == 'craftset') then
		blinclude.CraftSet = not blinclude.CraftSet;
		toggle = 'Crafting Set';
		status = blinclude.CraftSet;
	elseif (args[1] == 'zeniset') then
		blinclude.ZeniSet = not blinclude.ZeniSet;
		toggle = 'Zeni Pictures Set';
		status = blinclude.ZeniSet;
	elseif (args[1] == 'fishset') then
		blinclude.FishSet = not blinclude.FishSet;
		toggle = 'Fishing Set';
		status = blinclude.FishSet;
	elseif (args[1] == 'helmset') then
		blinclude.HELMSet = not blinclude.HELMSet;
		toggle = 'HELM Set';
		status = blinclude.HELMSet;
    end
	if (args[1] == 'disable') then
		if (blinclude.GetToggle('Disabled') == false) then 
			AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable all')
			blinclude.AdvanceToggle('Disabled');
			toggle = 'Disable Gear Swap';
			status = blinclude.GetToggle('Disabled');
		else
			AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable all')
			blinclude.AdvanceToggle('Disabled');
			toggle = 'Disable Gear Swap';
			status = blinclude.GetToggle('Disabled');
		end
		
	end
	if (player.MainJob == 'RDM') or (player.MainJob == 'BLM') then
		if (args[1] == 'nukeset') then
			if (#args > 1) then
				blinclude.SetCycle('NukeSet', args[2])
				toggle = 'Nuking Gear Set';
				status = blinclude.GetCycle('NukeSet');
			else
				blinclude.AdvanceCycle('NukeSet');
				toggle = 'Nuking Gear Set';
				status = blinclude.GetCycle('NukeSet');
			end
		elseif (args[1] == 'burst') then
			blinclude.AdvanceToggle('Burst');
			toggle = 'Magic Burst Set';
			status = blinclude.GetToggle('Burst');
		elseif (args[1] == 'highmp') then
			blinclude.AdvanceToggle('HighMP');
			toggle = 'HighMP';
			status = blinclude.GetToggle('HighMP');
		end
		if (player.MainJob == 'BLM') then
			if (args[1] == 'elecycle') then
				if (#args > 1) then
					blinclude.SetCycle('Element', args[2])
					toggle = 'Spell Element';
					status = blinclude.GetCycle('Element');
				else
					blinclude.AdvanceCycle('Element');
					toggle = 'Spell Element';
					status = blinclude.GetCycle('Element');
				end
			elseif (args[1] == 'nuke') then
				blinclude.DoNukes(args[2]);
			end
		end
	end
	if (player.MainJob == 'RDM') or (player.MainJob == 'BRD') or (player.MainJob == 'WHM') then
		if (args[1] == 'fight') then
			if (blinclude.GetToggle('Disabled') == false) or (blinclude.GetToggle('WeaponLock') == false) then
				if (blinclude.GetToggle('Fight') == false) then
					AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable Main');
					AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable Sub');
					if (player.MainJob == 'RDM') then AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable Range') end
					if (player.MainJob == 'WHM') then AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable Ammo') end
					blinclude.AdvanceToggle('Fight');
					toggle = 'Mage Weapon Lock';
					status = blinclude.GetToggle('Fight');
				else
					AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable Main');
					AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable Sub');
					if (player.MainJob == 'RDM') then AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable Range') end
					if (player.MainJob == 'WHM') then AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable Ammo') end
					blinclude.AdvanceToggle('Fight');
					toggle = 'Mage Weapon Lock';
					status = blinclude.GetToggle('Fight');
				end
			end
		end
	end
	if (player.MainJob == 'PLD') then
		if (args[1] == 'tankset') then
			if (#args > 1) then
				blinclude.SetCycle('TankSet', args[2])
				toggle = 'Tank Gear Set';
				status = blinclude.GetCycle('TankSet');
			else
				blinclude.AdvanceCycle('TankSet');
				toggle = 'Tank Gear Set';
				status = blinclude.GetCycle('TankSet');
			end
		end
	end
	if (player.MainJob == 'PUP') then
		if (args[1] == 'pupmode') then
			blinclude.AdvanceCycle('PupMode');
			toggle = 'Puppet Mode';
			status = blinclude.GetCycle('PupMode');
		end
	end
	if (player.MainJob == 'BRD') then
		if (args[1] == 'forcestring') then
			blinclude.AdvanceToggle('String');
			toggle = 'BRD Forced Harp';
			status = blinclude.GetToggle('String');
		end
	end
	if (player.MainJob == 'RNG') then
		if (args[1] == 'ranged') then
			if (#args > 1) then
				blinclude.SetCycle('Ranged', args[2])
				toggle = 'Ranged weapon';
				status = blinclude.GetCycle('Ranged');
			else
				blinclude.AdvanceCycle('Ranged');
				toggle = 'Ranged weapon';
				status = blinclude.GetCycle('Ranged');
			end
		end
	end
	if (player.MainJob == 'COR') then
		if (args[1] == 'tpgun') then
			blinclude.AdvanceToggle('TPgun');
			toggle = 'COR Forced TP Gun';
			status = blinclude.GetToggle('TPgun');
		elseif (args[1] == 'cormsg') then
			if blinclude.CORmsg == true then
				blinclude.CORmsg = false;
				print(chat.header('BasicLuas'):append(chat.message('COR Roll messages will no longer show')));
			else
				blinclude.CORmsg = true;
				print(chat.header('BasicLuas'):append(chat.message('COR Roll messages will show now')));
			end
		end
	end
	if blconfig.settings.Messages then
		blinclude.Message(toggle, status)
	end
end

function blinclude.CheckCommonDebuffs()
	local weakened = gData.GetBuffCount('Weakened');
	local sleep = gData.GetBuffCount('Sleep');
	local doom = (gData.GetBuffCount('Doom'))+(gData.GetBuffCount('Bane'));

	if (sleep >= 1) then gFunc.EquipSet(blsets.sets.Sleeping) end
	if (doom >= 1) then	gFunc.EquipSet(blsets.sets.Doomed) end
	if (weakened >= 1) then gFunc.EquipSet(blsets.sets.Reraise) end
end

function blinclude.CheckAbilityRecast(check)
	local RecastTime = 0;

	for x = 0, 31 do
		local id = AshitaCore:GetMemoryManager():GetRecast():GetAbilityTimerId(x);
		local timer = AshitaCore:GetMemoryManager():GetRecast():GetAbilityTimer(x);

		if ((id ~= 0 or x == 0) and timer > 0) then
			local ability = AshitaCore:GetResourceManager():GetAbilityByTimerId(id);
			if ability == nil then return end
			if (ability.Name[1] == check) and (ability.Name[1] ~= 'Unknown') then
				RecastTime = timer;
			end
		end
	end

	return RecastTime;
end


function blinclude.CheckLockingItems()
	local lockItems = gData.GetEquipment();
	if (lockItems.Ring1 ~= nil) and (blinclude.LockingRings:contains(lockItems.Ring1.Name)) then
		local tempRing1 = lockItems.Ring1.Name;
		gFunc.Equip('Ring1', tempRing1);
	end
	if (lockItems.Ring2 ~= nil) and (blinclude.LockingRings:contains(lockItems.Ring2.Name)) then
		local tempRing2 = lockItems.Ring2.Name;
		gFunc.Equip('Ring2', tempRing2);
	end
	if (lockItems.Main ~= nil) and (blinclude.LockingWeapons:contains(lockItems.Main.Name)) then
		local tempMain = lockItems.Main.Name;
		gFunc.Equip('Main', tempMain);
	end
	if (lockItems.Sub ~= nil) and (blinclude.LockingWeapons:contains(lockItems.Sub.Name)) then
		local tempSub = lockItems.Sub.Name;
		gFunc.Equip('Sub', tempSub);
	end
end

function blinclude.CheckLevelSync(sets)
    local player = gData.GetPlayer()
    if CurrentLevel ~= player.MainJobSync and player.MainJobSync > 0 then
        CurrentLevel = player.MainJobSync
        gFunc.EvaluateLevels(sets, CurrentLevel)
    end
end

function blinclude.SetTownGear()
	local zone = gData.GetEnvironment();
	if (zone.Area ~= nil) and (blinclude.Towns:contains(zone.Area)) then gFunc.EquipSet('Town') end
end

function blinclude.SetRegenRefreshGear()
	if blconfig.settings.AutoGear == false then return end

	local player = gData.GetPlayer();
	local pet = gData.GetPet();
	if (player.Status == 'Idle') then
		if (player.HPP < blconfig.settings.RegenGearHPP ) then gFunc.EquipSet('Idle_Regen') end
		if (player.MPP < blconfig.settings.RefreshGearMPP ) then gFunc.EquipSet('Idle_Refresh') end
	end
	if (player.HPP < blconfig.settings.DTGearHPP) then gFunc.EquipSet('Dt') end
	if pet ~= nil then
		if (pet.HPP < blconfig.settings.PetDTGearHPP) then gFunc.EquipSet('Pet_Dt') end
	end
end

function blinclude.CheckWsBailout()
	local player = gData.GetPlayer();
	local ws = gData.GetAction();
	local target = gData.GetActionTarget();
	local ta = gData.GetBuffCount('Trick Attack');
	local sleep = gData.GetBuffCount('Sleep');
	local petrify = gData.GetBuffCount('Petrification');
	local stun = gData.GetBuffCount('Stun');
	local terror = gData.GetBuffCount('Terror');
	local amnesia = gData.GetBuffCount('Amnesia');
	local charm = gData.GetBuffCount('Charm');
	
	if blconfig.settings.WScheck then
		if (ws.Name == 'Mistral Axe') and (tonumber(target.Distance) > 15.7) then
			print(chat.header('BasicLuas'):append(chat.message('Distance to mob is too far! Move closer or increase WS distance')));
			print(chat.header('BasicLuas'):append(chat.message('Can change WS distance allowed by using /wsdistance ##')));
			return false;
		elseif blconfig.settings.WScheck and not blinclude.DistanceWS:contains(ws.Name) and not (ws.Name == 'Mistral Axe') and (tonumber(target.Distance) > blconfig.settings.WSdistance) then
			if (ta >= 1) or (blconfig.settings.ExtraDistanceMobs:contains(target.Name)) then
				if (tonumber(target.Distance) > (blconfig.settings.WSdistance+3)) then
					print(chat.header('BasicLuas'):append(chat.message('Distance to mob is too far! Move closer or increase WS distance')));
					print(chat.header('BasicLuas'):append(chat.message('Can change WS distance allowed by using /wsdistance ##')));
					return false;
				end
			else
				print(chat.header('BasicLuas'):append(chat.message('Distance to mob is too far! Move closer or increase WS distance')));
				print(chat.header('BasicLuas'):append(chat.message('Can change WS distance allowed by using /wsdistance ##')));
				return false;
			end
		end
	elseif (player.TP <= 999) or (sleep+petrify+stun+terror+amnesia+charm >= 1) then
		return false;
	end
		
	return true;
end

function blinclude.CheckSpellBailout()
	local sleep = gData.GetBuffCount('Sleep');
	local petrify = gData.GetBuffCount('Petrification');
	local stun = gData.GetBuffCount('Stun');
	local terror = gData.GetBuffCount('Terror');
	local silence = gData.GetBuffCount('Silence');
	local charm = gData.GetBuffCount('Charm');

	if (sleep+petrify+stun+terror+silence+charm >= 1) then
		return false;
	else
		return true;
	end
end

function blinclude.CheckAbilityBailout()
	local sleep = gData.GetBuffCount('Sleep');
	local petrify = gData.GetBuffCount('Petrification');
	local stun = gData.GetBuffCount('Stun');
	local terror = gData.GetBuffCount('Terror');
	local paralysis = gData.GetBuffCount('Paralysis');
	local charm = gData.GetBuffCount('Charm');

	if (sleep+petrify+stun+terror+paralysis+charm >= 1) then
		return false;
	else
		return true;
	end
end

function blinclude.UseWarpItem()
	if (blinclude.LockingRings:contains(blconfig.settings.Warp_Item)) then
		AshitaCore:GetChatManager():QueueCommand(1, '/lac equip ring2 "' .. blconfig.settings.Warp_Item .. '"');
	elseif (blinclude.LockingWeapons:contains(blconfig.settings.Warp_Item)) then
		AshitaCore:GetChatManager():QueueCommand(1, '/lac equip main "' .. blconfig.settings.Warp_Item .. '"');
	elseif string.contains(blconfig.settings.Warp_Item, 'Warp Scroll') then
		AshitaCore:GetChatManager():QueueCommand(1, '/item "Instant Warp Scroll" <me>');
	end
	
	local function useitem()
		local function forceidleset()
			AshitaCore:GetChatManager():QueueCommand(1, '/lac set Idle_Default');
		end
		AshitaCore:GetChatManager():QueueCommand(1, '/item "' .. blconfig.settings.Warp_Item .. '" <me>');
		forceidleset:once(30);
	end
	useitem:once(33);
end

function blinclude.DoNukes(tier)
	local cast = blinclude.GetCycle('Element');
	if (tier ~= nil) then 
		AshitaCore:GetChatManager():QueueCommand(1, '/ma "' .. cast .. ' ' .. tier .. '" <t>');
	else
		-- print(chat.header('BasicLuas'):append(chat.());
		print(chat.header('BasicLuas'):append(chat.warning('Nuke tier not defined.')));
		return
	end
end

function blinclude.DoCORmsg(roll)
	if blinclude.CORmsg == false then return end

	for n = 1, #blinclude.Rolls do
		if blinclude.Rolls[n][1] == roll then
			print(chat.header('blinclude'):append('[' .. chat.warning(roll) .. ']' .. '  [Lucky: ' .. chat.success(blinclude.Rolls[n][2]) .. ']  [Unlucky: ' .. chat.error(blinclude.Rolls[n][3]) .. ']'));
		end
	end
end

function blinclude.DoDrain()
	local player = AshitaCore:GetMemoryManager():GetPlayer();
	local recast1 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(245);
	local recast2 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(246);
	
	if (player:GetMainJob() == 8) then
		if (recast2 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Drain II" <t>');
		elseif (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Drain" <t>');
		end
	elseif (recast1 == 0) then
		AshitaCore:GetChatManager():QueueCommand(1, '/ma "Drain" <t>');
	end
end

function blinclude.CheckCancels()--tossed Stoneskin in here too
	local action = gData.GetAction();
	local sneak = gData.GetBuffCount('Sneak');
	local stoneskin = gData.GetBuffCount('Stoneskin');
	local target = gData.GetActionTarget();
	local me = AshitaCore:GetMemoryManager():GetParty():GetMemberName(0);
	
	local function do_jig()
		AshitaCore:GetChatManager():QueueCommand(1, '/ja "Spectral Jig" <me>');
	end
	local function do_sneak()
		AshitaCore:GetChatManager():QueueCommand(1, '/ma "Sneak" <me>');
	end
	local function do_ss()
		AshitaCore:GetChatManager():QueueCommand(1, '/ma "Stoneskin" <me>');
	end

	if (action.Name == 'Spectral Jig' and sneak ~=0) then
		gFunc.CancelAction();
		--AshitaCore:GetChatManager():QueueCommand(1, '/cancel Sneak');
		print(chat.header('BasicLuas'):append(chat.warning('Cancel Sneak first!')));
		do_jig:once(2);
	elseif (action.Name == 'Sneak' and sneak ~= 0 and target.Name == me) then
		gFunc.CancelAction();
		--AshitaCore:GetChatManager():QueueCommand(1, '/cancel Sneak');
		print(chat.header('BasicLuas'):append(chat.warning('Cancel Sneak first!')));
		do_sneak:once(1);
	elseif (action.Name == 'Stoneskin' and stoneskin ~= 0) then
		gFunc.CancelAction();
		--AshitaCore:GetChatManager():QueueCommand(1, '/cancel Stoneskin');
		print(chat.header('BasicLuas'):append(chat.warning('Cancel Stoneskin first!')));
		do_ss:once(1);
	end
end

function blinclude.NationAketon()
    local env = gData.GetEnvironment();
	if T{'Bastok Markets', 'Bastok Mines', 'Port Bastok','Metalworks'}:contains(env.Area) then
		gFunc.Equip('Body', 'Republic Aketon');
	elseif T{'South San d\'Oria', 'North San d\'Oria', 'Port San d\'Oria','Chateau d\'Oraguille'}:contains(env.Area) then
		gFunc.Equip('Body', 'Kingdom Aketon');
	elseif T{'Windurst Walls', 'Windurst Waters', 'Windurst Woods', 'Port Windurst','Heavens Tower'}:contains(env.Area) then
		gFunc.Equip('Body', 'Federation Aketon');
	end
end

local function loadMsg()
	print(chat.header('BasicLuas'):append(chat.message('Press '..tostring(blkeybinds.GetTriggerKey('modes'))..' to see modes again.')))
end

function blinclude.CheckDefault()
	blinclude.SetRegenRefreshGear();
	blinclude.SetTownGear();
	blinclude.NationAketon()
    blinclude.CheckCommonDebuffs();
	blinclude.CheckLockingItems();
	
	local player = gData.GetPlayer();
	
	if (blinclude.CraftSet == true) then gFunc.EquipSet(blsets.sets.Crafting) end
	if (blinclude.ZeniSet == true) then gFunc.EquipSet(blsets.sets.Zeni) end
	if (blinclude.FishSet == true) then gFunc.EquipSet(blsets.sets.Fishing) end
	if (blinclude.HELMSet == true) then gFunc.EquipSet(blsets.sets.HELM) end
	if (blinclude.RRSET == true) then gFunc.EquipSet(blsets.sets.Reraise) end
	if (blinclude.XpRing == true) then gFunc.Equip('ring1', blconfig.settings.Xp_Ring) end

end

function blinclude.Unload()
	blinclude.ClearAlias();
	blkeybinds.ClearKeybinds();
end

function blinclude.Initialize()
	blinclude.SetVariables:once(2);
	blinclude.SetAlias:once(2);
	blkeybinds.SetKeybinds:once(2);
	blinclude.GetModes:once(3)
	loadMsg:once(3)
end

return blinclude;