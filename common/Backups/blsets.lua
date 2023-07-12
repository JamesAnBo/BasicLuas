local blsets = T{};
	
blsets.sets = T{	
	Doomed = { -- this set will equip any time you have the doom status
		Ring1 = 'Purity Ring',
		Waist = 'Gishdubar Sash',
    },
	Holy_Water = { -- update with whatever gear you use for the Holy Water item
		Ring1 = 'Purity Ring',
		Ring2 = 'Blenmot\'s Ring',
    },
	Sleeping = { -- this set will auto equip if you are asleep
    },
	Reraise = { -- this set will try to equip when weakened if AutoGear variable is true below or you can force it with /rrset in game
		Head = 'Crepuscular Helm',
		Body = 'Crepuscular Mail',
    },
	Crafting = { -- this set is meant as a default set for crafting, equip using /craftset, be sure to dbl check what rings you want to use
		Head = 'Midras\'s Helm +1',
		Body = 'Tanner\'s Apron',
		Hands = 'Tanner\'s Gloves',
		Ring1 = 'Artificer\'s Ring',
		Ring2 = 'Craftmaster\'s Ring',
    },
	Zeni = { -- this set is meant as a default set for pictures, equip using /zeniset
		Range = 'Soultrapper 2000',
		Ammo = 'Blank Soulplate',
    },
	Fishing = { -- this set is meant as a default set for fishing, equip using /fishset
		Range = 'Halcyon Rod',
		Body = 'Fsh. Tunica',
		Hands = 'Fsh. Gloves',
		Legs = 'Fisherman\'s Hose',
		Feet = 'Fisherman\'s Boots',
    },
	HELM = { -- this set is meant as a default set for HELM, equip using /helmset
		Body = 'Field Tunica',
		Hands = 'Field Gloves',
		Legs = 'Field Hose',
		Feet = 'Field Boots',
    },
};

blsets.ElementalStaffTable = { --update this with the a staves you have
	['Fire'] = 'Fire Staff', --'Vulcan\'s Staff',
	['Earth'] = 'Earth Staff', --'Terra\'s Staff',
	['Water'] = 'Water Staff', --'Neptune\'s Staff',
	['Wind'] = 'Wind Staff', --'Auster\'s Staff',
	['Ice'] = 'Ice Staff', --'Aquilo\'s Staff',
	['Thunder'] = 'Thunder Staff', --'Jupiter\'s Staff',
	['Light'] = 'Light Staff', --'Apollo\'s Staff',
	['Dark'] = 'Dark Staff' --'Pluto\'s Staff',
};

blsets.obiTable = {
    --['Universal'] = 'Hachirin-no-Obi',
    ['Fire'] = 'Karin Obi',
    ['Earth'] = 'Dorin Obi',
    ['Water'] = 'Suirin Obi',
    ['Wind'] = 'Furin Obi',
    ['Ice'] = 'Hyorin Obi',
    ['Thunder'] = 'Rairin Obi',
    ['Light'] = 'Korin Obi',
    ['Dark'] = 'Anrin Obi'
};

return blsets;