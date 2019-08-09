

-- TODO:
-- ~ Get more accurate spawn rates
-- ~ Double check skills on each enemy
-- ~ Double check that we got all the existing enemies available
-- ~ Fix plural words on "Days", "Hours" and "Minutes" for single numbers
-- ~ Change some of the beasts back to uncategorized
-- ~ Menu options (rarity types, chat notification, etc.)
-- ~ Update all world boss abilities
-- ~ Enemies that spawn at 0,0 shouldnt display?
-- ~ Have dungeon rares show % chance to spawn instead of duration
-- ~ Get correct positions of rares in dungeons
-- ~ Optimize!
-- ~ Auto create/update macro to target enemies in area
-- ~ Arrow pointer towards rare if it's targetted or focused
-- ~ Check for duplicate entries
-- ~ Alliance / Horce checks
-- ~ Seperate LBRS and UBRS somehow


local ADDON_NAME = "RareAware";
local ICON_PATH = "Interface\\AddOns\\"..ADDON_NAME.."\\Icons\\";
local ICON_HIGHLIGHT = "StarHighlight.tga";
local SPAWN_UNKNOWN = "Unknown";
local TOOLTIP_LOOT_INDEX = 1;
local DISTANCE_NPCS = {};
local DISTANCE_THRESHOLD = 0.05;



local RARE_LIST = {"Araga","Cranky Benj","Gravis Slipknot","Jimmy the Bleeder","Lo'Grosh","Narillasanz","Skhowl","Stone Fury","Darbel Montrose","Foulbelly","Geomancer Flintdagger","Kovork","Molok the Crusher","Nimar the Slayer","Prince Nazjak","Ruul Onestone","Singer","Zalas Witherbark","Akkrilus","Apothecary Falthis","Branch Snapper","Darkslayer Mordenthal","Eck'alom","Lady Vespia","Mist Howler","Mugglefin","Oakpaw","Prince Raze","Rorgish Jowl","Terrowulf Packlord","Ursol'lok","Antilos","Gatekeeper Rageroar","General Fangferror","Lady Sesspira","Magister Hawkhelm","Master Feardred","Monnos the Elder","Scalebeard","The Evalcharr","Varo'then's Ghost","7:XT","Anathemus","Barnabus","Broken Tooth","Rumbler","Shadowforge Commander","Siege Golem","War Golem","Zaricotl","Scarshield Quartermaster","The Behemoth","Akubar the Seer","Clack the Reaver","Deatheye","Dreadscorn","Grunter","Magronos the Unyielding","Mojo the Twisted","Ravage","Spiteflayer","Deathmaw","Gorgon'och","Gruklash","Hahk'Zor","Hematos","Malfunctioning Reaver","Terrorspark","Thauris Balgarr","Volchan","Carnivous the Breaker","Firecaller Radison","Flagglemurk the Cruel","Lady Moongazer","Lady Vespira","Licillin","Lord Sinslayer","Shadowclaw","Strider Clutchmother","Accursed Slitherblade","Crusty","Giggler","Hissperak","Kaskk","Prince Kellen","Bjarn","Edan the Howler","Gibblewilt","Great Father Arctikus","Hammerspine","Timber","Captain Flat Tusk","Death Flayer","Felweaver Scornn","Geolord Mottle","Warlord Kolkanis","Watch Commander Zalaphil","Commander Felstrom","Fenros","Lord Malathrom","Lupos","Marina DeSirrus","Naraxis","Nefaru","The Unknown Soldier","Brimgore","Burgle Eye","Darkmist Widow","Dart","Drogoth the Roamer","Hayoc","Lord Angler","Oozeworm","Ripscale","The Rot","Deathspeaker Selendre","Duggan Wildhammer","Gish the Unmoving","Hed'mush the Rotting","High General Abbendis","Lord Darkscythe","Nerubian Overseer","Ranger Lord Hawkspear","Warlord Thresh'jin","Zul'Brin Warpbranch","Gug Fatcandle","Fedfennel","Gruff Swiftbite","Morgaine the Sly","Mother Fang","Narg the Taskmaster","Thuros Lightfingers","Alshirr Banebreath","Death Howl","Dessecus","Immolatus","Mongress","Olm the Wise","Ragepaw","The Ongar","Spinecrawl","Antilus the Soarer","Arash-ethis","Bloodroar the Stalker","Diamond Head","Gnarl Leafbrother","Lady Szallah","Old Grizzlegut","Qirot","Snarler","Big Samras","Creepthess","Lady Zephris","Ro'Bark","Scargil","Tamra Stormpike","Morick Darkbrew","Boss Galgosh","Emogg the Crusher","Grizlak","Gosh-Haldir","Large Loch Crocolisk","Lord Condar","Magosh","Shanda the Spinner","Enforcer Emilgund","Ghost Howl","Mazzranache","Sister Hatelash","Snagglespear","The Rake","Boulderheart","Chatter","Kazon","Ribchaser","Rohh the Silent","Seeker Aqualon","Snarlflare","Squiddic","Faulty War Golem","Highlord Mastrogonde","Rekk'tilac","Scald","Shleipnarr","Slave Master Blackheart","Smoldar","Gretheer","Grubthor","Huricanian","Krellack","Lapress","Rex Ashil","Setis","Twilight Lord Everun","Zora","Dalaran Spellscribe","Gorefang","Krethis Shadowspinner","Old Vicejaw","Ravenclaw Regent","Rot Hide Bruiser","Snarlmane","Brother Ravenoak","Foreman Rigger","Nal'taszar","Pridewing Patriarch","Sentinel Amarassan","Sister Riven","Sorrow Wing","Taskmaster Whipfang","Vengeful Ancient","Sewer Beast","Gluggle","High Priestess Hai'watna","Kurmokk","Lord Sakrasis","Mosh'Ogg Butcher","Rippa","Roloch","Scale Belly","Verifonix","Fingat","Gilmorian","Lord Captain Wyrmak","Lost One Chieftain","Lost One Cook","Molt Thorn","Cyclok the Mad","Greater Firebird","Haarka the Ravenous","Jin'Zallah the Sandbringer","Kregg Keelhaul","Murderous Blisterpaw","Omgorn the Lost","Soriid the Devourer","Warleader Krazzilak","Blackmoss the Fetid","Duskstalker","Fury Shelda","Grimmaw","Threggil","Uruson","Aean Swiftriver","Ambassador Bloodrage","Azzere the Skyblade","Brokespear","Brontus","Captain Gerogg Hammertoe","Digger Flameforge","Dishu","Elder Mystic Razorsnout","Engineer Whirleygig","Foreman Grills","Geopriest Gukk'rok","Gesharahan","Hagg Taurenbane","Hannah Bladeleaf","Heggin Stonewhisker","Humar the Pridelord","Malgin Barleybrew","Marcus Bel","Rathorian","Rocklance","Silithid Harvester","Sister Rathtalon","Sludge Beast","Snort the Heckler","Stonearm","Swiftmane","Swinegart Spearhide","Takk the Leaper","Thora Feathermoon","Thunderstomp","Grimungous","Ironback","Jalinde Summerdrake","Mith'rethis the Enchanter","Old Cliff Jumper","Razortalon","Retherokk the Berserker","The Reak","Witherheart the Stalker","Zul'arek Hatefowler","Achellios the Banished","Gibblesnik","Harb Foulmountain","Heartrazor","Ironeye the Invincible","Silithid Ravager","Vile Sting","Bayne","Deeb","Farmer Solliden","Fellicent's Shade","Lost Soul","Muad","Ressan the Needler","Sri'skulk","Tormented Spirit","Clutchmother Zavas","Gruff","King Mosh","Ravasaur Matriarch","Uhk'loc","Foreman Jerris","Foreman Marcrid","Foulmane","Lord Maldazzar","Putridius","Scarlet Executioner","Scarlet High Clerist","Scarlet Interrogator","Scarlet Judge","Scarlet Smith","The Husk","Brack","Foe Reaper 4000","Leprithus","Master Digger","Sergeant Brashclaw","Slark","Vultros","Dragonmaw Battlemaster","Garneg Charskull","Gnawbone","Leech Widow","Ma'ruk Wyrmscale","Mirelow","Razormaw Matriarch","Sludginn","Azurous","General Colbatann","Grizzle Snowpaw","Kashoch the Reaver","Lady Hederine","Mezzir the Howler","Rak'shiri","Norissis","Bornak the Gorer","The Deep Tunneler","Manas","Bruiser","Panzor the Invincible","Pyromancer Loregrain","Verek","Warder Stilgiss","Lord Hel'nurath","Mushgog","Skarr the Unbreakable","The Razza","Tsu'zee","Dark Iron Ambassador","Bannok Grimaxe","Burning Felguard","Crystal Fang","Ghok Bashguud","Spirestone Battle Lord","Spirestone Butcher","Spirestone Lord Magus","Cursed Centaur","Meshlok the Harvester","Ragglesnout","Blind Hunter","Earthcaller Halmgar","Azshir the Sleepless","Fallen Champion","Ironspine","Deathsworn Captain","Bruegal Ironknuckle","Hearthsinger Forresten","Skul","Stonespine","Jade","Veyzhak the Cannibal","Zekkis","Brainwashed Noble","Marisa du'Paige","Miner Johnson","Digmaster Shovelphlange","Goraluk Anvilcrack","Jed Runewatcher","Boahn","Deviate Faerie Dragon","Trigore the Lasher","Dustwraith","Sandarr Dunereaver","Zerillis"};



local KEY_WORLD_MAP_PIN = "worldpin";
local KEY_MINI_MAP_PIN = "minipin";
local KEY_ZONE_NAME = "zonename";
local KEY_NPC_NAME = "npcname";
local KEY_POSITION_X = "x";
local KEY_POSITION_Y = "y";
local KEY_LEVEL = "level";
local KEY_CLASS = "class";
local KEY_TYPE = "type";
local KEY_HEALTH = "health";
local KEY_DAMAGE = "damage";
local KEY_ARMOR = "armor";
local KEY_SPAWN = "spawn";
local KEY_MODEL = "model";
local KEY_SPELLS = "spells";
local KEY_LOOT = "loot";
local KEY_LOADED = "loaded";
local KEY_RARITY = "rarity";



local CLASS_RARE = "Rare";
local CLASS_RARE_ELITE = "Rare-Elite";
local CLASS_ELITE = "Elite";
local CLASS_BOSS = "Boss";
local CLASS_WORLD_BOSS = "World Boss";

local CLASS_COLORS = {};
CLASS_COLORS[CLASS_RARE] = {0.12, 1.0, 0.0};
CLASS_COLORS[CLASS_RARE_ELITE] = {0, 0.44, 0.87};
CLASS_COLORS[CLASS_ELITE] = {0, 0.44, 0.87};
CLASS_COLORS[CLASS_BOSS] = {0.64, 0.21, 0.93};
CLASS_COLORS[CLASS_WORLD_BOSS] = {0.64, 0.21, 0.93};

local CLASS_COLOR_CODES = {};
CLASS_COLOR_CODES[CLASS_RARE] = "|c1eff00ff";
CLASS_COLOR_CODES[CLASS_RARE_ELITE] = "|c0070ddff";
CLASS_COLOR_CODES[CLASS_ELITE] = "|c0070ddff";
CLASS_COLOR_CODES[CLASS_BOSS] = "|ca335eeff";
CLASS_COLOR_CODES[CLASS_WORLD_BOSS] = "|ca335eeff";



local RARITY_ICONS = {};
RARITY_ICONS[0] = "Star.tga";
RARITY_ICONS[1] = "StarCommon.tga";
RARITY_ICONS[2] = "StarUncommon.tga";
RARITY_ICONS[3] = "StarRare.tga";
RARITY_ICONS[4] = "StarEpic.tga";



local TYPE_NONE = "Unknown";
local TYPE_HUMANOID = "Humanoid";
local TYPE_DEMON = "Demon";
local TYPE_UNDEAD = "Undead";
local TYPE_ELEMENTAL = "Elemental";
local TYPE_BEAST = "Beast";
local TYPE_ABBERATION = "Abberation";
local TYPE_DRAGONKIN = "Dragonkin";
local TYPE_MECHANICAL = "Mechanical";
local TYPE_GIANT = "Giant";




-- Kalimdor
local ZONE_TELDRASSIL = 1438;
local ZONE_WINTERSPRING = 1452;
local ZONE_DARKSHORE = 1439;
local ZONE_FELWOOD = 1448;
local ZONE_AZSHARA = 1447;
local ZONE_ASHENVALE = 1440;
local ZONE_STONETALON_MOUNTAINS = 1442;
local ZONE_DUROTAR = 1411;
local ZONE_BARRENS = 1413;
local ZONE_DESOLACE = 1443;
local ZONE_MULGORE = 1412;
local ZONE_DUSTWALLOW_MARSH = 1445;
local ZONE_FERALAS = 1444;
local ZONE_THOUSAND_NEEDLES = 1441;
local ZONE_TANARIS = 1446;
local ZONE_UNGORO_CRATER = 1449;
local ZONE_SILITHUS = 1451;

-- Eastern Kingdoms
local ZONE_EASTERN_PLAGUELANDS = 1423;
local ZONE_WESTERN_PLAGUELANDS = 1422;
local ZONE_TIRISFAL_GLADES = 1420;
local ZONE_ALTERAC_MOUNTAINS = 1416;
local ZONE_SILVERPINE_FOREST = 1421;
local ZONE_HINTERLANDS = 1425;
local ZONE_HILLSBRAD_FOOTHILLS = 1424;
local ZONE_ARATHI_HIGHLANDS = 1417;
local ZONE_WETLANDS = 1437;
local ZONE_LOCH_MODAN = 1432;
local ZONE_DUN_MOROGH = 1426;
local ZONE_BADLANDS = 1418;
local ZONE_BURNING_STEPPES = 1428;
local ZONE_SEARING_GORGE = 1427;
local ZONE_REDRIDGE_MOUNTAINS = 1433;
local ZONE_ELWYNN_FOREST = 1429;
local ZONE_SWAMP_OF_SORROWS = 1435;
local ZONE_DUSKWOOD = 1431;
local ZONE_WESTFALL = 1436;
local ZONE_BLASTED_LANDS = 1419;
local ZONE_STRANGLETHORN_VALE = 1434;
local ZONE_STORMWIND_CITY = 1453;

-- Dungeons
local ZONE_WAILING_CAVERNS = 0;
local ZONE_SCARLET_MONASTERY = 0;
local ZONE_STRATHOLME = 0;
local ZONE_STOCKADE = 0;
local ZONE_BLACKROCK_SPIRE = 0;
local ZONE_BLACKROCK_DEPTHS = 0;
local ZONE_RAZORRFEN_KRAUL = 0;
local ZONE_RAZORRFEN_DOWNS = 0;
local ZONE_ZUL_FARRAK = 0;
local ZONE_GNOMEREGAN = 0;
local ZONE_SHADOWFANG_KEEP = 0;
local ZONE_MARAUDON = 0;
local ZONE_DEADMINES = 0;
local ZONE_DIRE_MAUL = 0;
local ZONE_SUNKEN_TEMPLE = 0;
local ZONE_TEMPLE_OF_ATAL_HAKKAR = 0;

-- Other
local ZONE_UNKNOWN = -1;



local DELAY = 1; -- Seconds
local DATA = {};

local WORLD_MAP_ID = -1;
local WORLD_MAP_PINS = {};
local WORLD_MAP_CONTAINER = WorldMapFrame:GetCanvas();
local WORLD_MAP_PIN_SIZE = 18;

local MINI_MAP_ID = -1;
local MINI_MAP_PINS = {};
local MINI_MAP_CONTAINER = Minimap;
local MINI_MAP_PIN_SIZE = 12;

local PLAYER_MAP_ID = -1;



local Frame = CreateFrame("Frame", ADDON_NAME);
Frame:RegisterEvent("ZONE_CHANGED");
Frame:SetScript("OnUpdate", function(self, sinceLastUpdate) Frame:OnUpdate(sinceLastUpdate); end);
Frame:SetScript("OnEvent", function(self, event, ...) Frame:OnEvent(event); end);



function Frame:Startup()
	
	self:InitializeZones();
	self:InitializeDungeons();
	self:InitializeOther();
	
	self:CheckZone();
	--self:CheckList();
end


-- Checks an existing list of all vanilla rare spawns from website "https://wowwiki.fandom.com/wiki/Rare_mobs_by_zone" with data currently plugged in to see if any are missing.
function Frame:CheckList()

	local ignore = {"Crusty","Marina DeSirrus","The Unknown Soldier","Gug Fatcandle","Spinecrawl","Morick Darkbrew","Gosh-Haldir","Norissis","Bornak the Gorer","The Deep Tunneler","Manas","Bruiser","Lord Hel'nurath","Hearthsinger Forresten"};
	local listCcount = 0;
	
	for r, rareName in pairs(RARE_LIST) do
		local found = false;
		for i, ignoreName in pairs(ignore) do
			if (ignoreName == rareName) then
				found = true;
			end
		end
		if not (found) then
			for z, zoneData in pairs(DATA) do
				for n, npcData in pairs(zoneData) do
					local npcName = npcData[KEY_NPC_NAME];
					if (npcName == rareName) then
						found = true;
					end
				end
			end
		end
		if not (found) then
			listCcount = listCcount + 1;
			print('Missing NPC Data: "' .. rareName .. "'");
		end
	end
	
	if (listCcount > 0) then
		print(listCcount .. " Missing NPCs out of " .. GetTableLength(RARE_LIST));
	end
	
	local dataCount = 0;
	
	for z, zoneData in pairs(DATA) do
		for n, npcData in pairs(zoneData) do
			local found = false;
			local npcName = npcData[KEY_NPC_NAME];
			for r, rareName in pairs(RARE_LIST) do
				if (npcName == rareName) then
					found = true;
				end
			end
			if not (found) then
				dataCount = dataCount + 1;
				print('Extra List Data: "' .. npcName .. "'");
			end
		end
	end
	
end



function Frame:InitializeZones()

	--					 ZONE						NAME                 		X       Y       LVL     CLASS           	TYPE  				HP      	DMG         	ARM     SPAWN   	MODEL	SPELLS								LOOT
		
	-- Teldrassil
	Frame:SetZoneNPCData(ZONE_TELDRASSIL, 			"Blackmoss the Fetid", 		44.0, 	30.0, 	13, 	CLASS_RARE_ELITE, 	TYPE_ELEMENTAL,		379, 		"76-90", 		608, 	{0,2,0},	1549, 	{},									{{5179, 100}});
	Frame:SetZoneNPCData(ZONE_TELDRASSIL, 			"Duskstalker", 				58.1, 	76.7, 	9, 		CLASS_RARE, 		TYPE_BEAST,			176, 		"15-17", 		406, 	{0,2,0},	11453, 	{3604},								{});
	Frame:SetZoneNPCData(ZONE_TELDRASSIL, 			"Fury Shelda", 				34.8, 	34.9, 	8, 		CLASS_RARE, 		TYPE_HUMANOID,		155, 		"15-18", 		316, 	{0,2,0},	2296, 	{3589},								{{18612, 100}});
	Frame:SetZoneNPCData(ZONE_TELDRASSIL, 			"Threggil", 				51.4, 	50.6, 	6, 		CLASS_RARE, 		TYPE_DEMON,			114, 		"12-13", 		150, 	{0,2,0},	904, 	{11976},							{{18610, 100}});
	Frame:SetZoneNPCData(ZONE_TELDRASSIL, 			"Uruson", 					67.1, 	58.6, 	8, 		CLASS_RARE, 		TYPE_HUMANOID,		149, 		"15-17", 		239, 	{0,2,0},	6818, 	{15971},							{{18611, 100}});
	Frame:SetZoneNPCData(ZONE_TELDRASSIL, 			"Grimmaw", 					41.0, 	78.8, 	11, 	CLASS_RARE, 		TYPE_HUMANOID,		242, 		"116-130", 		nil, 	{0,2,0},	1011, 	{19319},							{});
	
	
	-- Darkshore
	Frame:SetZoneNPCData(ZONE_DARKSHORE, 			"Carnivous the Breaker", 	40.4, 	56.5, 	16, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		356, 		"156-186", 		713, 	{0,2,45},	5773, 	{6016, 3391},						{});
	Frame:SetZoneNPCData(ZONE_DARKSHORE, 			"Firecaller Radison", 		38.7, 	87.6, 	19, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		449, 		"162-193", 		442, 	{0,2,0},	5772, 	{5915, 11969, 20793},				{});
	Frame:SetZoneNPCData(ZONE_DARKSHORE, 			"Flagglemurk the Cruel", 	36.8, 	67.6, 	16, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		353, 		"133-158", 		713, 	{0,2,45},	1305, 	{18812, 11976},						{});
	Frame:SetZoneNPCData(ZONE_DARKSHORE, 			"Lady Moongazer", 			43.0, 	61.1, 	17, 	CLASS_RARE_ELITE, 	TYPE_UNDEAD,		382, 		"148-175", 		748, 	{0,2,0},	5774, 	{6533, 6660},						{});
	Frame:SetZoneNPCData(ZONE_DARKSHORE, 			"Licillin", 				45.7, 	36.4, 	14, 	CLASS_RARE_ELITE, 	TYPE_DEMON,			318, 		"95-114", 		344, 	{0,2,45},	10819, 	{11980, 20791},						{});
	Frame:SetZoneNPCData(ZONE_DARKSHORE, 			"Shadowclaw", 				40.3, 	40.5, 	13, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			203, 		"84-99", 		608, 	{0,2,0},	3030, 	{8552},								{});
	Frame:SetZoneNPCData(ZONE_DARKSHORE, 			"Strider Clutchmother", 	34.8, 	87.3, 	20, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			571, 		"47-54", 		852, 	{0,2,0},	38, 	{7272, 6607},						{});
	Frame:SetZoneNPCData(ZONE_DARKSHORE, 			"Lady Vespira", 			57.8, 	21.4, 	22, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		504, 		"148-175", 		770, 	{0,2,45},	4982, 	{12549, 11428, 6660},				{{6333, 65},{6332, 35}});
	Frame:SetZoneNPCData(ZONE_DARKSHORE, 			"Lord Sinslayer", 			56.6, 	34.9, 	16, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		353, 		"133-158", 		695, 	{0,2,0},	4762, 	{13586, 12057},						{}); -- Can be lvl 15
	
	
	-- Felwood
	Frame:SetZoneNPCData(ZONE_FELWOOD, 				"Ragepaw", 					47.7, 	93.1, 	51, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		2721, 		"451-537", 		3052, 	{0,2,45},	1012, 	{13583, 13584},						{});
	Frame:SetZoneNPCData(ZONE_FELWOOD, 				"Alshirr Banebreath", 		40.3, 	85.2, 	54, 	CLASS_RARE_ELITE, 	TYPE_DEMON,			3233, 		"503-599", 		3216, 	{0,2,45},	2879, 	{11443, 13578, 9613},				{});
	Frame:SetZoneNPCData(ZONE_FELWOOD, 				"Death Howl", 				50.0, 	77.1, 	49, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			2947, 		"413-492", 		2944, 	{0,2,0},	11412, 	{3427, 3604},						{});
	Frame:SetZoneNPCData(ZONE_FELWOOD, 				"Mongress", 				42.1, 	75.2, 	50, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			3275, 		"402-475", 		1971, 	{0,2,45},	14315, 	{8599},								{});
	Frame:SetZoneNPCData(ZONE_FELWOOD, 				"Olm the Wise", 			50.2, 	32.8, 	53, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			7576, 		"451-537", 		3128, 	{0,2,45},	6212, 	{},									{});
	Frame:SetZoneNPCData(ZONE_FELWOOD, 				"The Ongar", 				42.2, 	49.9, 	51, 	CLASS_RARE_ELITE, 	TYPE_ABBERATION,	3002, 		"440-522", 		nil, 	{0,2,45},	6212, 	{},									{{20768, 11}});
	Frame:SetZoneNPCData(ZONE_FELWOOD, 				"Dessecus", 				57.8, 	22.3, 	56, 	CLASS_ELITE, 		TYPE_ELEMENTAL,		6414, 		"526-626", 		2699, 	{0,12,0},	9013, 	{16033, 6535},						{});
	Frame:SetZoneNPCData(ZONE_FELWOOD, 				"Immolatus", 				43.1, 	41.4, 	54, 	CLASS_ELITE, 		TYPE_DEMON,			8967, 		"526-626", 		3327, 	{0,12,0},	7029, 	{},									{}); -- Can be lvl 53
	
	
	-- Azshara
	Frame:SetZoneNPCData(ZONE_AZSHARA, 				"Azuregos", 				53.3, 	80.4, 	"??", 	CLASS_WORLD_BOSS, 	TYPE_DRAGONKIN,		916025, 	"4929-5104", 	nil, 	{0,1,0},	11460, 	{243784, 243900, 243805, 243789, 243923, 243901, 243835},		{{18704, 100}});
	Frame:SetZoneNPCData(ZONE_AZSHARA, 				"Gatekeeper Rageroar", 		38.3, 	32.1, 	51, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		7116, 		"428-509", 		2999, 	{0,2,0},	1012, 	{12747, 13584},						{}); -- Reduces Timbermaw rep by 125. Not worth killing.
	Frame:SetZoneNPCData(ZONE_AZSHARA, 				"Magister Hawkhelm", 		58.5, 	30.9, 	52, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		3065, 		"503-599", 		3052, 	{0,2,45},	2240, 	{6660},								{});
	Frame:SetZoneNPCData(ZONE_AZSHARA, 				"Antilos", 					16.6, 	54.1, 	51, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			7116, 		"428-509", 		2999, 	{0,2,45},	3212, 	{13445, 5708},						{});
	Frame:SetZoneNPCData(ZONE_AZSHARA, 				"General Fangferror", 		41.3, 	54.0, 	52, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		7343, 		"440-522", 		3052, 	{0,2,45},	11257, 	{15284, 18812, 12057},				{{17054, 25}}); -- Inside a temple
	Frame:SetZoneNPCData(ZONE_AZSHARA, 				"Lady Sesspira", 			35.4, 	55.7, 	51, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		2381, 		"503-599", 		2477, 	{0,2,45},	11261, 	{15495, 20299, 6660},				{});
	Frame:SetZoneNPCData(ZONE_AZSHARA, 				"The Evalcharr", 			17.9, 	65.6, 	48, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			3337, 		"402-478", 		2888, 	{0,2,0},	10807, 	{20793, 15797},						{});
	Frame:SetZoneNPCData(ZONE_AZSHARA, 				"Varo'then's Ghost", 		13.2, 	74.2, 	48, 	CLASS_RARE_ELITE, 	TYPE_UNDEAD,		2518, 		"402-478", 		2888, 	{0,2,0},	10771, 	{21007},							{});
	Frame:SetZoneNPCData(ZONE_AZSHARA, 				"Master Feardred", 			61.5, 	24.3, 	57, 	CLASS_RARE, 		TYPE_DEMON,			7315, 		"132-154", 		3084, 	{0,2,45},	2687, 	{22271},							{});
	Frame:SetZoneNPCData(ZONE_AZSHARA, 				"Monnos the Elder", 		76.2, 	25.4, 	56, 	CLASS_ELITE, 		TYPE_GIANT,			16924, 		"360-444", 		3195, 	{0,12,0},	10042, 	{10101, 5568, 11876},				{});
	Frame:SetZoneNPCData(ZONE_AZSHARA, 				"Scalebeard", 				52.6, 	47.4, 	52, 	CLASS_ELITE, 		TYPE_BEAST,			8307, 		"474-564", 		4629, 	{0,12,0},	7046, 	{7938},								{});
	
	
	-- Ashenvale
	Frame:SetZoneNPCData(ZONE_ASHENVALE, 			"Ysondre", 					94.2, 	35.7, 	"??", 	CLASS_WORLD_BOSS, 	TYPE_DRAGONKIN,		832750, 	"2907-3243", 	4691, 	{0,1,0},	15364, 	{243398, 243401, 243399, 243411},	{{20644, 100}});
	Frame:SetZoneNPCData(ZONE_ASHENVALE, 			"Apothecary Falthis", 		33.2, 	21.1, 	22, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		471, 		"179-214", 		499, 	{0,5,30},	4156, 	{20791},							{});
	Frame:SetZoneNPCData(ZONE_ASHENVALE, 			"Lady Vespia", 				12.6, 	18.5, 	22, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		512, 		"162-193", 		770, 	{0,5,30},	4979, 	{13586, 8398},						{});
	Frame:SetZoneNPCData(ZONE_ASHENVALE, 			"Mist Howler", 				25.0, 	26.0, 	22, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			500, 		"41-47", 		922, 	{0,5,30},	165, 	{13443, 3604, 8715},				{}); -- Has a wide spawn radius
	Frame:SetZoneNPCData(ZONE_ASHENVALE, 			"Branch Snapper", 			45.6, 	43.5, 	26, 	CLASS_RARE_ELITE, 	TYPE_ELEMENTAL,		1881, 		"170-203", 		1026, 	{0,2,45},	8389, 	{3583, 10101},						{});
	Frame:SetZoneNPCData(ZONE_ASHENVALE, 			"Mugglefin", 				19.4, 	42.7, 	23, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		901, 		"162-193", 		957, 	{0,2,45},	11293, 	{3584},								{});
	Frame:SetZoneNPCData(ZONE_ASHENVALE, 			"Prince Raze", 				78.1, 	46.4, 	32, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		1330, 		"272-324", 		1063, 	{0,2,45},	11331, 	{16570, 11969, 9053, 6925},			{});
	Frame:SetZoneNPCData(ZONE_ASHENVALE, 			"Rorgish Jowl", 			36.4, 	36.4, 	25, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		757, 		"170-203", 		1026, 	{0,5,30},	6800, 	{3391},								{});
	Frame:SetZoneNPCData(ZONE_ASHENVALE, 			"Terrowulf Packlord", 		49.7, 	39.5, 	32, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		1155, 		"240-286", 		nil, 	{0,2,45},	522, 	{6507, 6576},						{{5753, 55}, {5754, 45}});
	Frame:SetZoneNPCData(ZONE_ASHENVALE, 			"Ursol'lok", 				83.4, 	48.5, 	32, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			3457, 		"68-77", 		1234, 	{0,2,45},	706, 	{17156},							{});
	Frame:SetZoneNPCData(ZONE_ASHENVALE, 			"Eck'alom", 				52.8, 	70.0, 	27, 	CLASS_RARE_ELITE, 	TYPE_ELEMENTAL,		820, 		"188-224", 		916, 	{0,5,30},	5561, 	{5276, 12548},						{});
	Frame:SetZoneNPCData(ZONE_ASHENVALE, 			"Oakpaw", 					56.0, 	62.8, 	27, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		868, 		"188-224", 		916, 	{0,5,30},	5773, 	{12160, 6816, 6819, 6817},			{});
	Frame:SetZoneNPCData(ZONE_ASHENVALE, 			"Darkslayer Mordenthal", 	75.6, 	74.0, 	23, 	CLASS_RARE, 		TYPE_HUMANOID,		615, 		"53-60", 		957, 	{0,0,5},	4155, 	{},									{}); -- Spawns very quickly. Probably bugged.
	
	
	-- Stonetalon Mountains
	Frame:SetZoneNPCData(ZONE_STONETALON_MOUNTAINS,	"Akkrilus", 				63.5, 	21.0, 	26, 	CLASS_RARE_ELITE, 	TYPE_DEMON,			676, 		"188-224", 		887, 	{0,2,45},	1912, 	{184, 1094},						{}); -- Spawn location may be wrong
	Frame:SetZoneNPCData(ZONE_STONETALON_MOUNTAINS,	"Nal'taszar", 				25.6, 	11.5, 	30, 	CLASS_RARE_ELITE, 	TYPE_DRAGONKIN,		2400, 		"223-266", 		1004, 	{0,12,0},	8471, 	{8211, 15305},						{});
	Frame:SetZoneNPCData(ZONE_STONETALON_MOUNTAINS,	"Pridewing Patriarch", 		47.8, 	46.8, 	25, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			710, 		"58-62", 		1026, 	{0,5,30},	4585, 	{744},								{{5751, 75}, {5752, 25}}); -- Has a second spawn location
	Frame:SetZoneNPCData(ZONE_STONETALON_MOUNTAINS,	"Sentinel Amarassan", 		35.3, 	15.0, 	27, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		2367, 		"197-234", 		nil, 	{0,12,0},	11356, 	{},									{});
	Frame:SetZoneNPCData(ZONE_STONETALON_MOUNTAINS,	"Vengeful Ancient", 		30.4, 	68.1, 	30, 	CLASS_RARE_ELITE, 	TYPE_ELEMENTAL,		1002, 		"214-255", 		nil, 	{0,2,45},	9591, 	{},									{});
	Frame:SetZoneNPCData(ZONE_STONETALON_MOUNTAINS,	"Brother Ravenoak", 		28.1, 	12.2, 	29, 	CLASS_ELITE, 		TYPE_HUMANOID,		2542, 		"214-254", 		975, 	{0,12,0},	4599, 	{7090, 8716, 12161, 12160},			{});
	Frame:SetZoneNPCData(ZONE_STONETALON_MOUNTAINS,	"Foreman Rigger", 			66.7, 	52.3, 	24, 	CLASS_ELITE, 		TYPE_HUMANOID,		2052, 		"171-203", 		992, 	{0,12,0},	4600, 	{6533, 6016},						{});
	Frame:SetZoneNPCData(ZONE_STONETALON_MOUNTAINS,	"Sister Riven", 			29.6, 	69.4, 	28, 	CLASS_ELITE, 		TYPE_HUMANOID,		2130, 		"205-244", 		946, 	{0,12,0},	10875, 	{184, 3356, 6725},					{});
	Frame:SetZoneNPCData(ZONE_STONETALON_MOUNTAINS,	"Sorrow Wing", 				49.3, 	36.2, 	27, 	CLASS_ELITE, 		TYPE_HUMANOID,		2400, 		"110-118", 		1097, 	{0,12,0},	11012, 	{3388, 3405},						{}); -- Large spawn area
	Frame:SetZoneNPCData(ZONE_STONETALON_MOUNTAINS,	"Taskmaster Whipfang", 		64.5, 	54.2, 	22, 	CLASS_ELITE, 		TYPE_HUMANOID,		1669, 		"197-234", 		9222, 	{0,12,0},	487, 	{16508},							{});
	
	
	-- Durotar
	Frame:SetZoneNPCData(ZONE_DUROTAR,				"Death Flayer", 			38.2, 	51.1, 	11, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			219, 		"76-90", 		667, 	{0,4,0},	2491, 	{5416},								{});
	Frame:SetZoneNPCData(ZONE_DUROTAR,				"Geolord Mottle", 			43.2, 	39.3, 	9, 		CLASS_RARE_ELITE, 	TYPE_HUMANOID,		182, 		"27-38", 		342, 	{0,4,0},	6113, 	{547, 324},							{});
	Frame:SetZoneNPCData(ZONE_DUROTAR,				"Warlord Kolkanis", 		47.9, 	77.4, 	9, 		CLASS_RARE_ELITE, 	TYPE_HUMANOID,		175, 		"27-38", 		406, 	{0,4,0},	9444, 	{12555, 8078},						{});
	Frame:SetZoneNPCData(ZONE_DUROTAR,				"Watch Commander Zalaphil", 59.2, 	57.7, 	9, 		CLASS_RARE_ELITE, 	TYPE_HUMANOID,		174, 		"27-38", 		20, 	{0,2,45},	4592, 	{7164, 11972},						{});
	Frame:SetZoneNPCData(ZONE_DUROTAR,				"Captain Flat Tusk", 		38.7, 	54.0, 	11, 	CLASS_ELITE, 		TYPE_HUMANOID,		722, 		"104-124", 		538, 	{0,4,0},	1346, 	{2457, 25710},						{});
	Frame:SetZoneNPCData(ZONE_DUROTAR,				"Felweaver Scornn", 		52.8, 	9.0, 	11, 	CLASS_ELITE, 		TYPE_HUMANOID,		550, 		"113-135", 		450, 	{0,4,0},	4594, 	{20798, 9613, 12746},				{});
	
	
	-- The Barrens
	Frame:SetZoneNPCData(ZONE_BARRENS, 				"Engineer Whirleygig", 		56.2, 	8.8, 	19, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		562, 		"162-193", 		817, 	{0,5,30},	7049, 	{7979, 8209},						{});
	Frame:SetZoneNPCData(ZONE_BARRENS, 				"Foreman Grills", 			56.3, 	8.2, 	19, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		312, 		"162-193", 		817, 	{0,2,45},	4593, 	{9080},								{}); -- Might overlap the above one
	Frame:SetZoneNPCData(ZONE_BARRENS, 				"Sludge Beast", 			57.5, 	7.0, 	19, 	CLASS_RARE_ELITE, 	TYPE_ABBERATION,	530, 		"162-193", 		nil, 	{0,2,45},	360, 	{7279},								{});
	Frame:SetZoneNPCData(ZONE_BARRENS, 				"Snort the Heckler", 		41.1, 	22.2, 	17, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			341, 		"38-44", 		748, 	{0,5,30},	2713, 	{3604, 7951},						{});
	Frame:SetZoneNPCData(ZONE_BARRENS, 				"Stonearm", 				42.0, 	24.6, 	15, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		314, 		"95-114", 		677, 	{0,5,30},	4874, 	{},									{{1355, 25}});
	Frame:SetZoneNPCData(ZONE_BARRENS, 				"Brokespear", 				57.1, 	41.2, 	17, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		403, 		"148-175", 		748, 	{0,5,30},	9448, 	{7992, 10277},						{{7559, 25}});
	Frame:SetZoneNPCData(ZONE_BARRENS, 				"Burgle Eye", 				66.1, 	58.8, 	38, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		1312, 		"292-348", 		1325, 	{0,2,0},	391, 	{},									{});
	Frame:SetZoneNPCData(ZONE_BARRENS, 				"Dishu", 					50.9, 	18.2, 	13, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			271, 		"95-114", 		608, 	{0,2,45},	1043, 	{8210},								{});
	Frame:SetZoneNPCData(ZONE_BARRENS, 				"Humar the Pridelord", 		61.6, 	32.9, 	23, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			1800, 		"244-289", 		957, 	{0,11,0},	4424, 	{3247},								{});
	Frame:SetZoneNPCData(ZONE_BARRENS, 				"Rathorian", 				48.0, 	19.2, 	15, 	CLASS_RARE_ELITE, 	TYPE_DEMON,			324, 		"95-114", 		677, 	{0,5,30},	5047, 	{13737},							{{5111, 70},{5112, 30}});
	Frame:SetZoneNPCData(ZONE_BARRENS, 				"Azzere the Skyblade", 		45.0, 	63.6, 	25, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			638, 		"53-60", 		858, 	{0,2,45},	2702, 	{13375, 6725},						{});
	Frame:SetZoneNPCData(ZONE_BARRENS, 				"Darkmist Widow", 			51.6, 	64.5, 	40, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			1933, 		"336-399", 		1709, 	{0,1,0},	2537, 	{744},								{});
	Frame:SetZoneNPCData(ZONE_BARRENS, 				"Geopriest Gukk'rok", 		43.2, 	52.1, 	19, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		456, 		"162-193", 		683, 	{0,5,30},	6116, 	{2054, 600, 6075},					{{1539, 25}});
	Frame:SetZoneNPCData(ZONE_BARRENS, 				"Silithid Harvester", 		43.1, 	70.1, 	24, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			805, 		"162-193", 		992, 	{0,2,45},	11096, 	{7278},								{{5138, 100}});
	Frame:SetZoneNPCData(ZONE_BARRENS, 				"Thunderstomp", 			47.1, 	78.2, 	24, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			575, 		"162-193", 		992, 	{0,2,45},	6085, 	{6254, 8078},						{});
	Frame:SetZoneNPCData(ZONE_BARRENS, 				"Digger Flameforge", 		47.5, 	85.5, 	24, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		757, 		"162-193", 		992, 	{0,5,30},	4596, 	{6253, 7978},						{{4785, 20}});
	Frame:SetZoneNPCData(ZONE_BARRENS, 				"Heggin Stonewhisker", 		47.0, 	83.7, 	24, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		578, 		"162-193", 		nil, 	{0,2,45},	4595, 	{6979, 6660},						{{2035, 25}});
	Frame:SetZoneNPCData(ZONE_BARRENS, 				"Malgin Barleybrew", 		49.6, 	84.3, 	25, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		770, 		"170-203", 		1026, 	{0,2,45},	4597, 	{3631, 5242},						{});
	Frame:SetZoneNPCData(ZONE_BARRENS, 				"Gesharahan", 				46.5, 	39.5, 	20, 	CLASS_ELITE, 		TYPE_NONE,			1449, 		"145-172", 		852, 	{0,12,0},	1397, 	{},									{{5182, 75},{5183, 25}});
	Frame:SetZoneNPCData(ZONE_BARRENS, 				"Takk the Leaper", 			59.6, 	8.3, 	19, 	CLASS_ELITE, 		TYPE_BEAST,			1406, 		"171-203", 		817, 	{0,12,0},	1337, 	{7165},								{});
	Frame:SetZoneNPCData(ZONE_BARRENS, 				"Aean Swiftriver", 			47.6, 	79.0, 	26, 	CLASS_ELITE, 		TYPE_HUMANOID,		1991, 		"179-213", 		922, 	{0,0,10},	4345, 	{},									{{10621, 100}}); -- Huge spawn radius up the path.
	Frame:SetZoneNPCData(ZONE_BARRENS, 				"Boahn", 					49.1, 	33.9, 	22, 	CLASS_ELITE, 		TYPE_HUMANOID,		1948, 		"162-192", 		625, 	{0,2,45},	4212, 	{8040, 20790, 9532, 8041},			{{5422, 70},{5423, 30}}); -- Spawns right ouside of Wailing Caverns.
	Frame:SetZoneNPCData(ZONE_BARRENS, 				"Trigore the Lasher", 		52.0, 	54.0, 	19, 	CLASS_ELITE, 		TYPE_HUMANOID,		1341, 		"168-200", 		nil, 	{0,2,45},	1092, 	{},									{{5425, 50},{5426, 50}}); -- Spawns right ouside of Wailing Caverns.
	Frame:SetZoneNPCData(ZONE_BARRENS, 				"Ambassador Bloodrage", 	47.7, 	90.7, 	36, 	CLASS_ELITE, 		TYPE_UNDEAD,		2370, 		"283-337", 		1149, 	{0,2,45},	7043, 	{},									{});
	Frame:SetZoneNPCData(ZONE_BARRENS, 				"Brontus", 					47.3, 	73.2, 	27, 	CLASS_ELITE, 		TYPE_BEAST,			1750, 		"136-156", 		1097, 	{0,12,0},	1308, 	{6016, 6268},						{});
	Frame:SetZoneNPCData(ZONE_BARRENS, 				"Captain Gerogg Hammertoe", 49.4, 	83.7, 	27, 	CLASS_ELITE, 		TYPE_HUMANOID,		2100, 		"197-234", 		1097, 	{0,12,0},	4598, 	{71, 3419, 1672, 15062},			{});
	Frame:SetZoneNPCData(ZONE_BARRENS, 				"Elder Mystic Razorsnout",	59.3, 	24.4, 	15, 	CLASS_ELITE, 		TYPE_HUMANOID,		908, 		"98-118", 		20, 	{0,12,0},	6095, 	{2484, 547, 594, 591},				{{4768, 50},{4771, 50}});
	Frame:SetZoneNPCData(ZONE_BARRENS, 				"Hagg Taurenbane",			43.2, 	83.2, 	26, 	CLASS_ELITE, 		TYPE_HUMANOID,		2318, 		"197-234", 		1061, 	{0,12,0},	6114, 	{15496, 13730, 9080},				{});
	Frame:SetZoneNPCData(ZONE_BARRENS, 				"Hannah Bladeleaf",			47.5, 	78.9, 	24, 	CLASS_ELITE, 		TYPE_HUMANOID,		2096, 		"185-221", 		nil, 	{0,0,10},	4348, 	{},									{}); -- Huge spawn radius up the path.
	Frame:SetZoneNPCData(ZONE_BARRENS, 				"Marcus Bel",				47.6, 	79.0, 	24, 	CLASS_ELITE, 		TYPE_HUMANOID,		900, 		"185-221", 		922, 	{0,0,10},	4347, 	{},									{}); -- Huge spawn radius up the path.
	Frame:SetZoneNPCData(ZONE_BARRENS, 				"Rocklance",				56.7, 	41.4, 	17, 	CLASS_ELITE, 		TYPE_HUMANOID,		1470, 		"154-183", 		748, 	{0,12,0},	9533, 	{15496, 7164, 11971},				{});
	Frame:SetZoneNPCData(ZONE_BARRENS, 				"Sister Rathtalon",			40.0, 	15.2, 	19, 	CLASS_ELITE, 		TYPE_HUMANOID,		1129, 		"171-203", 		683, 	{0,12,0},	10876, 	{6728, 6982, 6535},					{});
	Frame:SetZoneNPCData(ZONE_BARRENS, 				"Swiftmane",				61.4, 	34.0, 	21, 	CLASS_ELITE, 		TYPE_HUMANOID,		1551, 		"80-92", 		888, 	{0,12,0},	6084, 	{6016},								{});
	Frame:SetZoneNPCData(ZONE_BARRENS, 				"Swinegart Spearhide",		40.8, 	45.2, 	22, 	CLASS_ELITE, 		TYPE_HUMANOID,		1657, 		"171-203", 		nil, 	{0,12,0},	6117, 	{7165},								{});
	Frame:SetZoneNPCData(ZONE_BARRENS, 				"Thora Feathermoon",		47.7, 	79.1, 	25, 	CLASS_ELITE, 		TYPE_HUMANOID,		2249, 		"179-213", 		1026, 	{0,0,10},	4346, 	{},									{}); -- Huge spawn radius up the path.
	
	
	-- Desolace
	Frame:SetZoneNPCData(ZONE_DESOLACE, 			"Prince Kellen", 			78.9, 	21.3, 	33, 	CLASS_RARE_ELITE, 	TYPE_DEMON,			1278, 		"240-286", 		1304, 	{0,2,45},	6743, 	{8599},								{});
	Frame:SetZoneNPCData(ZONE_DESOLACE, 			"Giggler", 					61.3, 	28.9, 	35, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			3951, 		"252-299", 		nil, 	{0,2,45},	2714, 	{3150},								{});
	Frame:SetZoneNPCData(ZONE_DESOLACE, 			"Hissperak", 				52.9, 	50.1, 	37, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			1587, 		"281-334", 		1593, 	{0,2,45},	2076, 	{},									{});
	Frame:SetZoneNPCData(ZONE_DESOLACE, 			"Kaskk", 					51.1, 	86.1, 	40, 	CLASS_RARE_ELITE, 	TYPE_DEMON,			1765, 		"312-371", 		1964, 	{0,2,45},	14255, 	{22859},							{});
	Frame:SetZoneNPCData(ZONE_DESOLACE, 			"Accursed Slitherblade", 	42.2, 	19.0, 	38, 	CLASS_RARE, 		TYPE_HUMANOID,		4536, 		"356-384", 		nil, 	{0,2,45},	9135, 	{7947},								{});
	Frame:SetZoneNPCData(ZONE_DESOLACE, 			"Cursed Centaur", 			29.0, 	62.0, 	43, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		3552, 		"379-451", 		nil, 	{0,2,45},	11640, 	{},									{}); -- Spawns in the cave to Maraudon, but not inside of the dungeon.
	
	
	-- Mulgore
	Frame:SetZoneNPCData(ZONE_MULGORE, 				"Enforcer Emilgund", 		40.4, 	15.7, 	11, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		440, 		"76-90", 		538, 	{0,5,30},	6692, 	{},									{});
	Frame:SetZoneNPCData(ZONE_MULGORE, 				"Mazzranache", 				50.4, 	42.6, 	9, 		CLASS_RARE_ELITE, 	TYPE_BEAST,			187, 		"27-38", 		406, 	{0,5,30},	1961, 	{3583, 6268},						{{4861, 50}});
	Frame:SetZoneNPCData(ZONE_MULGORE, 				"The Rake", 				53.4, 	17.0, 	10, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			197, 		"29-42", 		20, 	{0,5,30},	1973, 	{},									{{17922, 100}});
	Frame:SetZoneNPCData(ZONE_MULGORE, 				"Snagglespear", 			48.4, 	72.0, 	9, 		CLASS_RARE_ELITE, 	TYPE_HUMANOID,		176, 		"34-48", 		406, 	{0,5,30},	275, 	{8599},								{});
	Frame:SetZoneNPCData(ZONE_MULGORE, 				"Sister Hatelash", 			36.2, 	11.3, 	11, 	CLASS_ELITE, 		TYPE_BEAST,			419, 		"80-96", 		450, 	{0,12,0},	2163, 	{6960, 9532},						{{4772, 50}});
	Frame:SetZoneNPCData(ZONE_MULGORE, 				"Ghost Howl", 				39.6, 	42.0, 	12, 	CLASS_RARE, 		TYPE_BEAST,			262, 		"32-37", 		573, 	{0,2,45},	720, 	{},									{{4854, 100}}); -- Roams clockwise around Thunderbluff
	
	
	-- Dustwallow Marsh
	Frame:SetZoneNPCData(ZONE_DUSTWALLOW_MARSH, 	"Hayoc", 					52.0, 	62.9, 	43, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			5420, 		"328-376", 		nil, 	{0,1,0},	2703, 	{21059},							{});
	Frame:SetZoneNPCData(ZONE_DUSTWALLOW_MARSH, 	"Brimgore", 				43.8, 	80.3, 	45, 	CLASS_ELITE, 		TYPE_DRAGONKIN,		5306, 		"384-458", 		3125, 	{0,1,0},	6374, 	{8873},								{}); -- Semi large spawn area
	Frame:SetZoneNPCData(ZONE_DUSTWALLOW_MARSH, 	"Dart", 					48.0, 	16.0, 	38, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			1591, 		"292-348", 		1591, 	{0,1,0},	788, 	{3147},								{});
	Frame:SetZoneNPCData(ZONE_DUSTWALLOW_MARSH, 	"Drogoth the Roamer", 		39.4, 	19.6, 	37, 	CLASS_RARE_ELITE, 	TYPE_ELEMENTAL,		1525, 		"281-334", 		nil, 	{0,8,0},	631, 	{},									{});
	Frame:SetZoneNPCData(ZONE_DUSTWALLOW_MARSH, 	"Lord Angler", 				56.6, 	62.6, 	48, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		6455, 		"393-467", 		nil, 	{0,20,0},	14257, 	{},									{});
	Frame:SetZoneNPCData(ZONE_DUSTWALLOW_MARSH, 	"Oozeworm", 				37.0, 	62.5, 	42, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			2508, 		"336-399", 		3358, 	{0,8,0},	12336, 	{},									{});
	Frame:SetZoneNPCData(ZONE_DUSTWALLOW_MARSH, 	"Ripscale", 				49.4, 	57.8, 	38, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			1653, 		"301-358", 		nil, 	{0,8,0},	2549, 	{},									{});
	Frame:SetZoneNPCData(ZONE_DUSTWALLOW_MARSH, 	"The Rot", 					50.8, 	49.8, 	44, 	CLASS_RARE_ELITE, 	TYPE_NONE,			5620, 		"344-410", 		nil, 	{0,20,0},	11140, 	{},									{});
	
	
	-- Feralas
	Frame:SetZoneNPCData(ZONE_FERALAS, 				"Emeriss", 					51.2, 	10.9, 	"??", 	CLASS_WORLD_BOSS, 	TYPE_DRAGONKIN,		832750, 	"2421-2621", 	4691, 	{0,1,0},	15366, 	{243433, 243398, 243401, 243451, 243459, 243399, 243411},				{{20644, 100}});
	Frame:SetZoneNPCData(ZONE_FERALAS, 				"Antilus the Soarer", 		55.7, 	74.0, 	49, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			6670, 		"402-478", 		2888, 	{0,2,45},	10889, 	{},									{});
	Frame:SetZoneNPCData(ZONE_FERALAS, 				"Arash-ethis", 				44.8, 	25.0, 	49, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			2667, 		"413-492", 		2944, 	{0,2,45},	7569, 	{15117, 12553},						{});
	Frame:SetZoneNPCData(ZONE_FERALAS, 				"Arcane Chimaerok", 		29.6, 	78.8, 	62, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			32148, 		"925-1103", 	4091, 	{0,0,10},	10810, 	{15122, 15797, 20223},				{{21024, 50}}); -- Can be lvl 60 or 61. Various spawn locations
	Frame:SetZoneNPCData(ZONE_FERALAS, 				"Bloodroar the Stalker", 	55.0, 	57.8, 	49, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		6670, 		"402-478", 		2888, 	{0,2,45},	7336, 	{3264, 8599},						{});
	Frame:SetZoneNPCData(ZONE_FERALAS, 				"Chimaerok", 				30.2, 	82.7, 	61, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			31353, 		"880-1047", 	3941, 	{0,0,10},	4269, 	{20629, 15797, 5708},				{{21024, 50}}); -- Can be lvl 60. Various spawn locations
	Frame:SetZoneNPCData(ZONE_FERALAS, 				"Chimaerok Devourer", 		29.6, 	75.9, 	62, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			22496, 		"880-1047", 	4241, 	{0,0,10},	9560, 	{8599, 7938},						{{21024, 50}}); -- Can be lvl 61. Various spawn locations
	Frame:SetZoneNPCData(ZONE_FERALAS, 				"Diamond Head", 			36.6, 	51.4, 	46, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		6030, 		"367-437", 		5393, 	{0,2,45},	1817, 	{5164},								{});
	Frame:SetZoneNPCData(ZONE_FERALAS, 				"Gnarl Leafbrother", 		69.2, 	57.2, 	45, 	CLASS_RARE_ELITE, 	TYPE_ELEMENTAL,		5824, 		"359-426", 		2557, 	{0,2,45},	2168, 	{11922, 6913},						{});
	Frame:SetZoneNPCData(ZONE_FERALAS, 				"Lady Szallah", 			28.2, 	67.6, 	46, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		1892, 		"379-451", 		2255, 	{0,5,50},	11262, 	{12549, 9532, 12550},				{});
	Frame:SetZoneNPCData(ZONE_FERALAS, 				"Old Grizzlegut", 			59.5, 	59.4, 	43, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			5620, 		"344-410", 		2367, 	{0,2,45},	706, 	{},									{});
	Frame:SetZoneNPCData(ZONE_FERALAS, 				"Qirot", 					76.7, 	66.2, 	47, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			3306, 		"393-467", 		2835, 	{0,5,50},	11142, 	{},									{});
	Frame:SetZoneNPCData(ZONE_FERALAS, 				"Snarler", 					80.2, 	39.6, 	42, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			2156, 		"312-334", 		2246, 	{0,5,50},	780, 	{},									{});
	
	
	-- Thousand Needles
	Frame:SetZoneNPCData(ZONE_THOUSAND_NEEDLES, 	"Achellios the Banished", 	18.2, 	35.1, 	31, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		1250, 		"272-324", 		1234, 	{0,2,0},	9418, 	{5543},								{});
	Frame:SetZoneNPCData(ZONE_THOUSAND_NEEDLES, 	"Silithid Ravager", 		68.4, 	82.3, 	37, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			4295, 		"272-324", 		1480, 	{0,2,0},	11099, 	{8255},								{{8224, 25}});
	Frame:SetZoneNPCData(ZONE_THOUSAND_NEEDLES, 	"Ironeye the Invincible", 	87.2, 	78.4, 	37, 	CLASS_ELITE, 		TYPE_BEAST,			4050, 		"295-351", 		30967, 	{0,12,0},	2076, 	{},									{{8223,40}});
	Frame:SetZoneNPCData(ZONE_THOUSAND_NEEDLES, 	"Gibblesnik", 				55.6, 	50.5, 	28, 	CLASS_RARE, 		TYPE_HUMANOID,		892, 		"60-68", 		1130, 	{0,2,45},	511, 	{7405},								{});
	Frame:SetZoneNPCData(ZONE_THOUSAND_NEEDLES, 	"Harb Foulmountain", 		32.5, 	26.8, 	27, 	CLASS_RARE, 		TYPE_HUMANOID,		960, 		"68-78", 		556, 	{0,2,0},	3898, 	{3391, 45},							{});
	Frame:SetZoneNPCData(ZONE_THOUSAND_NEEDLES, 	"Heartrazor", 				17.5, 	42.4, 	32, 	CLASS_ELITE, 		TYPE_BEAST,			3000, 		"244-289", 		1270, 	{0,12,0},	11011, 	{8256},								{});
	Frame:SetZoneNPCData(ZONE_THOUSAND_NEEDLES, 	"Vile Sting", 				70.5, 	72.9, 	35, 	CLASS_ELITE, 		TYPE_BEAST,			3656, 		"271-324", 		1373, 	{0,12,0},	10988, 	{8257},								{});
	
	
	-- Tanaris
	Frame:SetZoneNPCData(ZONE_TANARIS, 				"Greater Firebird", 		49.4, 	36.0, 	46, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			2568, 		"379-451", 		2780, 	{0,2,45},	7349, 	{16079},							{});
	Frame:SetZoneNPCData(ZONE_TANARIS, 				"Haarka the Ravenous", 		53.3, 	73.8, 	50, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			2744, 		"428-509", 		2999, 	{0,2,45},	11092, 	{21081, 3391},						{});
	Frame:SetZoneNPCData(ZONE_TANARIS, 				"Kregg Keelhaul", 			73.2, 	48.7, 	47, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		2473, 		"393-467", 		2835, 	{0,2,45},	7509, 	{11976},							{});
	Frame:SetZoneNPCData(ZONE_TANARIS, 				"Murderous Blisterpaw", 	52.3, 	33.3, 	44, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			5620, 		"344-410", 		2397, 	{0,2,45},	1534, 	{7938, 3391},						{});
	Frame:SetZoneNPCData(ZONE_TANARIS, 				"Cyclok the Mad", 			41.3, 	54.7, 	48, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		1938, 		"405-478", 		1462, 	{0,2,45},	11532, 	{13748, 11975, 6742},				{});
	Frame:SetZoneNPCData(ZONE_TANARIS, 				"Omgorn the Lost", 			38.7, 	55.6, 	50, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		2801, 		"428-509", 		nil, 	{0,2,45},	11570, 	{8599, 16856},						{{17055, 20}}); -- Can spawn in 3 different camps
	Frame:SetZoneNPCData(ZONE_TANARIS, 				"Soriid the Devourer", 		34.1, 	44.7, 	51, 	CLASS_RARE_ELITE, 	TYPE_NONE,			7116, 		"428-509", 		nil, 	{0,2,45},	11106, 	{12097, 13445},						{});
	Frame:SetZoneNPCData(ZONE_TANARIS, 				"Jin'Zallah the Sandbringer",36.6, 	24.6, 	46, 	CLASS_ELITE, 		TYPE_HUMANOID,		4996, 		"359-426", 		2255, 	{0,12,0},	9024, 	{},									{});
	Frame:SetZoneNPCData(ZONE_TANARIS, 				"Warleader Krazzilak",		38.8, 	21.7, 	45, 	CLASS_ELITE, 		TYPE_HUMANOID,		5431, 		"370-440", 		2725, 	{0,12,0},	9023, 	{18103, 6713, 9080, 17230},			{});
	
	
	-- Un'Goro Crater
	Frame:SetZoneNPCData(ZONE_UNGORO_CRATER, 		"Clutchmother Zavas", 		48.7, 	85.3, 	54, 	CLASS_RARE_ELITE, 	TYPE_NONE,			3273, 		"475-565", 		3216, 	{0,2,0},	11084, 	{15284, 14205, 12097},				{});
	Frame:SetZoneNPCData(ZONE_UNGORO_CRATER, 		"Ravasaur Matriarch", 		62.4, 	66.0, 	50, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			2867, 		"428-509", 		2999, 	{0,2,0},	11319, 	{13445, 3391},						{});
	Frame:SetZoneNPCData(ZONE_UNGORO_CRATER, 		"Uhk'loc", 					68.5, 	12.7, 	53, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			3168, 		"463-551", 		3136, 	{0,2,0},	8129, 	{9128, 12555, 10966},				{}); -- Can be lvl 52.
	Frame:SetZoneNPCData(ZONE_UNGORO_CRATER, 		"King Mosh", 				35.2, 	40.1, 	60, 	CLASS_ELITE, 		TYPE_BEAST,			65125, 		"581-692", 		3791, 	{0,12,0},	5305, 	{13847, 14100, 15550, 14331},		{}); -- Can be lvl 59. Large spawn radius
	Frame:SetZoneNPCData(ZONE_UNGORO_CRATER, 		"Gruff", 					38.0, 	75.5, 	57, 	CLASS_ELITE, 		TYPE_BEAST,			14409, 		"541-643", 		3380, 	{0,12,0},	10932, 	{15549, 15548},						{});
	
	
	-- Silithus
	Frame:SetZoneNPCData(ZONE_SILITHUS, 			"Gretheer", 				39.3, 	55.4, 	58, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			8787, 		"516-612", 		3380, 	{0,5,50},	1104, 	{21787, 745},						{});
	Frame:SetZoneNPCData(ZONE_SILITHUS, 			"Grubthor", 				44.4, 	80.8, 	58, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			3854, 		"530-630", 		3435, 	{0,5,50},	14523, 	{5568},								{});
	Frame:SetZoneNPCData(ZONE_SILITHUS, 			"Huricanian", 				25.9, 	13.6, 	58, 	CLASS_RARE_ELITE, 	TYPE_ELEMENTAL,		3067, 		"543-647", 		2788, 	{0,5,50},	14525, 	{15659},							{}); -- Has multiple spawn points
	Frame:SetZoneNPCData(ZONE_SILITHUS, 			"Krellack", 				63.2, 	16.7, 	56, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			3488, 		"503-599", 		3327, 	{0,2,45},	6068, 	{17170},							{});
	Frame:SetZoneNPCData(ZONE_SILITHUS, 			"Lapress", 					64.3, 	83.1, 	60, 	CLASS_RARE_ELITE, 	TYPE_NONE,			13575, 		"925-1103", 	3791, 	{0,12,0},	14521, 	{13445},							{}); -- Has multiple spawn points
	Frame:SetZoneNPCData(ZONE_SILITHUS, 			"Setis", 					22.0, 	80.1, 	62, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		10908, 		"878-959", 		4091, 	{0,12,0},	5965, 	{10887, 16727},						{});
	Frame:SetZoneNPCData(ZONE_SILITHUS, 			"Twilight Lord Everun", 	18.9, 	85.6, 	60, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		1259, 		"835-994", 		3075, 	{0,5,50},	14526, 	{19816, 17439},						{{20406, 8},{20407, 8},{20408, 8},{20451, 4}});
	Frame:SetZoneNPCData(ZONE_SILITHUS, 			"Twilight Prophet", 		26.5, 	71.2, 	60, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		7396, 		"369-455", 		1923, 	{0,0,10},	15373, 	{15305, 17366, 15531, 22884},		{{20404, 100}}); -- Multiple spawn points
	Frame:SetZoneNPCData(ZONE_SILITHUS, 			"Zora", 					21.0, 	61.3, 	59, 	CLASS_RARE_ELITE, 	TYPE_NONE,			9941, 		"604-719", 		3489, 	{0,12,0},	14522, 	{21067},							{{20404, 100}});
	Frame:SetZoneNPCData(ZONE_SILITHUS, 			"Rex Ashil", 				45.8, 	28.1, 	57, 	CLASS_ELITE, 		TYPE_NONE,			8308, 		"541-643", 		5034, 	{0,12,0},	12153, 	{12097},							{});
	
	
	-- Winterspring
	Frame:SetZoneNPCData(ZONE_WINTERSPRING, 		"Rak'shiri", 				50.3, 	13.1, 	59, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			9038, 		"530-630", 		3380, 	{0,2,45},	10054, 	{15716, 7399},						{});
	Frame:SetZoneNPCData(ZONE_WINTERSPRING, 		"Mezzir the Howler", 		45.0, 	37.4, 	55, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		3721, 		"503-599", 		3271, 	{0,5,30},	3208,	{15971, 3131, 14100},				{});
	Frame:SetZoneNPCData(ZONE_WINTERSPRING, 		"Lady Hederine", 			65.0, 	80.3, 	61, 	CLASS_RARE_ELITE, 	TYPE_DEMON,			29832, 		"536-579", 		3316, 	{0,12,0},	10925,	{17146},							{});
	Frame:SetZoneNPCData(ZONE_WINTERSPRING, 		"Grizzle Snowpaw", 			67.0, 	36.0, 	59, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		4126, 		"543-647", 		2832, 	{0,6,30},	9491,	{8364, 12548, 15793},				{});
	Frame:SetZoneNPCData(ZONE_WINTERSPRING, 		"Azurous", 					59.5, 	43.2, 	59, 	CLASS_ELITE, 		TYPE_DRAGONKIN,		8958, 		"568-675", 		3489, 	{0,12,0},	6373,	{16099},							{});
	Frame:SetZoneNPCData(ZONE_WINTERSPRING, 		"General Colbatann", 		55.3, 	49.8, 	57, 	CLASS_ELITE, 		TYPE_DRAGONKIN,		8318, 		"541-643", 		3380, 	{0,12,0},	9489,	{},									{}); -- Can be lvl 56
	Frame:SetZoneNPCData(ZONE_WINTERSPRING, 		"Kashoch the Reaver", 		63.4, 	70.2, 	61, 	CLASS_ELITE, 		TYPE_GIANT,			19504, 		"873-1039", 	3791, 	{0,12,0},	10317,	{15284},							{});
	
	
	
	-- Eastern Plaguelands
	Frame:SetZoneNPCData(ZONE_EASTERN_PLAGUELANDS, 	"Deathspeaker Selendre",	85.7, 	45.3, 	56, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		2572, 		"503-599", 		1686, 	{0,20,0},	10432,	{13338, 17173, 15232},				{});
	Frame:SetZoneNPCData(ZONE_EASTERN_PLAGUELANDS, 	"Duggan Wildhammer",		39.3, 	70.5, 	55, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		3372, 		"489-582", 		3271, 	{0,20,0},	10374,	{15284, 6660},						{});
	Frame:SetZoneNPCData(ZONE_EASTERN_PLAGUELANDS, 	"Gish the Unmoving",		58.8, 	51.1, 	57, 	CLASS_RARE_ELITE, 	TYPE_UNDEAD,		8536, 		"503-599", 		4955, 	{0,20,0},	7856,	{16564, 13445},						{});
	Frame:SetZoneNPCData(ZONE_EASTERN_PLAGUELANDS, 	"Hed'mush the Rotting",		68.0, 	51.1, 	57, 	CLASS_RARE_ELITE, 	TYPE_UNDEAD,		4077, 		"516-612", 		3380, 	{0,20,0},	10709,	{12627, 14099},						{});
	Frame:SetZoneNPCData(ZONE_EASTERN_PLAGUELANDS, 	"High General Abbendis",	88.5, 	86.5, 	59, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		9380, 		"604-719", 		2832, 	{0,12,0},	10431,	{9128, 13730, 17143},				{});
	Frame:SetZoneNPCData(ZONE_EASTERN_PLAGUELANDS, 	"Lord Darkscythe",			26.2, 	32.8, 	57, 	CLASS_RARE_ELITE, 	TYPE_UNDEAD,		3429, 		"516-612", 		3380, 	{0,12,0},	7847,	{15284, 11971},						{{16039, 50}});
	Frame:SetZoneNPCData(ZONE_EASTERN_PLAGUELANDS, 	"Ranger Lord Hawkspear", 	52.2, 	18.5, 	60, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		4146, 		"835-994", 		3791, 	{0,12,0},	10375,	{11978, 15547, 12057},				{});
	Frame:SetZoneNPCData(ZONE_EASTERN_PLAGUELANDS, 	"Warlord Thresh'jin", 		69.0, 	18.8, 	58, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		4197, 		"530-630", 		3435, 	{0,20,0},	10452,	{9080, 11971, 15576},				{});
	Frame:SetZoneNPCData(ZONE_EASTERN_PLAGUELANDS, 	"Zul'Brin Warpbranch", 		72.2, 	16.9, 	60, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		9294, 		"543-647", 		1770, 	{0,20,0},	10443,	{20831, 15039, 12491, 17172},		{});
	Frame:SetZoneNPCData(ZONE_EASTERN_PLAGUELANDS, 	"Nerubian Overseer", 		10.5, 	36.6, 	60, 	CLASS_RARE, 		TYPE_UNDEAD,		18312, 		"625-718", 		3791, 	{0,12,0},	14698,	{15471},							{}); -- Large spawn radius along path.
	
	
	-- Western Plaguelands
	Frame:SetZoneNPCData(ZONE_WESTERN_PLAGUELANDS, 	"Foreman Jerris", 			45.6, 	9.2, 	63, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		11204, 		"889-972", 		4391, 	{0,20,0},	10340,	{15618, 3417},						{});
	Frame:SetZoneNPCData(ZONE_WESTERN_PLAGUELANDS, 	"Foreman Marcrid", 			49.0, 	32.7, 	58, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		3800, 		"558-664", 		3435, 	{0,20,0},	10354,	{15284, 19730},						{{12836, 100}});
	Frame:SetZoneNPCData(ZONE_WESTERN_PLAGUELANDS, 	"Foulmane", 				46.3, 	52.4, 	52, 	CLASS_RARE_ELITE, 	TYPE_UNDEAD,		3103, 		"503-599", 		3108, 	{0,12,0},	519,	{3427, 13445, 3391},				{});
	Frame:SetZoneNPCData(ZONE_WESTERN_PLAGUELANDS, 	"Scarlet Interrogator", 	45.1, 	15.3, 	62, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		10908, 		"878-959", 		4091, 	{0,20,0},	10343,	{20294},							{});
	Frame:SetZoneNPCData(ZONE_WESTERN_PLAGUELANDS, 	"The Husk", 				63.0, 	82.0, 	62, 	CLASS_RARE_ELITE, 	TYPE_ELEMENTAL,		4650, 		"876-1043", 	4391, 	{0,20,0},	9013,	{29306, 3604},						{}); -- Odd Entry
	Frame:SetZoneNPCData(ZONE_WESTERN_PLAGUELANDS, 	"Scarlet Judge", 			42.2, 	18.5, 	60, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		7518, 		"835-994", 		3075, 	{0,20,0},	10355,	{14518, 13005, 13953},				{});
	Frame:SetZoneNPCData(ZONE_WESTERN_PLAGUELANDS, 	"Scarlet Smith", 			43.6, 	12.9, 	60, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		9294, 		"543-647", 		5156, 	{0,20,0},	10349,	{11428, 12057},						{{12719, 100}});
	Frame:SetZoneNPCData(ZONE_WESTERN_PLAGUELANDS, 	"Araj the Summoner", 		45.3, 	69.2, 	61, 	CLASS_RARE_ELITE, 	TYPE_UNDEAD,		8258, 		"905-1077", 	3316, 	{0,0,10},	7919,	{18661, 20005, 15532, 15497, 17231},{{17114, 100},{17759,100}}); -- Gives a quest item for a trinket
	Frame:SetZoneNPCData(ZONE_WESTERN_PLAGUELANDS, 	"Lord Maldazzar", 			54.2, 	80.4, 	56, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		2883, 		"503-599", 		2699, 	{0,20,0},	10356,	{},									{});
	Frame:SetZoneNPCData(ZONE_WESTERN_PLAGUELANDS, 	"Putridius", 				48.0, 	67.4, 	58, 	CLASS_RARE_ELITE, 	TYPE_UNDEAD,		9563, 		"821-898", 		3435, 	{0,20,0},	10612,	{17650, 10101, 12946, 10966},		{});
	Frame:SetZoneNPCData(ZONE_WESTERN_PLAGUELANDS, 	"Scarlet High Clerist", 	56.9, 	34.8, 	63, 	CLASS_ELITE, 		TYPE_HUMANOID,		7635, 		"914-1088", 	3795, 	{0,20,0},	10342,	{15586, 17141, 15585},				{});
	Frame:SetZoneNPCData(ZONE_WESTERN_PLAGUELANDS, 	"Scarlet Executioner", 		45.7, 	18.8, 	61, 	CLASS_ELITE, 		TYPE_HUMANOID,		10111, 		"873-1039", 	3791, 	{0,20,0},	10344,	{15284, 8599, 7160, 16856},			{});
	
	
	-- Tirisfall Glades
	Frame:SetZoneNPCData(ZONE_TIRISFAL_GLADES, 		"Bayne", 					39.9, 	42.2, 	10, 	CLASS_RARE_ELITE, 	TYPE_DEMON,			195, 		"34-48", 		512, 	{0,0,5},	7892,	{13443, 3604},						{});
	Frame:SetZoneNPCData(ZONE_TIRISFAL_GLADES, 		"Deeb", 					63.3, 	27.5, 	12, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		229, 		"76-90", 		479, 	{0,0,5},	1994,	{9532, 2607},						{{4303, 33}}); -- Respawn timer probably wrong
	Frame:SetZoneNPCData(ZONE_TIRISFAL_GLADES, 		"Farmer Solliden", 			38.0, 	52.2, 	8, 		CLASS_RARE_ELITE, 	TYPE_HUMANOID,		155, 		"23-33", 		316, 	{0,0,5},	3535,	{11976},							{{4261, 100},{3334, 25}}); -- Respawn timer probably wrong
	Frame:SetZoneNPCData(ZONE_TIRISFAL_GLADES, 		"Fellicent's Shade", 		75.0, 	60.5, 	12, 	CLASS_RARE_ELITE, 	TYPE_UNDEAD,		241, 		"76-90", 		479, 	{0,0,5},	5430,	{11975, 7068},						{}); -- Respawn timer probably wrong
	Frame:SetZoneNPCData(ZONE_TIRISFAL_GLADES, 		"Lost Soul", 				53.2, 	48.4, 	7, 		CLASS_RARE_ELITE, 	TYPE_UNDEAD,		136, 		"22-30", 		207, 	{0,0,5},	985,	{7713},								{{3322, 100}}); -- Can be lvl 6, Large spawn area.
	Frame:SetZoneNPCData(ZONE_TIRISFAL_GLADES, 		"Muad", 					37.3, 	41.6, 	10, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		185, 		"29-42", 		426, 	{0,0,5},	2597,	{332, 2607},						{{4302, 33}});
	Frame:SetZoneNPCData(ZONE_TIRISFAL_GLADES, 		"Ressan the Needler", 		42.9, 	67.6, 	11, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			277, 		"23-26", 		538, 	{0,0,5},	9750,	{8281},								{});
	Frame:SetZoneNPCData(ZONE_TIRISFAL_GLADES, 		"Sri'skulk", 				88.2, 	51.4, 	13, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			338, 		"84-99", 		20, 	{0,20,0},	418,	{},									{});
	Frame:SetZoneNPCData(ZONE_TIRISFAL_GLADES, 		"Tormented Spirit", 		45.6, 	31.6, 	9, 		CLASS_RARE_ELITE, 	TYPE_UNDEAD,		176, 		"27-38", 		20, 	{0,20,0},	9534,	{7713},								{{3323, 100}}); -- Can be lvl 8.
	
	
	-- Alterac Mountains
	Frame:SetZoneNPCData(ZONE_ALTERAC_MOUNTAINS, 	"Gravis Slipknot", 			61.4, 	43.3, 	36, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		1649, 		"272-324", 		1480, 	{0,20,0},	2582,	{},									{});
	Frame:SetZoneNPCData(ZONE_ALTERAC_MOUNTAINS, 	"Stone Fury", 				80.1, 	46.9, 	37, 	CLASS_RARE_ELITE, 	TYPE_ELEMENTAL,		1653, 		"281-334", 		2366, 	{0,20,0},	1162,	{6524, 5568},						{});
	Frame:SetZoneNPCData(ZONE_ALTERAC_MOUNTAINS, 	"Cranky Benj", 				27.7, 	41.2, 	32, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			2066, 		"234-278", 		1884, 	{0,20,0},	5026,	{},									{});
	Frame:SetZoneNPCData(ZONE_ALTERAC_MOUNTAINS, 	"Lo'Grosh", 				52.1, 	46.9, 	39, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		1213, 		"292-348", 		974, 	{0,20,0},	11566,	{6742, 2601, 8814},					{{4810, 100},{1678, 25},{6327, 25}}); -- In a cave
	Frame:SetZoneNPCData(ZONE_ALTERAC_MOUNTAINS, 	"Skhowl", 					31.4, 	51.5, 	36, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		4121, 		"260-310", 		1480, 	{0,12,0},	1078,	{6253, 15971, 16508},				{{3011, 75},{6331, 25}});
	
	
	-- Silverpine Forest
	Frame:SetZoneNPCData(ZONE_SILVERPINE_FOREST, 	"Gorefang", 				59.5, 	7.6, 	13, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			270, 		"29-33", 		608, 	{0,12,0},	11413,	{13445},							{});
	Frame:SetZoneNPCData(ZONE_SILVERPINE_FOREST, 	"Krethis Shadowspinner", 	35.7, 	8.3, 	15, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			299, 		"30-35", 		566, 	{0,12,0},	368,	{12040, 17439},						{});
	Frame:SetZoneNPCData(ZONE_SILVERPINE_FOREST, 	"Old Vicejaw", 				53.9, 	51.9, 	14, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			374, 		"30-35", 		642, 	{0,12,0},	982,	{13446},							{});
	Frame:SetZoneNPCData(ZONE_SILVERPINE_FOREST, 	"Rot Hide Bruiser", 		64.7, 	23.1, 	22, 	CLASS_RARE_ELITE, 	TYPE_UNDEAD,		554, 		"148-175", 		922, 	{0,12,0},	10850,	{},									{{5975, 75},{4439, 25}});
	Frame:SetZoneNPCData(ZONE_SILVERPINE_FOREST, 	"Snarlmane", 				65.1, 	25.1, 	23, 	CLASS_RARE_ELITE, 	TYPE_UNDEAD,		883, 		"162-193", 		957, 	{0,12,0},	965,	{3387},								{{4445, 25}});
	Frame:SetZoneNPCData(ZONE_SILVERPINE_FOREST, 	"Ravenclaw Regent", 		57.0, 	69.0, 	22, 	CLASS_RARE_ELITE, 	TYPE_UNDEAD,		502, 		"170-203", 		nil, 	{0,12,0},	1019,	{7645, 970},						{{5969, 75},{6628, 25}});
	
	
	-- Hinterlands
	Frame:SetZoneNPCData(ZONE_HINTERLANDS, 			"Lethon", 					63.3, 	27.8, 	"??", 	CLASS_WORLD_BOSS, 	TYPE_DRAGONKIN,		832750, 	"4541-5042", 	4691, 	{0,1,0},	15365,	{243433, 243398, 243401, 243399, 243468, 243411, 243529},	{{20644, 100}});
	Frame:SetZoneNPCData(ZONE_HINTERLANDS, 			"Ironback", 				81.5, 	49.2, 	51, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			2964, 		"451-537", 		6040, 	{0,20,0},	7840,	{},									{});
	Frame:SetZoneNPCData(ZONE_HINTERLANDS, 			"Jalinde Summerdrake", 		30.3, 	48.0, 	49, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		2803, 		"451-537", 		nil, 	{0,20,0},	4731,	{},									{});
	Frame:SetZoneNPCData(ZONE_HINTERLANDS, 			"Retherokk the Berserker", 	48.6, 	64.0, 	48, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		2754, 		"402-478", 		2888, 	{0,12,0},	6512,	{8599, 3391},						{{8153, 80}}); -- Large spawn area
	Frame:SetZoneNPCData(ZONE_HINTERLANDS, 			"The Reak", 				58.9, 	43.1, 	50, 	CLASS_RARE_ELITE, 	TYPE_NONE,			6891, 		"413-492", 		2944, 	{0,20,0},	1306,	{7279},								{});
	Frame:SetZoneNPCData(ZONE_HINTERLANDS, 			"Witherheart the Stalker",  33.1, 	70.3, 	45, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		2227, 		"367-437", 		2725, 	{0,20,0},	6479,	{30798},							{});
	Frame:SetZoneNPCData(ZONE_HINTERLANDS, 			"Zul'arek Hatefowler",  	32.4, 	56.9, 	43, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		2089, 		"379-451", 		2397, 	{0,20,0},	6479,	{17228, 6726},						{{8153, 65}});
	Frame:SetZoneNPCData(ZONE_HINTERLANDS, 			"Razortalon", 				37.1, 	45.3, 	44, 	CLASS_RARE, 		TYPE_HUMANOID,		2138, 		"112-128", 		2557, 	{0,12,0},	5927,	{13443, 13584, 3604},				{}); -- Large spawn area
	Frame:SetZoneNPCData(ZONE_HINTERLANDS, 			"Mith'rethis the Enchanter",63.9, 	77.6, 	52, 	CLASS_ELITE, 		TYPE_HUMANOID,		6003, 		"526-626", 		2522, 	{0,20,0},	6512,	{3443, 15654, 11436},				{{17050, 10}});
	Frame:SetZoneNPCData(ZONE_HINTERLANDS, 			"Grimungous",				70.2, 	55.4, 	50, 	CLASS_ELITE, 		TYPE_GIANT,			6608, 		"446-531", 		2999, 	{0,20,0},	12816,	{},									{});
	
	
	-- Hillsbrad Foothills
	Frame:SetZoneNPCData(ZONE_HILLSBRAD_FOOTHILLS, 	"Araga",  					35.3, 	11.5, 	35, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			1331, 		"260-310", 		nil, 	{0,12,0},	1933,	{},									{{4414, 1.5}});
	Frame:SetZoneNPCData(ZONE_HILLSBRAD_FOOTHILLS, 	"Creepthess",  				38.6, 	58.4, 	24, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			664, 		"162-193", 		992, 	{0,20,0},	1091,	{},									{});
	Frame:SetZoneNPCData(ZONE_HILLSBRAD_FOOTHILLS, 	"Dalaran Spellscribe",  	8.9, 	23.8, 	21, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		438, 		"148-175", 		480, 	{0,12,0},	3589,	{5276, 15784, 20792},				{{4436, 75},{4437, 25},{8491, 17}});
	Frame:SetZoneNPCData(ZONE_HILLSBRAD_FOOTHILLS, 	"Jimmy the Bleeder",  		60.1, 	9.1, 	23, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		617, 		"162-193", 		957, 	{0,20,0},	3616,	{},									{});
	Frame:SetZoneNPCData(ZONE_HILLSBRAD_FOOTHILLS, 	"Lady Zephris",  			64.5, 	79.7, 	33, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		907, 		"281-334", 		712, 	{0,12,0},	4978,	{},									{});
	Frame:SetZoneNPCData(ZONE_HILLSBRAD_FOOTHILLS, 	"Old Cliff Jumper",  		96.9, 	14.6, 	42, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		1988, 		"336-399", 		2246, 	{0,20,0},	11414,	{},									{});
	Frame:SetZoneNPCData(ZONE_HILLSBRAD_FOOTHILLS, 	"Ro'Bark",  				65.6, 	60.0, 	28, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		959, 		"194-231", 		1130, 	{0,12,0},	491,	{},									{});
	Frame:SetZoneNPCData(ZONE_HILLSBRAD_FOOTHILLS, 	"Scargil",  				29.1, 	73.6, 	30, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		5367, 		"214-255", 		1200, 	{0,12,0},	540,	{},									{});
	Frame:SetZoneNPCData(ZONE_HILLSBRAD_FOOTHILLS, 	"Big Samras",  				86.0, 	39.9, 	27, 	CLASS_RARE, 		TYPE_BEAST,			926, 		"59-68", 		407, 	{0,12,0},	706,	{},									{});
	Frame:SetZoneNPCData(ZONE_HILLSBRAD_FOOTHILLS, 	"Narillasanz",  			73.3, 	5.6, 	44, 	CLASS_ELITE, 		TYPE_DRAGONKIN,		13635, 		"371-441", 		2082, 	{0,12,0},	6371,	{18435, 8362},						{}); -- Huge spawn radius. Also goes into Alterac Mountains.
	Frame:SetZoneNPCData(ZONE_HILLSBRAD_FOOTHILLS, 	"Tamra Stormpike",  		71.8, 	81.5, 	28, 	CLASS_ELITE, 		TYPE_HUMANOID,		2477, 		"205-244", 		946, 	{0,20,0},	3763,	{18435, 8362},						{});
	
	
	-- Arathi Highlands
	Frame:SetZoneNPCData(ZONE_ARATHI_HIGHLANDS, 	"Prince Nazjak", 			19.4, 	90.2, 	41, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		1726, 		"359-426", 		2101, 	{0,8,0},	6763,	{},									{{1404, 45}});
	Frame:SetZoneNPCData(ZONE_ARATHI_HIGHLANDS, 	"Geomancer Flintdagger", 	82.8, 	32.2, 	40, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		1200, 		"64-75", 		1035, 	{0,2,0},	10911,	{2601, 20823},						{});
	Frame:SetZoneNPCData(ZONE_ARATHI_HIGHLANDS, 	"Singer", 					32.3, 	31.0, 	34, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		2480, 		"281-334", 		1121, 	{0,2,0},	4026,	{13730, 14515},						{{5181, 75},{5180, 25}});
	Frame:SetZoneNPCData(ZONE_ARATHI_HIGHLANDS, 	"Darbel Montrose", 			27.4, 	62.8, 	39, 	CLASS_ELITE, 		TYPE_HUMANOID,		5125, 		"318-378", 		nil, 	{0,2,0},	4027,	{8994, 12741, 9613, 8722},			{});
	Frame:SetZoneNPCData(ZONE_ARATHI_HIGHLANDS, 	"Foulbelly", 				21.6, 	65.4, 	42, 	CLASS_ELITE, 		TYPE_HUMANOID,		6817, 		"396-471", 		nil, 	{0,12,0},	11551,	{3106, 3583, 3256, 7992},			{});
	Frame:SetZoneNPCData(ZONE_ARATHI_HIGHLANDS, 	"Ruul Onestone", 			18.2, 	68.6, 	39, 	CLASS_ELITE, 		TYPE_HUMANOID,		3539, 		"318-378", 		nil, 	{0,12,0},	11572,	{6742, 9532, 6219},					{});
	Frame:SetZoneNPCData(ZONE_ARATHI_HIGHLANDS, 	"Kovork", 					23.0, 	45.0, 	37, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		4295, 		"272-324", 		nil, 	{0,8,0},	610,	{8269},								{{5256, 25}}); -- Spawns in cave.
	Frame:SetZoneNPCData(ZONE_ARATHI_HIGHLANDS, 	"Molok the Crusher", 		54.0, 	81.0, 	39, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		1664, 		"272-324", 		nil, 	{0,8,0},	536,	{6253},								{}); -- Spawns in cave.
	Frame:SetZoneNPCData(ZONE_ARATHI_HIGHLANDS, 	"Nimar the Slayer", 		72.0, 	65.8, 	37, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		1568, 		"281-334", 		nil, 	{0,8,0},	4033,	{7160, 17207},						{{2622, 90},{5257, 10}});
	Frame:SetZoneNPCData(ZONE_ARATHI_HIGHLANDS, 	"Zalas Witherbark", 		68.0, 	75.0, 	40, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		4842, 		"301-358", 		nil, 	{0,12,0},	4003,	{512, 851},							{}); -- Spawns in a cave
	
	
	-- Wetlands
	Frame:SetZoneNPCData(ZONE_WETLANDS, 			"Dragonmaw Battlemaster", 	45.3, 	44.4, 	30, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		1016, 		"214-255", 		1009, 	{0,20,0},	4912,	{8599, 11839},						{});
	Frame:SetZoneNPCData(ZONE_WETLANDS, 			"Garneg Charskull", 		38.4, 	46.1, 	29, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		671, 		"205-244", 		975, 	{0,2,0},	4913,	{184, 15039, 6725},					{{6200, 70},{3392, 30}});
	Frame:SetZoneNPCData(ZONE_WETLANDS, 			"Leech Widow", 				47.3, 	59.2, 	24, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			656, 		"53-61", 		992, 	{0,20,0},	955,	{3388},								{{4444, 70},{6199, 30}}); -- Spawns in a cave
	Frame:SetZoneNPCData(ZONE_WETLANDS, 			"Ma'ruk Wyrmscale", 		48.1, 	74.7, 	23, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		615, 		"156-186", 		nil, 	{0,2,0},	4914,	{9128},								{{5750, 75},{5749, 25}});
	Frame:SetZoneNPCData(ZONE_WETLANDS, 			"Razormaw Matriarch", 		69.9, 	29.2, 	30, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			3145, 		"68-77", 		1871, 	{0,2,0},	11316,	{7938, 3147},						{{6198, 65},{4463, 35}}); -- Spawns in a cave
	Frame:SetZoneNPCData(ZONE_WETLANDS, 			"Scalebane Royal Guard", 	84.4, 	69.1, 	62, 	CLASS_RARE_ELITE, 	TYPE_DRAGONKIN,		9860, 		"905-1077", 	6319, 	{0,0,10},	8315,	{16079, 16856},						{}); -- Can be lvl 61. Large spawn area
	Frame:SetZoneNPCData(ZONE_WETLANDS, 			"Gnawbone", 				30.1, 	30.7, 	25, 	CLASS_RARE, 		TYPE_HUMANOID,		1782, 		"59-67", 		992, 	{0,2,0},	543,	{11977},							{});
	Frame:SetZoneNPCData(ZONE_WETLANDS, 			"Mirelow", 					23.7, 	29.4, 	25, 	CLASS_RARE, 		TYPE_ELEMENTAL,		782, 		"64-74", 		1026, 	{0,20,0},	631,	{12747},							{});
	Frame:SetZoneNPCData(ZONE_WETLANDS, 			"Sludginn", 				12.6, 	67.5, 	30, 	CLASS_RARE, 		TYPE_NONE,			969, 		"65-75", 		1780, 	{0,20,0},	8834,	{3335, 3358},						{});
	
	
	-- Loch Modan
	Frame:SetZoneNPCData(ZONE_LOCH_MODAN, 			"Boss Galgosh", 			68.1, 	65.9, 	22, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		567, 		"170-203", 		922, 	{0,2,30},	1194,	{30798, 3019},						{{1215, 65},{1938, 35}});
	Frame:SetZoneNPCData(ZONE_LOCH_MODAN, 			"Grizlak", 					34.6, 	27.1, 	15, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		292, 		"95-114", 		566, 	{0,2,30},	774,	{6074},								{{2284, 55},{6195, 45}});
	Frame:SetZoneNPCData(ZONE_LOCH_MODAN, 			"Large Loch Crocolisk", 	58.9, 	31.1, 	22, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			590, 		"47-55", 		922, 	{0,2,30},	831,	{3427},								{{3563, 70},{6197, 30}});
	Frame:SetZoneNPCData(ZONE_LOCH_MODAN, 			"Lord Condar", 				77.7, 	74.9, 	16, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			356, 		"36-41", 		695, 	{0,2,30},	14313,	{},									{});
	Frame:SetZoneNPCData(ZONE_LOCH_MODAN, 			"Magosh", 					70.1, 	66.4, 	21, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		468, 		"148-175", 		740, 	{0,2,30},	14313,	{11986,9532,2606},					{{2241, 60},{3571, 40}});
	Frame:SetZoneNPCData(ZONE_LOCH_MODAN, 			"Shanda the Spinner", 		78.1, 	52.4, 	25, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			1333, 		"44-50", 		1239, 	{0,2,30},	1103,	{},									{});
	Frame:SetZoneNPCData(ZONE_LOCH_MODAN, 			"Digmaster Shovelphlange", 	34.3, 	97.0, 	38, 	CLASS_ELITE, 		TYPE_HUMANOID,		6917, 		"304-361", 		1709, 	{0,12,0},	7220,	{7164, 8380},						{{9382, 75},{9378, 15},{9375, 10}});
	Frame:SetZoneNPCData(ZONE_LOCH_MODAN, 			"Emogg the Crusher", 		69.1, 	25.0, 	19, 	CLASS_ELITE, 		TYPE_HUMANOID,		1329, 		"171-203", 		817, 	{0,12,0},	3189,	{},									{});
	
	
	-- Dun Morogh
	Frame:SetZoneNPCData(ZONE_DUN_MOROGH, 			"Bjarn", 					55.6, 	58.5, 	12, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			247, 		"26-31", 		573, 	{0,0,30},	913,	{3130, 3147},						{{2069, 25}});
	Frame:SetZoneNPCData(ZONE_DUN_MOROGH, 			"Edan the Howler", 			39.0, 	47.5, 	9, 		CLASS_RARE_ELITE, 	TYPE_HUMANOID,		176, 		"24-38", 		406, 	{0,1,0},	931,	{3129},								{{3008, 70},{3225, 30}});
	Frame:SetZoneNPCData(ZONE_DUN_MOROGH, 			"Gibblewilt", 				27.4, 	36.2, 	11, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		199, 		"76-90", 		286, 	{0,1,0},	7807,	{9532},								{{10553, 50},{10554, 50}});
	Frame:SetZoneNPCData(ZONE_DUN_MOROGH, 			"Great Father Arctikus", 	22.8, 	52.1, 	11, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		191, 		"104-124", 		450, 	{0,1,0},	5625,	{465, 2053, 139},					{{2546, 75},{3223, 25}});
	Frame:SetZoneNPCData(ZONE_DUN_MOROGH, 			"Hammerspine", 				71.5, 	51.3, 	12, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		327, 		"76-90", 		573, 	{0,1,0},	830,	{3391},								{{763, 80},{2254, 20}});
	Frame:SetZoneNPCData(ZONE_DUN_MOROGH, 			"Timber", 					34.2, 	41.8, 	10, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			198, 		"21-24", 		512, 	{0,1,0},	11422,	{3150},								{{3224, 75},{1965, 25}});
	
	
	-- Badlands
	Frame:SetZoneNPCData(ZONE_BADLANDS, 			"War Golem", 				52.4, 	19.5, 	36, 	CLASS_RARE_ELITE, 	TYPE_ELEMENTAL,		1452, 		"272-324", 		2197, 	{0,20,0},	5747,	{9576},								{});
	Frame:SetZoneNPCData(ZONE_BADLANDS, 			"7:XT", 					55.1, 	83.6, 	41, 	CLASS_RARE_ELITE, 	TYPE_MECHANICAL,	1564, 		"336-399", 		2101, 	{0,20,0},	6889,	{},									{{7191, 18},{10561, 12},{10505, 9},{9060, 3}});
	Frame:SetZoneNPCData(ZONE_BADLANDS, 			"Shadowforge Commander", 	41.8, 	26.9, 	40, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		1744, 		"312-371", 		2921, 	{0,20,0},	4937,	{1032},								{{4611, 50}});
	Frame:SetZoneNPCData(ZONE_BADLANDS, 			"Rumbler", 					14.7, 	89.3, 	45, 	CLASS_RARE_ELITE, 	TYPE_ELEMENTAL,		2345, 		"367-437", 		4059, 	{0,2,50},	8550,	{6524,5568},						{});
	Frame:SetZoneNPCData(ZONE_BADLANDS, 			"Barnabus", 				46.3, 	74.3, 	39, 	CLASS_RARE, 		TYPE_BEAST,			2376, 		"139-159", 		1709, 	{0,20,0},	9372,	{},									{});
	Frame:SetZoneNPCData(ZONE_BADLANDS, 			"Broken Tooth", 			59.7, 	29.4, 	37, 	CLASS_RARE, 		TYPE_BEAST,			1073, 		"32-36", 		1593, 	{0,2,50},	6082,	{145,8312,14267},					{});
	Frame:SetZoneNPCData(ZONE_BADLANDS, 			"Zaricotl", 				56.1, 	61.7, 	55, 	CLASS_ELITE, 		TYPE_BEAST,			8596, 		"512-609", 		3271, 	{0,12,0},	1210,	{},									{{4613, 100}});
	Frame:SetZoneNPCData(ZONE_BADLANDS, 			"Anathemus", 				23.7, 	74.2, 	45, 	CLASS_ELITE, 		TYPE_GIANT,			8190, 		"396-471", 		2725, 	{0,20,0},	10040,	{11671},							{});
	Frame:SetZoneNPCData(ZONE_BADLANDS, 			"Siege Golem", 				19.9, 	56.6, 	40, 	CLASS_ELITE, 		TYPE_ELEMENTAL,		5527, 		"328-389", 		2921, 	{0,20,0},	13869,	{24611},							{});
	
	
	-- Burning Steppes
	Frame:SetZoneNPCData(ZONE_BURNING_STEPPES, 		"Scarshield Quartermaster", 34.9, 	27.9, 	55, 	CLASS_ELITE, 		TYPE_HUMANOID,		7835, 		"526-626", 		3271, 	{0,2,0},	8900,	{},									{{18987, 100},{13248, 3},{13254, 3},{19282, 0.2}});
	Frame:SetZoneNPCData(ZONE_BURNING_STEPPES, 		"Volchan", 					74.3, 	37.8, 	60, 	CLASS_ELITE, 		TYPE_GIANT,			12201, 		"873-1039", 	3075, 	{0,12,0},	12232,	{12470, 13376, 15743},				{{12828, 65}}); -- Large spawn area. Spawns all around the mountain.
	Frame:SetZoneNPCData(ZONE_BURNING_STEPPES, 		"Deathmaw", 				79.0, 	59.0, 	60, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			3662, 		"697-829", 		nil, 	{0,12,0},	9562,	{3604},								{}); -- Can be lvl 59.
	Frame:SetZoneNPCData(ZONE_BURNING_STEPPES, 		"Gorgon'och", 				64.0, 	47.0, 	55, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		8050, 		"475-565", 		nil, 	{0,12,0},	11562,	{6742, 13381},						{}); -- Spawns infront of Firegut Furnace
	Frame:SetZoneNPCData(ZONE_BURNING_STEPPES, 		"Gruklash", 				42.0, 	54.0, 	59, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		4056, 		"543-647", 		nil, 	{0,8,0},	11510,	{6253, 8269, 12555},				{}); -- Spawns in a hut
	Frame:SetZoneNPCData(ZONE_BURNING_STEPPES, 		"Hahk'Zor", 				65.1, 	46.5, 	57, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		8536, 		"503-599", 		nil, 	{0,12,0},	11564,	{},									{});
	Frame:SetZoneNPCData(ZONE_BURNING_STEPPES, 		"Hematos", 					28.3,   59.2, 	60, 	CLASS_ELITE, 		TYPE_DRAGONKIN,		14544, 		"873-1039", 	nil, 	{0,20,0},	6369,	{9573},								{}); -- Immune to fire and holy damage
	Frame:SetZoneNPCData(ZONE_BURNING_STEPPES, 		"Malfunctioning Reaver", 	51.2,   36.5, 	56, 	CLASS_RARE_ELITE, 	TYPE_ELEMENTAL,		3700, 		"503-599", 		nil, 	{0,12,0},	10802,	{3391, 10966},						{});
	Frame:SetZoneNPCData(ZONE_BURNING_STEPPES, 		"Terrorspark", 				50.0,   43.0, 	55, 	CLASS_RARE_ELITE, 	TYPE_DEMON,			2779, 		"503-599", 		nil, 	{0,20,0},	1018,	{11968, 9053, 15711, 15710},		{});
	Frame:SetZoneNPCData(ZONE_BURNING_STEPPES, 		"Thauris Balgarr", 			60.0,   40.0, 	57, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		4420, 		"516-612", 		nil, 	{0,8,0},	11511,	{11802, 6533, 6660},				{});

	
	-- Searing Gorge
	Frame:SetZoneNPCData(ZONE_SEARING_GORGE, 		"Faulty War Golem", 		45.9, 	67.8, 	46, 	CLASS_RARE_ELITE, 	TYPE_ELEMENTAL,		2395, 		"393-467", 		414, 	{0,20,0},	10800,	{},									{});
	Frame:SetZoneNPCData(ZONE_SEARING_GORGE, 		"Rekk'tilac", 				61.9, 	73.2, 	49, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			6670, 		"402-478", 		2888, 	{0,2,0},	4458,	{},									{}); -- Large spawn area
	Frame:SetZoneNPCData(ZONE_SEARING_GORGE, 		"Scald", 					51.1, 	46.8, 	49, 	CLASS_RARE_ELITE, 	TYPE_ELEMENTAL,		2659, 		"413-492", 		nil, 	{0,20,0},	1204,	{},									{});
	Frame:SetZoneNPCData(ZONE_SEARING_GORGE, 		"Shleipnarr", 				58.6, 	56.5, 	47, 	CLASS_RARE_ELITE, 	TYPE_DEMON,			2698, 		"393-467", 		2835, 	{0,20,0},	2346,	{13321,7399},						{});
	Frame:SetZoneNPCData(ZONE_SEARING_GORGE, 		"Slave Master Blackheart", 	42.4, 	23.1, 	50, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		2798, 		"428-509", 		2999, 	{0,20,0},	7819,	{6533,6660},						{});
	Frame:SetZoneNPCData(ZONE_SEARING_GORGE, 		"Smoldar", 					29.5, 	62.4, 	53, 	CLASS_RARE_ELITE, 	TYPE_ELEMENTAL,		7576, 		"451-537", 		3586, 	{0,2,0},	5781,	{5213},								{});
	Frame:SetZoneNPCData(ZONE_SEARING_GORGE, 		"Highlord Mastrogonde", 	14.5, 	37.2, 	51, 	CLASS_ELITE, 		TYPE_HUMANOID,		5118, 		"526-626", 		2477, 	{0,12,0},	7835,	{13323, 11974, 9613, 11639},		{});
	
	
	-- Redridge Mountains
	Frame:SetZoneNPCData(ZONE_REDRIDGE_MOUNTAINS, 	"Kazon", 					34.9, 	8.3, 	27, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		817, 		"188-224", 		1097, 	{0,20,0},	6041,	{6253},								{{3231, 75},{2058, 25}});
	Frame:SetZoneNPCData(ZONE_REDRIDGE_MOUNTAINS, 	"Boulderheart", 			88.9, 	66.8, 	25, 	CLASS_RARE_ELITE, 	TYPE_GIANT,			680, 		"170-203", 		1026, 	{0,1,0},	5229,	{},									{}); -- Large spawn area
	Frame:SetZoneNPCData(ZONE_REDRIDGE_MOUNTAINS, 	"Chatter", 					52.1, 	45.2, 	23, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			625, 		"53-60", 		957, 	{0,1,0},	821,	{3609,744},							{{3229, 25}});
	Frame:SetZoneNPCData(ZONE_REDRIDGE_MOUNTAINS, 	"Ribchaser", 				16.1, 	65.3, 	17, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		414, 		"148-175", 		748, 	{0,1,0},	500,	{},									{});
	Frame:SetZoneNPCData(ZONE_REDRIDGE_MOUNTAINS, 	"Rohh the Silent", 			75.5, 	39.6, 	26, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		777, 		"188-224", 		1061, 	{0,20,0},	10792,	{2590,2920,744},					{{4447, 80},{4446, 20}});
	Frame:SetZoneNPCData(ZONE_REDRIDGE_MOUNTAINS, 	"Seeker Aqualon", 			60.1, 	56.2, 	21, 	CLASS_RARE_ELITE, 	TYPE_ELEMENTAL,		575, 		"162-193", 		888, 	{0,20,0},	525,	{},									{});
	Frame:SetZoneNPCData(ZONE_REDRIDGE_MOUNTAINS, 	"Snarlflare", 				42.5, 	31.0, 	18, 	CLASS_RARE_ELITE, 	TYPE_DRAGONKIN,		354, 		"148-175", 		422, 	{0,1,0},	497,	{},									{});
	Frame:SetZoneNPCData(ZONE_REDRIDGE_MOUNTAINS, 	"Squiddic", 				38.7, 	56.3, 	19, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		532, 		"162-193", 		817, 	{0,1,0},	5243,	{},									{});
	
	
	-- Elwynn Forest
	Frame:SetZoneNPCData(ZONE_ELWYNN_FOREST, 		"Fedfennel", 				68.1, 	44.9, 	12, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		246, 		"109-131", 		573, 	{0,1,0},	175,	{16244,3238},						{{3233, 70},{5744, 30}});
	Frame:SetZoneNPCData(ZONE_ELWYNN_FOREST, 		"Mother Fang", 				62.1, 	48.0, 	10, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			197, 		"21-24", 		512, 	{0,1,0},	2541,	{11918,12023},						{{6148, 85},{3000, 15}}); -- Spawns in a cave
	Frame:SetZoneNPCData(ZONE_ELWYNN_FOREST, 		"Thuros Lightfingers", 		52.7, 	58.9, 	11, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		201, 		"109-131", 		538, 	{0,1,0},	3341,	{15657},							{{6202, 70},{6203, 30}});
	Frame:SetZoneNPCData(ZONE_ELWYNN_FOREST, 		"Morgaine the Sly", 		30.8, 	64.7, 	10, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		206, 		"29-42", 		512, 	{0,1,0},	3320,	{7159,1776,11918},					{{6201, 80},{1917, 20}});
	Frame:SetZoneNPCData(ZONE_ELWYNN_FOREST, 		"Narg the Taskmaster", 		40.9, 	77.5, 	10, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		361, 		"29-42", 		512, 	{0,1,0},	774,	{9128},								{{6147, 85},{1913, 15}});
	Frame:SetZoneNPCData(ZONE_ELWYNN_FOREST, 		"Gruff Swiftbite", 			25.4, 	89.8, 	12, 	CLASS_RARE, 		TYPE_HUMANOID,		246, 		"18-20", 		573, 	{0,0,30},	175,	{3391},								{{1307, 100}});
	
	
	-- Swamp of Sorrows
	Frame:SetZoneNPCData(ZONE_SWAMP_OF_SORROWS, 	"Lost One Chieftain", 		62.0, 	21.2, 	39, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		1673, 		"301-358", 		1834, 	{0,12,0},	10921,	{},									{}); -- Not sure on spawn time
	Frame:SetZoneNPCData(ZONE_SWAMP_OF_SORROWS, 	"Lost One Cook", 			65.2, 	22.8, 	37, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		1015, 		"281-334", 		1325, 	{0,12,0},	152,	{},									{}); -- Not sure on spawn time
	Frame:SetZoneNPCData(ZONE_SWAMP_OF_SORROWS, 	"Gilmorian", 				95.9, 	64.4, 	44, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		5620, 		"344-410", 		2397, 	{0,20,0},	4920,	{},									{});
	Frame:SetZoneNPCData(ZONE_SWAMP_OF_SORROWS, 	"Molt Thorn", 				34.5, 	38.8, 	42, 	CLASS_RARE_ELITE, 	TYPE_ELEMENTAL,		2463, 		"344-410", 		2246, 	{0,20,0},	14497,	{21748},							{});
	Frame:SetZoneNPCData(ZONE_SWAMP_OF_SORROWS, 	"Lord Captain Wyrmak", 		78.2, 	43.1, 	45, 	CLASS_RARE_ELITE, 	TYPE_DRAGONKIN,		6723, 		"411-488", 		4059, 	{0,20,0},	7976,	{12533},							{});
	
	
	-- Duskwood
	Frame:SetZoneNPCData(ZONE_DUSKWOOD, 			"Taerar", 					45.4, 	39.6, 	"??", 	CLASS_WORLD_BOSS, 	TYPE_DRAGONKIN,		832750, 	"2921-3271", 	4691, 	{0,1,0},	15363,	{},									{{20644, 100}}); -- Needs abilities
	Frame:SetZoneNPCData(ZONE_DUSKWOOD, 			"Fenros", 					61.7, 	36.9, 	32, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		1474, 		"281-334", 		1078, 	{0,20,0},	11179,	{6725,12544,865},					{{4474, 65},{6204, 35}});
	Frame:SetZoneNPCData(ZONE_DUSKWOOD, 			"Commander Felstrom", 		18.0, 	37.9, 	32, 	CLASS_RARE_ELITE, 	TYPE_UNDEAD,		1155, 		"260-310", 		1270, 	{0,1,0},	7848,	{3488},								{{4464, 50},{4465, 50}});
	Frame:SetZoneNPCData(ZONE_DUSKWOOD, 			"Lord Malathrom", 			21.1, 	27.2, 	31, 	CLASS_RARE_ELITE, 	TYPE_UNDEAD,		926, 		"281-334", 		1033, 	{0,1,0},	10626,	{3537,2767},						{{1187, 50},{4462, 50}});
	Frame:SetZoneNPCData(ZONE_DUSKWOOD, 			"Lupos", 					32.6, 	25.8, 	23, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			616, 		"53-60", 		957, 	{0,20,0},	11412,	{17257,24605,14918},				{{3018, 80},{3227, 20}}); -- Deals shadow damage
	Frame:SetZoneNPCData(ZONE_DUSKWOOD, 			"Naraxis", 					86.4, 	47.6, 	27, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			858, 		"170-203", 		1907, 	{0,1,0},	963,	{3583,3542},						{{4448, 50},{4449, 50}}); 
	Frame:SetZoneNPCData(ZONE_DUSKWOOD, 			"Nefaru", 					63.5, 	83.7, 	37, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		4295, 		"272-324", 		1340, 	{0,1,0},	11181,	{3604,8715},						{{4477, 80},{4476, 20}}); 
	
	
	-- Westfall
	Frame:SetZoneNPCData(ZONE_WESTFALL, 			"Foe Reaper 4000", 			44.8, 	35.4, 	20, 	CLASS_RARE_ELITE, 	TYPE_MECHANICAL,	482, 		"148-175", 		852, 	{0,1,0},	548,	{5568},								{{933, 80},{4434, 20}});
	Frame:SetZoneNPCData(ZONE_WESTFALL, 			"Brack", 					27.3, 	44.5, 	19, 	CLASS_RARE, 		TYPE_HUMANOID,		448, 		"59-68", 		817, 	{0,1,0},	652,	{9080,6016,11976},					{{6179, 65},{2235, 35}}); -- Large spawn radius
	Frame:SetZoneNPCData(ZONE_WESTFALL, 			"Leprithus", 				43.0, 	27.0, 	19, 	CLASS_RARE, 		TYPE_UNDEAD,		415, 		"39-44", 		683, 	{0,20,0},	1065,	{744,4974},							{{1314, 75},{1387, 25}}); -- Apparently only spawns at night
	Frame:SetZoneNPCData(ZONE_WESTFALL, 			"Master Digger", 			46.5, 	19.0, 	15, 	CLASS_RARE, 		TYPE_HUMANOID,		326, 		"95-114", 		20, 	{0,1,0},	774,	{25710,6546},						{{6206, 70},{6205, 30}}); -- Spawns inside of a mine
	Frame:SetZoneNPCData(ZONE_WESTFALL, 			"Sergeant Brashclaw", 		36.9, 	31.9, 	18, 	CLASS_RARE, 		TYPE_HUMANOID,		360, 		"41-48", 		782, 	{0,1,0},	383,	{3136,5164},						{{2204, 70},{2203, 25}});
	Frame:SetZoneNPCData(ZONE_WESTFALL, 			"Slark", 					31.6, 	25.9, 	15, 	CLASS_RARE, 		TYPE_HUMANOID,		331, 		"32-37", 		677, 	{0,1,0},	540,	{3391},								{{6180, 65},{3188, 35}});
	Frame:SetZoneNPCData(ZONE_WESTFALL, 			"Vultros", 					50.6, 	43.5, 	26, 	CLASS_RARE, 		TYPE_BEAST,			920, 		"70-81", 		1061, 	{0,20,0},	507,	{5708},								{{5971, 75},{4454, 25}}); -- Many spawn locations
	Frame:SetZoneNPCData(ZONE_WESTFALL, 			"Brainwashed Noble", 		44.0, 	78.3, 	18, 	CLASS_ELITE, 		TYPE_HUMANOID,		1061, 		"109-131", 		20, 	{0,1,0},	3267,	{512, 9053, 228},					{{5967, 65},{3902, 35}}); -- Spawns outside of instance
	Frame:SetZoneNPCData(ZONE_WESTFALL, 			"Marisa du'Paige", 			42.2, 	79.9, 	19, 	CLASS_ELITE, 		TYPE_HUMANOID,		1003, 		"109-131", 		422, 	{0,1,0},	2355,	{512, 9053, 228, 700},				{{4660, 75},{3019, 25}}); -- Usually spawns on bridge, outside of Dedadmines.
	
	
	-- Blasted Lands
	Frame:SetZoneNPCData(ZONE_BLASTED_LANDS, 		"Fingat", 					71.5, 	17.2, 	43, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		2057, 		"367-437", 		2397, 	{0,8,0},	441,	{3417},								{}); -- Not sure on spawn time
	Frame:SetZoneNPCData(ZONE_BLASTED_LANDS, 		"Clack the Reaver", 		48.3, 	38.7, 	53, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			2945, 		"463-551", 		3163, 	{0,20,0},	10983,	{19128,5416},						{});
	Frame:SetZoneNPCData(ZONE_BLASTED_LANDS, 		"Dreadscorn", 				41.3, 	38.7, 	57, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		3868, 		"543-647", 		3380, 	{0,8,0},	7844,	{6253,21049,12057},					{}); -- Not sure on spawn time
	Frame:SetZoneNPCData(ZONE_BLASTED_LANDS, 		"Grunter", 					56.1, 	31.1, 	50, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			3117, 		"428-509", 		2999, 	{0,20,0},	8870,	{19471,8260,3604},					{});
	Frame:SetZoneNPCData(ZONE_BLASTED_LANDS, 		"Mojo the Twisted", 		45.2, 	16.0, 	48, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		1794, 		"402-478", 		1462, 	{0,8,0},	11562,	{20825,14887},						{}); -- Not sure on spawn time
	Frame:SetZoneNPCData(ZONE_BLASTED_LANDS, 		"Ravage", 					58.6, 	35.6, 	51, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			4045, 		"451-537", 		3052, 	{0,20,0},	10904,	{7367,19448},						{});
	Frame:SetZoneNPCData(ZONE_BLASTED_LANDS, 		"Spiteflayer", 				58.8, 	42.6, 	60, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			4444, 		"451-537", 		3108, 	{0,20,0},	388,	{15042,3391},						{});
	Frame:SetZoneNPCData(ZONE_BLASTED_LANDS, 		"Akubar the Seer", 			51.3, 	53.1, 	54, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		2452, 		"543-646", 		2610, 	{0,8,0},	10920,	{20831,20824,11436},				{}); -- Not sure on spawn time
	Frame:SetZoneNPCData(ZONE_BLASTED_LANDS, 		"Magronos the Unyielding", 	47.2, 	47.1, 	57, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		8536, 		"503-599", 		3327, 	{0,20,0},	11564,	{15284,8599,9080},					{{19231, 1.5}});
	Frame:SetZoneNPCData(ZONE_BLASTED_LANDS, 		"Deatheye", 				52.7, 	26.9, 	49, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			2469, 		"413-492", 		nil, 	{0,20,0},	2174,	{12020,3635},						{});
	
	
	-- Stranglethorn Vale
	Frame:SetZoneNPCData(ZONE_STRANGLETHORN_VALE, 	"Gan'zulah", 				23.4, 	8.1, 	41, 	CLASS_RARE, 		TYPE_HUMANOID,		1900, 		"290-345", 		nil, 	{0,0,30},	4582,	{},									{});-- Unsure about spawn time
	Frame:SetZoneNPCData(ZONE_STRANGLETHORN_VALE, 	"Kurmokk", 					35.4, 	56.6, 	42, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		4842, 		"301-358", 		2246, 	{0,20,0},	2246,	{8599},								{});
	Frame:SetZoneNPCData(ZONE_STRANGLETHORN_VALE, 	"Lord Sakrasis", 			28.3, 	62.6, 	45, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		1866, 		"393-467", 		2725, 	{0,20,0},	4910,	{},									{{5028,50},{5029,50}});
	Frame:SetZoneNPCData(ZONE_STRANGLETHORN_VALE, 	"Rippa", 					29.3, 	84.9, 	44, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			2663, 		"359-426", 		2557, 	{0,20,0},	14528,	{},									{});
	Frame:SetZoneNPCData(ZONE_STRANGLETHORN_VALE, 	"Scale Belly", 				43.4,   45.7, 	45, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			2036, 		"367-437", 		4059, 	{0,3,0},	12342,	{5106},								{{4478, 75},{1604, 25}});
	Frame:SetZoneNPCData(ZONE_STRANGLETHORN_VALE, 	"Verifonix", 				36.5,   57.1, 	42, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		1971, 		"336-399", 		2246, 	{0,20,0},	7232,	{12097},							{});
	Frame:SetZoneNPCData(ZONE_STRANGLETHORN_VALE, 	"Mosh'Ogg Butcher", 		51.0,   30.0, 	44, 	CLASS_ELITE, 		TYPE_HUMANOID,		5947, 		"361-430", 		nil, 	{0,0,30},	6704,	{15496},							{{1680, 10}});
	Frame:SetZoneNPCData(ZONE_STRANGLETHORN_VALE, 	"Gluggle", 					33.4,   22.4, 	37, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		1209, 		"281-334", 		nil, 	{0,12,0},	5286,	{6306},								{{4614, 6}});
	Frame:SetZoneNPCData(ZONE_STRANGLETHORN_VALE, 	"High Priestess Hai'watna",	50.7,   16.4, 	57, 	CLASS_ELITE, 		TYPE_HUMANOID,		8401, 		"541-643", 		1714, 	{0,3,0},	11295,	{15586, 18503, 14887},				{{19272, 2}});
	Frame:SetZoneNPCData(ZONE_STRANGLETHORN_VALE, 	"Roloch",					46.0,   47.0, 	38, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		1568, 		"292-348", 		nil, 	{0,8,0},	5782,	{},									{});
	
	
	-- Stormwind City
	Frame:SetZoneNPCData(ZONE_STORMWIND_CITY, 		"Sewer Beast", 				66.5,   56.3, 	50, 	CLASS_RARE_ELITE, 	TYPE_BEAST,			18068, 		"393-467", 		nil, 	{0,2,30},	2850,	{},									{}); -- Can also spawn at 66.5/31.4
	
	
end



function Frame:InitializeDungeons()

	-- Wailing Caverns
	Frame:SetZoneNPCData(ZONE_WAILING_CAVERNS, 		"Deviate Faerie Dragon", 	65.2,   33.8, 	20, 	CLASS_ELITE, 		TYPE_DRAGONKIN,		950, 		"151-179", 		817, 	{0,0,0},	1267,	{},									{{5243, 50},{6632, 50}});
	
	
	-- Scarlet Monastery
	Frame:SetZoneNPCData(ZONE_SCARLET_MONASTERY, 	"Ironspine", 				0.0,   	0.0, 	33, 	CLASS_RARE_ELITE, 	TYPE_UNDEAD,		3303, 		"254-303", 		2499, 	{0,0,0},	5231,	{702, 3815},						{{7686, 33},{7687, 33},{7688, 33}});
	Frame:SetZoneNPCData(ZONE_SCARLET_MONASTERY, 	"Fallen Champion", 			0.0,   	0.0, 	33, 	CLASS_RARE_ELITE, 	TYPE_UNDEAD,		4009, 		"266-316", 		nil, 	{0,0,0},	5230,	{19642, 21949, 19644},				{{7689, 33},{7690, 33},{7691, 33}});
	Frame:SetZoneNPCData(ZONE_SCARLET_MONASTERY, 	"Azshir the Sleepless", 	0.0,   	0.0, 	33, 	CLASS_RARE_ELITE, 	TYPE_UNDEAD,		2765, 		"266-316", 		nil, 	{0,0,0},	5534,	{},									{{7708, 33},{7709, 33},{7731, 33}});
	

	-- Stratholme
	Frame:SetZoneNPCData(ZONE_STRATHOLME, 			"Skul", 					0.0,   	0.0, 	58, 	CLASS_ELITE, 		TYPE_HUMANOID,		12983, 		"500-595", 		nil, 	{0,0,0},	2606,	{15230, 12544, 15499, 16799},		{{13394, 33},{13395, 33},{13396, 33}});
	Frame:SetZoneNPCData(ZONE_STRATHOLME, 			"Stonespine", 				0.0,   	0.0, 	60, 	CLASS_ELITE, 		TYPE_UNDEAD,		15160, 		"749-892", 		7505, 	{0,0,0},	7856,	{14331},							{{13397, 33},{13399, 33},{13954, 33}});
	
	
	-- The Stockade
	Frame:SetZoneNPCData(ZONE_STOCKADE, 			"Bruegal Ironknuckle", 		0.0,   	0.0, 	26, 	CLASS_ELITE, 		TYPE_HUMANOID,		2389, 		"177-210", 		1026, 	{0,0,0},	2142,	{},									{{2941, 33},{2942, 33},{3228, 33}});
	
	
	-- Blackrock Spire
	Frame:SetZoneNPCData(ZONE_BLACKROCK_SPIRE, 		"Jed Runewatcher", 			0.0,   	0.0, 	59, 	CLASS_ELITE, 		TYPE_HUMANOID,		8885, 		"530-630", 		nil, 	{0,0,0},	9686,	{11972, 15749, 14516},				{{12604, 33},{12605, 33},{12930, 33}});
	Frame:SetZoneNPCData(ZONE_BLACKROCK_SPIRE, 		"Bannok Grimaxe", 			0.0,   	0.0, 	59, 	CLASS_ELITE, 		TYPE_HUMANOID,		8866, 		"520-620", 		3489, 	{0,0,0},	9668,	{},									{{12621, 33},{12634, 33},{12637, 33},{12838, 7}});
	Frame:SetZoneNPCData(ZONE_BLACKROCK_SPIRE, 		"Spirestone Battle Lord", 	0.0,   	0.0, 	58, 	CLASS_ELITE, 		TYPE_HUMANOID,		17271, 		"541-643", 		3435, 	10,			11576,	{},									{{13285, 60},{13284, 40}});
	Frame:SetZoneNPCData(ZONE_BLACKROCK_SPIRE, 		"Spirestone Butcher", 		0.0,   	0.0, 	58, 	CLASS_ELITE, 		TYPE_HUMANOID,		14893, 		"486-577", 		3380, 	10,			11574,	{},									{{12608, 50},{13286, 50}});
	Frame:SetZoneNPCData(ZONE_BLACKROCK_SPIRE, 		"Spirestone Lord Magus", 	0.0,   	0.0, 	58, 	CLASS_ELITE, 		TYPE_HUMANOID,		14100, 		"486-577", 		2788, 	10,			11578,	{15230, 16170, 8365, 13323},		{{13261, 33},{13282, 33},{13283, 33}}); -- Spawns in the same room as Highlord Omokk
	Frame:SetZoneNPCData(ZONE_BLACKROCK_SPIRE, 		"Burning Felguard", 		0.0,   	0.0, 	57, 	CLASS_ELITE, 		TYPE_HUMANOID,		10709, 		"486-577", 		3354, 	{0,0,0},	5047,	{16046, 15580, 15588},				{{13181, 50},{13182, 50}}); -- Can be lvl 57. Spawns from portals.
	Frame:SetZoneNPCData(ZONE_BLACKROCK_SPIRE, 		"Crystal Fang", 			0.0,   	0.0, 	60, 	CLASS_ELITE, 		TYPE_BEAST,			9242, 		"786-936", 		3791, 	15,			9755,	{},									{{13184, 33},{13185, 33},{13218, 33}});
	Frame:SetZoneNPCData(ZONE_BLACKROCK_SPIRE, 		"Ghok Bashguud", 			0.0,   	0.0, 	59, 	CLASS_ELITE, 		TYPE_HUMANOID,		8996, 		"500-595", 		nil, 	10,			11809,	{},									{{13198, 33},{13203, 33},{13204, 33}});
	Frame:SetZoneNPCData(ZONE_BLACKROCK_SPIRE, 		"Goraluk Anvilcrack", 		0.0,   	0.0, 	61, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		12864, 		"604-719", 		4091, 	5,			10222,	{6253, 16172, 15580},				{{12728, 15},{12834, 14},{12837, 14},{18779, 14},{13498, 14},{13502, 14},{18047, 14},{18048, 14}});
	
	
	-- Blackrock Depths
	Frame:SetZoneNPCData(ZONE_BLACKROCK_DEPTHS, 	"Warder Stilgiss", 			0.0,   	0.0, 	56, 	CLASS_ELITE, 		TYPE_HUMANOID,		8561, 		"486-577", 		2610, 	{0,0,0},	9089,	{12556, 12674, 15044, 12675},		{{11782, 25},{11783, 25},{11784, 25},{22241, 25}});
	Frame:SetZoneNPCData(ZONE_BLACKROCK_DEPTHS, 	"Verek", 					0.0,  	0.0, 	55, 	CLASS_ELITE, 		TYPE_DEMON,			10389, 		"449-533", 		3163, 	{0,0,0},	9019,	{15042, 8599, 3391},				{{11755, 13},{22242, 13}});
	Frame:SetZoneNPCData(ZONE_BLACKROCK_DEPTHS, 	"Pyromancer Loregrain", 	0.0,  	0.0, 	55, 	CLASS_ELITE, 		TYPE_HUMANOID,		8261, 		"474-564", 		1574, 	{0,0,0},	8762,	{15041, 15616, 15095, 15038},		{{11747, 25},{11748, 25},{11749, 25},{11750, 25},{11207, 15}});
	Frame:SetZoneNPCData(ZONE_BLACKROCK_DEPTHS, 	"Panzor the Invincible", 	0.0,  	0.0, 	57, 	CLASS_ELITE, 		TYPE_ELEMENTAL,		14837, 		"526-626", 		nil, 	15,			8270,	{},									{{11785, 25},{11786, 25},{11787, 25},{22245, 25}});
	
	
	-- Razorfen Kraul
	Frame:SetZoneNPCData(ZONE_RAZORRFEN_KRAUL, 		"Blind Hunter", 			0.0,  	0.0, 	32, 	CLASS_ELITE, 		TYPE_BEAST,			5268, 		"220-260", 		1097, 	5,			9293,	{},									{{6695, 33},{6696, 33},{6697, 33}});
	Frame:SetZoneNPCData(ZONE_RAZORRFEN_KRAUL, 		"Earthcaller Halmgar", 		0.0,  	0.0, 	32, 	CLASS_ELITE, 		TYPE_HUMANOID,		3289, 		"295-351", 		nil, 	10,			6102,	{2484, 9532, 8270},					{{6688, 50},{6689, 50}});


	-- Razorfen Downs
	Frame:SetZoneNPCData(ZONE_RAZORRFEN_DOWNS, 		"Ragglesnout", 				0.0,  	0.0, 	40, 	CLASS_ELITE, 		TYPE_HUMANOID,		8872, 		"209-227", 		nil, 	10,			11382,	{7645, 12039, 12471, 11639},		{{10758, 33},{10767, 33},{10768, 33}});

	
	-- Zul'Farrak
	Frame:SetZoneNPCData(ZONE_ZUL_FARRAK, 			"Zerillis", 				0.0,  	0.0, 	45, 	CLASS_ELITE, 		TYPE_HUMANOID,		5932, 		"359-426", 		nil, 	25,			9293,	{},									{{12470, 20}}); -- Can abuse respawn by not killing his patrol, only him
	Frame:SetZoneNPCData(ZONE_ZUL_FARRAK, 			"Dustwraith", 				0.0,  	0.0, 	45, 	CLASS_RARE_ELITE, 	TYPE_HUMANOID,		5600, 		"64-82", 		nil, 	5,			9292,	{},									{{12471, 20}});
	Frame:SetZoneNPCData(ZONE_ZUL_FARRAK, 			"Sandarr Dunereaver", 		0.0,  	0.0, 	45, 	CLASS_ELITE, 		TYPE_HUMANOID,		5544, 		"64-82", 		2725, 	5,			9291,	{13730, 15615, 14516},				{}); -- Spawns at dried up faountain at center of the zone map
	
	
	-- Gnomeregan
	Frame:SetZoneNPCData(ZONE_GNOMEREGAN, 			"Dark Iron Ambassador", 	0.0,  	0.0, 	33, 	CLASS_ELITE, 		TYPE_HUMANOID,		4924, 		"246-292", 		nil, 	10,			6669,	{184, 16412, 12544, 10870},			{{9455, 33},{9456, 33},{9457, 33}});
	
	
	-- Shadowfang Keep
	Frame:SetZoneNPCData(ZONE_SHADOWFANG_KEEP, 		"Deathsworn Captain", 		0.0,  	0.0, 	25, 	CLASS_ELITE, 		TYPE_UNDEAD,		2081, 		"154-183", 		nil, 	10,			3224,	{7165, 15496, 9080},				{{6641, 50},{6642, 50}}); -- Can /target from the entrance. If you get a deathgaurd instead, he didnt spawn.

	
	-- Maraudon
	Frame:SetZoneNPCData(ZONE_MARAUDON, 			"Meshlok the Harvester", 	0.0,  	0.0, 	48, 	CLASS_ELITE, 		TYPE_ELEMENTAL,		6181, 		"422-503", 		nil, 	10,			9014,	{15580, 24375},						{{17741, 33},{17742, 33},{17767, 33}});


	-- Deadmines
	Frame:SetZoneNPCData(ZONE_DEADMINES, 			"Miner Johnson", 			0.0,  	0.0, 	19, 	CLASS_ELITE, 		TYPE_HUMANOID,		1144, 		"109-131", 		817, 	15,			556,	{12097},							{{5444, 65},{5443, 35}});

	
	-- Dire Maul
	Frame:SetZoneNPCData(ZONE_DIRE_MAUL, 			"Tsu'zee", 					0.0,  	0.0, 	59, 	CLASS_ELITE, 		TYPE_UNDEAD,		18656, 		"552-658", 		3489, 	10,			11250,	{21060, 12540, 14873},				{{18345, 33},{18346, 33},{18387, 33}});
	Frame:SetZoneNPCData(ZONE_DIRE_MAUL, 			"Skarr the Unbreakable", 	0.0,   	0.0, 	60, 	CLASS_ELITE, 		TYPE_HUMANOID,		59085, 		"581-692", 		nil, 	{0,0,0},	10169,	{},									{});
	
	
	-- Sunken Temple
	Frame:SetZoneNPCData(ZONE_SUNKEN_TEMPLE, 		"Veyzhak the Cannibal", 	0.0,  	0.0, 	48, 	CLASS_ELITE, 		TYPE_HUMANOID,		6261, 		"422-502", 		nil, 	10,			6695,	{21060, 12540, 14873},				{});


	-- Temple of Atal'Hakkar
	Frame:SetZoneNPCData(ZONE_TEMPLE_OF_ATAL_HAKKAR,"Zekkis", 					0.0,   	0.0, 	49, 	CLASS_ELITE, 		TYPE_UNDEAD,		6352, 		"379-451", 		nil, 	{0,0,0},	6693,	{7102, 10893},						{});
	
end



function Frame:InitializeOther()

	-- Unknown
	Frame:SetZoneNPCData(ZONE_UNKNOWN, 				"The Behemoth", 			0.0,   	0.0, 	50, 	CLASS_ELITE, 		TYPE_HUMANOID,		11042, 		"446-531", 		nil, 	{0,0,10},	8390,	{},									{{11603, 50}});
	Frame:SetZoneNPCData(ZONE_UNKNOWN, 				"The Razza", 				0.0,   	0.0, 	60, 	CLASS_ELITE, 		TYPE_BEAST,			74479, 		"873-1039", 	nil, 	{0,0,0},	10807,	{},									{});
	Frame:SetZoneNPCData(ZONE_UNKNOWN, 				"Mushgog", 					0.0,   	0.0, 	60, 	CLASS_ELITE, 		TYPE_ELEMENTAL,		60811, 		"873-1039", 	nil, 	{0,0,0},	14382,	{},									{});
	Frame:SetZoneNPCData(ZONE_UNKNOWN, 				"Jade", 					0.0,   	0.0, 	47, 	CLASS_ELITE, 		TYPE_DRAGONKIN,		6431, 		"370-440", 		nil, 	{0,0,0},	7975,	{16359, 12882},						{});
	
end



function Frame:OnUpdate(sinceLastUpdate)

	self:CheckZone();
	self.sinceLastUpdate = (self.sinceLastUpdate or 0) + sinceLastUpdate;
	if (self.sinceLastUpdate >= DELAY) then
		self.sinceLastUpdate = 0;
		self:CheckNearby();
	end
	
end



function Frame:OnEvent(event)

	if (event == "ZONE_CHANGED") then
		self:CheckZone();
	end
	
end



function Frame:SetZoneNPCData(zone, name, x, y, lvl, cl, typ, hp, damage, armor, spawn, model, spells, loot)

	-- Disabled world bosses for now
	if (cl == CLASS_WORLD_BOSS) then return; end
	
	-- Ensure sure the zone data exists
    local zoneData = Frame:GetZoneData(zone);
	if (zoneData == nil) then
		zoneData = {};
		DATA[zone] = zoneData;
	end
	
	-- Define the data keys for this NPC
	local npcData = {};
	npcData[KEY_ZONE_NAME] = zone;
	npcData[KEY_NPC_NAME] = name;
	npcData[KEY_POSITION_X] = x;
	npcData[KEY_POSITION_Y] = y;
	npcData[KEY_LEVEL] = lvl;
	npcData[KEY_CLASS] = cl;
	npcData[KEY_TYPE] = typ;
	npcData[KEY_HEALTH] = hp;
	npcData[KEY_DAMAGE] = damage;
	npcData[KEY_ARMOR] = armor;
	npcData[KEY_SPAWN] = spawn;
	npcData[KEY_MODEL] = model;
	npcData[KEY_SPELLS] = spells;
	npcData[KEY_LOOT] = loot;
	npcData[KEY_LOADED] = false;
	
	-- Load spells early for tooltips
	--if (GetTableLength(spells)> 0) then
	--	for s, spellID in pairs(spells) do
	--		local spellName, spellRank, spellIcon = GetSpellInfo(spellID);
	--		if (spellName == nil) then
	--			print("Invalid Spell: " .. spellID);
	--		end
	--	end
	--end
	
	-- Load loot early for tooltips
	local rarity = 0;
	if (GetTableLength(loot)> 0) then
		for l, loot in pairs(loot) do
			local itemID = loot[1];
			local itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, itemTexture = GetItemInfo(itemID);
			--if (itemName == nil) then
				--print("Invalid Item: " .. itemID);
			--end
		end
	end
	
	-- Store the data foor this NPC in the corresponding zone data
	zoneData[name] = npcData;
	
end



function Frame:GetZoneData(zone)
	return DATA[zone];
end



function Frame:CreateMapPin(container, data)

	local containerWidth = container:GetWidth();
	local containerHeight = container:GetHeight();

	local pinFrame = CreateFrame("Button", nil, container);
	pinFrame:EnableMouse(true);
	pinFrame:SetFrameLevel(2100);
	pinFrame:SetScript("OnClick", function(pin) Frame:ShowPinItemTooltip(pin) end);
	pinFrame:SetScript("OnEnter", function(pin) Frame:ShowPinTooltip(pin) end);
	pinFrame:SetScript("OnLeave", function(pin) Frame:HidePinTooltip(pin) end);
	
	local pinClass = data[KEY_CLASS];
	local pinRarity = data[KEY_RARITY];
	local pinIcon = RARITY_ICONS[pinRarity];
	
	local pinTexture = pinFrame:CreateTexture(nil, "BACKGROUND");
	pinTexture:SetAllPoints(pinFrame);
	pinTexture:SetTexture(ICON_PATH .. pinIcon);

	pinFrame.__data = data;
	pinFrame.texture = pinTexture;
	pinFrame:SetHighlightTexture(ICON_PATH .. ICON_HIGHLIGHT, true);
	pinFrame:Hide();

	return pinFrame;
	
end


function Frame:ShowPinItemTooltip(pin)
	
	if (pin == nil) then return; end
	
    local npcData = pin.__data;
	
	if (npcData == nil) then return; end
	
	local npcLoot = npcData[KEY_LOOT];
	
	if (GetTableLength(npcLoot) <= 0) then return; end
	
	if (TOOLTIP_LOOT_INDEX > GetTableLength(npcLoot)) then 
		TOOLTIP_LOOT_INDEX = 1;
		self:ShowPinTooltip(pin);
		return;
	end
	
	local npcLootData = npcLoot[TOOLTIP_LOOT_INDEX];
	
	if (npcLootData == nil) then return; end
	
	local npcLootID = npcLootData[1];
	
	GameTooltip:SetHyperlink("item:" .. npcLootID .. ":0:0:0:0:0:0:0");
	
	TOOLTIP_LOOT_INDEX = TOOLTIP_LOOT_INDEX + 1;
	
end



function Frame:ShowPinTooltip(pin)

	if (pin == nil) then return; end
	
    local npcData = pin.__data;
	
	if (npcData == nil) then return; end
	
	local npcName = npcData[KEY_NPC_NAME];
	local npcX = npcData[KEY_POSITION_X];
	local npcY = npcData[KEY_POSITION_Y];
	local npcLevel = npcData[KEY_LEVEL];
	local npcClass = npcData[KEY_CLASS];
	local npcType = npcData[KEY_TYPE];
	local npcHealth = npcData[KEY_HEALTH];
	local npcDamage = npcData[KEY_DAMAGE];
	local npcArmor = npcData[KEY_ARMOR];
	local npcSpawn = npcData[KEY_SPAWN];
	local npcModel = npcData[KEY_MODEL];
	local npcSpells = npcData[KEY_SPELLS];
	local npcLoot = npcData[KEY_LOOT];
	
	local npcColor = CLASS_COLORS[npcClass];
	
	GameTooltip:SetOwner(pin, "ANCHOR_BOTTOMRIGHT");
    GameTooltip:SetText(npcName, npcColor[1], npcColor[2], npcColor[3]);
	GameTooltip:AddLine("Level " .. npcLevel .. " " .. npcType, 1, 1, 1);
	GameTooltip:AddLine(npcClass, 0.7, 0.7, 0.7);
    GameTooltip:AddLine(" ");
	GameTooltip:AddLine("Stats:");
	GameTooltip:AddLine(npcDamage .. " Damage", 1, 1, 1);
	GameTooltip:AddLine(npcHealth .. " Health", 1, 1, 1);
	
	if not (npcArmor == nil) then
		GameTooltip:AddLine(npcArmor .. " Armor", 1, 1, 1);
	end
	
	
	if (GetTableLength(npcSpells) > 0) then
		GameTooltip:AddLine(" ");
		GameTooltip:AddLine("Skills:");
		for i, spellID in pairs(npcSpells) do
			local spellName, spellRank, spellIcon = GetSpellInfo(spellID);
			if (spellName ~= nil) then
				GameTooltip:AddLine(spellName, 1, 1, 1);
				--GameTooltip:AddTexture(spellIcon);
			end
		end
	end
	
	
	local spawnTime = "";
	if (type(npcSpawn) == "table" and GetTableLength(npcSpawn) > 0) then
		local spawnDays = npcSpawn[1];
		local spawnHours = npcSpawn[2];
		local spawnMinutes = npcSpawn[3];
		
		if (spawnDays > 0) then spawnTime = spawnTime .. spawnDays .. " Days "; end;
		if (spawnHours > 0) then spawnTime = spawnTime .. spawnHours .. " Hours "; end;
		if (spawnMinutes > 0) then spawnTime = spawnTime .. spawnMinutes .. " Minutes "; end;
	else
		spawnTime = npcSpawn .. "%";
	end
	
	if (spawnTime:len() > 0) then
		GameTooltip:AddLine(" ");
		GameTooltip:AddLine("Spawn Rate:");
		GameTooltip:AddLine(spawnTime, 1, 1, 1);
	end
	
	
	if (GetTableLength(npcLoot) > 0) then
		GameTooltip:AddLine(" ");
		GameTooltip:AddLine("Notable Loot:");
		for i, loot in pairs(npcLoot) do
			local itemID = loot[1];
			local itemPerc = loot[2];
			local itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, itemTexture = GetItemInfo(itemID);
			if (itemName ~= nil) then
				local itemRarityR, itemRarityG, itemRarityB = GetItemQualityColor(itemRarity);
				GameTooltip:AddLine(itemName .. " (" .. itemPerc .. "%)", itemRarityR, itemRarityG, itemRarityB);
				--GameTooltip:AddTexture(itemTexture);
			end
		end
		GameTooltip:AddLine("(Click to view)", 0.7, 0.7, 0.7);
	end
	
    GameTooltip:Show();
	
end



function Frame:HidePinTooltip(pin)
	TOOLTIP_LOOT_INDEX = 1;
	GameTooltip:Hide();
end



function Frame:CheckZone()

	self:CheckMiniMap();
	self:CheckWorldMap();
	self:CheckPlayerMap();
	
end



function Frame:CheckPlayerMap()

	local mapID = GetMapID();
	if (mapID ~= PLAYER_MAP_ID) then
		self:UpdateMacros();
	end
	PLAYER_MAP_ID = mapID;
	
end


function Frame:UpdateMacros()
	
	--print("Updating Macros");
	
	local macroName = "RA1";
	local macroContent = "";
	local mapID = GetMapID();
	local zoneData = Frame:GetZoneData(mapID);
	if (zoneData ~= null) then
		for i, npcData in pairs(zoneData) do
			local npcName = npcData[KEY_NPC_NAME];
			macroContent = macroContent .. "/target " .. npcName .. ";";
		end
	end
	
	--local macroId = CreateMacro(macroName, "INV_MISC_QUESTIONMARK", macroContent, nil, nil);
	--print("Create Macro " .. macroName .. " With Content: " .. macroContent .. " And ID " .. macroId);
end


function Frame:CheckMiniMap()

	local mapID = GetMapID();
	if (mapID ~= MINI_MAP_ID) then
		Frame:DrawMiniMapPins();
	end
	self:UpdateMiniMapPins();
	
end


function Frame:CheckWorldMap()

	if (WorldMapAvailable()) then
		local worldMapID = GetWorldMapID();
		if (worldMapID ~= WORLD_MAP_ID) then
			Frame:DrawWorldMapPins();
		end
		self:UpdateWorldMapPins();
	end
	
end


function Frame:CheckNearby()

	local mapID = GetMapID();
	
	local nearbyNPCs = {};
	local position = GetPlayerPosition(mapID);
	if position then
		local playerX, playerY = position:GetXY();
		local zoneData = Frame:GetZoneData(mapID);
		if (zoneData ~= null) then
			for i, npcData in pairs(zoneData) do
				local pointX = npcData[KEY_POSITION_X] / 100;
				local pointY = npcData[KEY_POSITION_Y] / 100;
				local distance = GetDistance(playerX, playerY, pointX, pointY);
				
				if (distance <= DISTANCE_THRESHOLD) then
					table.insert(nearbyNPCs, npcData);
				end
			end
		end
	end

	if (GetTableLength(nearbyNPCs) >= 0) then
		for n, nearbyNPC in pairs(nearbyNPCs) do
			local found = false;
			for d, distanceNPC in pairs(DISTANCE_NPCS) do
				if (distanceNPC == nearbyNPC) then
					found = true;
				end
			end
			if not (found) then
				local npcClass = nearbyNPC[KEY_CLASS];
				local npcColor = CLASS_COLOR_CODES[npcClass];
				Notify("Possible Nearby Enemy: " .. npcColor .. nearbyNPC[KEY_NPC_NAME]);
			end
		end
		
	end
	
	DISTANCE_NPCS = nearbyNPCs;
	
end



-- World Map --
function Frame:HideWorldMapNPC(data)
	npcPin = data[KEY_WORLD_MAP_PIN];
	npcPin:Hide();
end



function Frame:ShowWorldMapNPC(data)
	self:LoadNPCData(data);
	npcPin = data[KEY_WORLD_MAP_PIN];
	npcPin:Show();
end



function Frame:DrawWorldMapPins()
	Frame:HideWorldMapPins();
	Frame:ShowWorldMapPins();
end



function Frame:HideWorldMapPins()

	for i, npcPin in pairs(WORLD_MAP_PINS) do
		local npcData = npcPin.__data;
		self:HideWorldMapNPC(npcData);
	end

	table.wipe(WORLD_MAP_PINS);
	
end



function Frame:ShowWorldMapPins()

	WORLD_MAP_ID = GetWorldMapID();
	zoneData = Frame:GetZoneData(WORLD_MAP_ID);
	
	if (zoneData == null) then return; end
	
	for npcName, npcData in pairs(zoneData) do
	
		npcPin = npcData[KEY_WORLD_MAP_PIN];
		self:ShowWorldMapNPC(npcData);
		table.insert(WORLD_MAP_PINS, npcPin);
		
	end
	
	self:UpdateWorldMapPins();
	
end



function Frame:UpdateWorldMapPins()

	-- TODO: Try not to call this on every frame. Only when the canvas width or height has changed, and if the scale has changed.
	local scale = WORLD_MAP_CONTAINER:GetEffectiveScale()
	local width = WORLD_MAP_CONTAINER:GetWidth()
	local height = WORLD_MAP_CONTAINER:GetHeight()
	local left = WORLD_MAP_CONTAINER:GetLeft()
	local top = WORLD_MAP_CONTAINER:GetTop()
	
	local pinSize = WORLD_MAP_PIN_SIZE / scale;
	
	for i, npcPin in pairs(WORLD_MAP_PINS) do
	
		local npcData = npcPin.__data;
		local npcPin = npcData[KEY_WORLD_MAP_PIN];
		
		local pointX = npcData[KEY_POSITION_X];
		local pointY = npcData[KEY_POSITION_Y];
		
		--if (i == 1) then pointX = 0; pointY = 0; end
		--if (i == 2) then pointX = 100; pointY = 0; end
		--if (i == 3) then pointX = 0; pointY = 100; end
		--if (i == 4) then pointX = 100; pointY = 100; end
		--if (i >= 5) then pointX = 50; pointY = 50; end
		
		local pinX = ((pointX / 100) * width) - (width / 2);
		local pinY = (((pointY / 100) * height) - (height / 2)) * -1;
		npcPin:SetPoint("CENTER", pinX, pinY)
		npcPin:SetWidth(pinSize);
		npcPin:SetHeight(pinSize);
		
	end
	
end



-- Mini Map --
function Frame:HideMiniMapNPC(data)
	npcPin = data[KEY_MINI_MAP_PIN];
	npcPin:Hide();
end


function Frame:ShowMiniMapNPC(data)
	self:LoadNPCData(data);
	npcPin = data[KEY_MINI_MAP_PIN];
	npcPin:Show();
end



function Frame:DrawMiniMapPins()
	-- Disabled for now
	--Frame:HideMiniMapPins();
	--Frame:ShowMiniMapPins();
end



function Frame:HideMiniMapPins()

	for i, npcPin in pairs(MINI_MAP_PINS) do
		local npcData = npcPin.__data;
		self:HideMiniMapNPC(npcData);
	end

	table.wipe(MINI_MAP_PINS);
	
end



function Frame:ShowMiniMapPins()

	MINI_MAP_ID = GetMapID();
	zoneData = Frame:GetZoneData(MINI_MAP_ID);
	
	if (zoneData == null) then return; end
	
	for npcName, npcData in pairs(zoneData) do
	
		local npcPin = npcData[KEY_MINI_MAP_PIN];
		self:ShowMiniMapNPC(npcData);
		table.insert(MINI_MAP_PINS, npcPin);
		
	end
	
	self:UpdateMiniMapPins();
	
end



function Frame:UpdateMiniMapPins()

	-- TODO: Try not to call this on every frame. Only when the canvas width or height has changed, and if the scale has changed.
	local scale = MINI_MAP_CONTAINER:GetEffectiveScale()
	local width = MINI_MAP_CONTAINER:GetWidth()
	local height = MINI_MAP_CONTAINER:GetHeight()
	local left = MINI_MAP_CONTAINER:GetLeft()
	local top = MINI_MAP_CONTAINER:GetTop()
	
	local pinSize = MINI_MAP_PIN_SIZE / scale;
	
	for i, npcPin in pairs(MINI_MAP_PINS) do
	
		local npcData = npcPin.__data;
		local npcPin = npcData[KEY_MINI_MAP_PIN];
		
		local pointX = npcData[KEY_POSITION_X];
		local pointY = npcData[KEY_POSITION_Y];
		
		--if (i == 1) then pointX = 0; pointY = 0; end
		--if (i == 2) then pointX = 100; pointY = 0; end
		--if (i == 3) then pointX = 0; pointY = 100; end
		--if (i == 4) then pointX = 100; pointY = 100; end
		--if (i >= 5) then pointX = 50; pointY = 50; end
		
		local pinX = ((pointX / 100) * width) - (width / 2);
		local pinY = (((pointY / 100) * height) - (height / 2)) * -1;
		npcPin:SetPoint("CENTER", pinX, pinY)
		npcPin:SetWidth(pinSize);
		npcPin:SetHeight(pinSize);
		
	end
	
end



-- Utility
function Frame:LoadNPCData(data)

	local npcLoaded = data[KEY_LOADED];
	
	if (npcLoaded == true) then return; end
	
	local npcSpells = data[KEY_SPELLS];
	local npcLoot = data[KEY_LOOT];
	
	-- Pre-load the spells to prevent bugs on tooltips
	if (GetTableLength(npcSpells)> 0) then
		for s, spellID in pairs(npcSpells) do
			local spellName, spellRank, spellIcon = GetSpellInfo(spellID);
		end
	end

	-- Pre-load the loot to prevent bugs on tooltips
	local rarity = 0;
	if (GetTableLength(npcLoot)> 0) then
		for l, loot in pairs(npcLoot) do
			local itemID = loot[1];
			local itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, itemTexture = GetItemInfo(itemID);
			if (itemRarity ~= nil and itemRarity > rarity) then
				rarity = itemRarity;
			end
		end
	end
	
	data[KEY_LOADED] = true;
	data[KEY_RARITY] = rarity;
	data[KEY_WORLD_MAP_PIN] = Frame:CreateMapPin(WORLD_MAP_CONTAINER, data);
	data[KEY_MINI_MAP_PIN] = Frame:CreateMapPin(MINI_MAP_CONTAINER, data);
	
end



function WorldMapAvailable()

	if not (WorldMapFrame:IsVisible()) then
		return false;
	end
	
	local width = WorldMapFrame:GetCanvas():GetWidth()
	local height = WorldMapFrame:GetCanvas():GetHeight()
	
	if (width <= 0 or height <= 0) then
		return false;
	end
	
	return true;
end



function GetWorldMapID()
	return WorldMapFrame:GetMapID();
end


function GetMapID()
	return C_Map.GetBestMapForUnit("player");
end


function GetPlayerPosition(mapID)
	return C_Map.GetPlayerMapPosition(mapID, "player");
end


function GetTableLength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end


function GetDistance(x1, y1, x2, y2)
  local dx = x1 - x2
  local dy = y1 - y2
  return math.sqrt ( dx * dx + dy * dy )
end


function Notify(message)
	print("|cFF00FF00[" .. ADDON_NAME .. "]: |cFFFFFFFF" .. message);
end


Frame:Startup()
