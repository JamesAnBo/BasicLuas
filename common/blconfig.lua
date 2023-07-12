--BasicLuas Ver. 18.0
--By Aesk (with much help from the Ashita discord members)

local blconfig = T{};



blconfig.settings = { 

	--Change these settings as desired.
	
	Messages = true; --set to true if you want chat log messages to appear on any /gc command used such as DT, TH, or KITE gear toggles, certain messages will always appear
	AutoGear = false; --set to false if you dont want DT/Regen/Refresh/PetDT gear to come on automatically at the defined %'s here
	WScheck = true; --set to false if you dont want to use the WSdistance safety check
	WSdistance = 4.5; --default max distance (yalms) to allow non-ranged WS to go off at if the above WScheck is true
	ExtraDistanceMobs = T{'Suzaku','Genbu','Byakko','Sieryu','Kirin','Behemoth','King Behemoth','Fafnir','Nidhogg','Adamantoise','Aspidochelone','Tiamat','Vrtra','Jormungand','King Vinegarroon','Ul\'phuabo','Om\'phuabo','Ul\'yovra','Om\'yovra','Jailer of Justice','Jailer of Hope','Jailer of Prudence','Jailer of Love','Absolute Virtue','Cerberus','Hydra','Khimaira','Pandemonium Warden','Dark Xion','Sandworm'}; --WSdistance will add an extra 3 yalms when engaged to these mobs.
	RegenGearHPP = 60; -- set HPP to have your idle regen set to come on
	RefreshGearMPP = 70; -- set MPP to have your idle refresh set to come on
	DTGearHPP = 40; -- set HPP to have your DT set to come on
	PetDTGearHPP = 50; -- set pet HPP to have your PetDT set to come on
	Warp_Item = 'Warp Cudgel'; -- put your prefered warp item in here.
	Xp_Ring = 'Chariot Band'; -- put your prefered xp ring in here.
	
};

return blconfig;