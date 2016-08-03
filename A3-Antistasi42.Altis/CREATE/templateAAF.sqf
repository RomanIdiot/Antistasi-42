private ["_vTruck","_vSupply","_vPatrol","_vAPC","_vIFV","_vMBT","_heli","_airplane",
		"_infantry","_gSmall","_gPatrol","_gGarrison","_gTeam","_gMissile","_gSquad",
		"_statics","_statics_bags",
		"_infOfficer","_infSniper","_infNCO","_infSpecial","_infAuto","_infRegular","_infCrew","_infPilot",
		"_cfgInf","_flag","_lrRadio","_vfs",
		"_weapons","_ammo","_launchers","_missiles","_mines","_items","_optics","_backpacks","_vests","_helmets",
		"_unlocked_weapons","_unlocked_magazines","_unlocked_rifles","_unlocked_items","_unlocked_backpacks","_unlocked_optics"];

// all infantry classes

_infantry = 			["LIB_GER_FC_rifleman","LIB_GER_smgunner","LIB_GER_FC_rifleman","LIB_GER_mgunner","LIB_GER_mgunner","LIB_GER_AT_soldier","LIB_GER_rifleman",
						"LIB_GER_AT_grenadier","LIB_GER_AT_soldier","LIB_GER_rifleman","LIB_GER_underofficer","LIB_GER_smgunner","LIB_GER_AT_soldier","LIB_GER_FC_rifleman",
						"LIB_GER_engineer","LIB_GER_rifleman","LIB_GER_rifleman","LIB_GER_engineer","LIB_GER_rifleman","LIB_GER_pilot","LIB_GER_medic","LIB_GER_hauptmann",
						"LIB_GER_pilot","LIB_GER_rifleman","LIB_GER_rifleman","LIB_GER_mgunner","LIB_GER_rifleman","LIB_GER_mgunner","LIB_GER_mgunner","LIB_GER_rifleman",
						"LIB_GER_scout_sniper","LIB_GER_scout_sniper"];

sol_A_AA = "LIB_GER_FC_rifleman";
sol_A_AR = "LIB_GER_smgunner";
sol_A_AT = "LIB_GER_FC_rifleman";
sol_AA = "LIB_GER_mgunner";
sol_AR = "LIB_GER_mgunner";
sol_AT = "LIB_GER_AT_soldier";
sol_AMMO = "LIB_GER_rifleman";
sol_GL = "LIB_GER_AT_grenadier";
sol_GL2 = "LIB_GER_AT_grenadier"; // extra
sol_LAT = "LIB_GER_AT_soldier";
sol_LAT2 = "LIB_GER_AT_soldier"; // extra
sol_MG = "LIB_GER_mgunner"; // extra
sol_MK = "LIB_GER_rifleman";
sol_SL = "LIB_GER_underofficer";
sol_TL = "LIB_GER_smgunner";
sol_TL2 = "LIB_GER_smgunner"; // extra
sol_EXP = "LIB_GER_AT_soldier";
sol_R_L = "LIB_GER_FC_rifleman";
sol_REP = "LIB_GER_engineer";
sol_UN = "LIB_GER_rifleman";
sol_RFL = "LIB_GER_rifleman";
sol_SN = "LIB_GER_scout_sniper";
sol_SP = "LIB_GER_scout_sniper";
sol_MED = "LIB_GER_medic";
sol_ENG = "LIB_GER_engineer";
sol_OFF = "LIB_GER_hauptmann";
sol_OFF2 = "LIB_GER_hauptmann"; // extra

sol_CREW = "LIB_GER_rifleman";
sol_CREW2 = "LIB_GER_rifleman"; // extra
sol_CREW3 = "LIB_GER_rifleman"; // extra
sol_CREW4 = "LIB_GER_rifleman"; // extra
sol_DRV = "LIB_GER_rifleman"; // extra
sol_DRV2 = "LIB_GER_rifleman"; // extra
sol_HCREW = "LIB_GER_rifleman";
sol_HPIL = "LIB_GER_pilot";
sol_HPIL2 = "LIB_GER_pilot"; // extra
sol_PIL = "LIB_GER_pilot";
sol_UAV = "LIB_GER_rifleman";

sol_SUP_AMG = "LIB_GER_mgunner";
sol_SUP_AMTR = "LIB_GER_rifleman";
sol_SUP_GMG = "LIB_GER_mgunner";
sol_SUP_MG = "LIB_GER_mgunner";
sol_SUP_MTR = "LIB_GER_rifleman";


// all classes sorted by role, used for pricing, etc
_infOfficer = 	["LIB_GER_hauptmann"];
_infSniper = 	["LIB_GER_rifleman","LIB_GER_scout_sniper","LIB_GER_scout_sniper"];//marksman,scout_sniper,spotter
_infNCO = 		["LIB_GER_underofficer","LIB_GER_smgunner"];//squad leader(sgt), team leader(smgunner)
_infSpecial = 	["LIB_GER_FC_rifleman","LIB_GER_FC_rifleman","LIB_GER_mgunner","LIB_GER_AT_soldier","LIB_GER_AT_soldier","LIB_GER_engineer","LIB_GER_engineer","LIB_GER_medic"];//asst_antiair,asst_antitank,antiair,antitank,explosives,repair,engineer,medic
_infAuto = 		["LIB_GER_smgunner","LIB_GER_mgunner"];//asst autorifleman,autorifleman
_infRegular = 	["LIB_GER_rifleman","LIB_GER_AT_grenadier","LIB_GER_AT_soldier","LIB_GER_FC_rifleman","LIB_GER_rifleman"];//ammo bearer,AT_grenadier,rifleman antitank,sol_lite_f,sol_f
_infCrew = 		["LIB_GER_rifleman","LIB_GER_rifleman","LIB_GER_rifleman","LIB_GER_rifleman","LIB_GER_rifleman","LIB_GER_mgunner","LIB_GER_mgunner","LIB_GER_rifleman"]; //crew,helicrew,sol_uav,sol_amg,supp_amort,supp_gmg,supp_mg,supp_mort
_infPilot = 	["LIB_GER_pilot","LIB_GER_pilot"]; //helipilot,pilot

// all vehicles sorted by role
_vTruck = 		["LIB_opelblitz_tent_y_camo","LIB_opelblitz_open_y_camo"];//covered,transport
_vSupply = 		["LIB_opelblitz_fuel","LIB_opelblitz_ambulance","LIB_opelblitz_ammo"];
_vPatrol = 		["LIB_kfz1","LIB_kfz1","LIB_kfz1","I_Heli_light_03_unarmed_F"]; //Car,Car w HMG, Car with GMG, Heli
_vAPC = 		["Lib_sdkfz251"];
_vIFV = 		["LIB_Sdkfz_7"];
_vMBT =			["LIB_PzKpfwVI_B_camo"];
_heli = 		["I_Heli_Transport_02_F","I_Heli_light_03_unarmed_F","I_Heli_light_03_F"];
_airplane = 	["LIB_Ju87","LIB_FW190F8"];

// pre-defined groups sorted by assignments
_gSmall = 		["LIB_GER_scout_squad"];
_gPatrol = 		["LIB_GER_scout_squad","LIB_GER_scout_squad","LIB_GER_scout_squad","LIB_GER_scout_squad"];
_gGarrison = 	["LIB_GER_infantry_squad","LIB_GER_AT_squad","LIB_GER_infantry_squad","LIB_GER_infantry_squad","LIB_GER_infantry_squad"];
_gTeam = 		["LIB_GER_AT_squad","LIB_GER_AT_squad","LIB_GER_infantry_squad"];
_gMissile = 	["LIB_GER_AT_squad","LIB_GER_AT_squad"];
_gSquad = 		["LIB_GER_infantry_squad","LIB_GER_infantry_squad"];

// available statics
_statics =				["LIB_MG42_Lafette","LIB_GrWr34","LIB_Flakvierling_38","LIB_FlaK_38"];//mg,mortar,aa,at

/*
 _statics_bags = 		["B_Static_Designator_01_weapon_F","B_UAV_01_backpack_F","I_AA_01_weapon_F","B_AA_01_weapon_F","B_AT_01_weapon_F","I_HMG_01_high_weapon_F","I_HMG_01_support_F",
						"I_Mortar_01_support_F","B_Mortar_01_support_F","I_HMG_01_support_high_F","B_HMG_01_support_high_F","I_Mortar_01_weapon_F","B_Mortar_01_weapon_F"];
*/

// config paths for pre-defined groups
_cfgInf = 				(configfile >> "CfgGroups" >> "West" >> "LIB_WEHRMACHT" >> "Infantry");


// ---------- equipment available for friendly AI----------
// To do list:
// -Check Uniforms


// will spawn in ammo boxes
_weapons = [
	"LIB_M1895",
	"LIB_M9130"
];

_ammo = [
	"LIB_5Rnd_762x54",
	"LIB_7Rnd_762x38"
];

_launchers = ["LIB_M1A1_Bazooka"];

_missiles = [];

_mines = [
	"SLAMDirectionalMine_Wire_Mag",
	"SatchelCharge_Remote_Mag",
	"ClaymoreDirectionalMine_Remote_Mag",
	 "ATMine_Range_Mag",
	"APERSTripMine_Wire_Mag",
	"APERSMine_Range_Mag",
	 "APERSBoundingMine_Range_Mag"
];

_items = [
	"FirstAidKit",
	"Medikit",
	"LIB_Binoculuar_SU",
	"ToolKit",
	"bipod_03_F_oli",
	"Acc_flashlight"
];

_optics = [];

// will NOT spawn in ammo boxes
_backpacks = [
"B_LIB_GER_Backpack",
"B_LIB_GER_MedicBackpack"
];

_vests = [
	"V_LIB_GER_PrivateBelt",
	"V_LIB_GER_SniperBelt",
	"V_LIB_GER_VestMG"
];

_helmets = [
	"H_LIB_GER_HelmetCamo"
];

// ----------------------------------------------------

// equipment unlocked from the beginning
_unlocked_weapons = [
	"LIB_M1895",
	"LIB_M9130"
];

_unlocked_magazines = [
	"LIB_5Rnd_762x54",
	"LIB_7Rnd_762x38"
];

//standard rifles for AI are picked from this array. Add only rifles.
_unlocked_rifles = [
	"LIB_M9130"
];

_unlocked_items = [
	"ItemMap",
	"ItemWatch",
	"ItemCompass",
	"FirstAidKit",
	"Medikit",
	"ToolKit",
	"LIB_Binoculuar_SU",
	"U_BG_Guerilla1_1",
	"U_BG_Guerilla2_1",
	"U_BG_Guerilla2_2",
	"U_BG_Guerilla2_3",
	"U_BG_Guerilla3_1",
	"U_BG_Guerilla3_2",
	"U_BG_leader",
	"H_Booniehat_khk",
	"H_Booniehat_oli",
	"H_Booniehat_grn",
	"H_Booniehat_dirty",
	"H_Cap_oli",
	"H_MilCap_rucamo",
	"H_MilCap_gry",
	"H_Bandanna_khk",
	"H_Bandanna_gry",
	"H_Bandanna_camo",
	"H_Beret_grn",
	"H_Beret_grn_SF",
	"H_Watchcap_camo",
	"H_Hat_camo",
	"H_Hat_tan",
	"H_Beret_blk",
	"H_Beret_red",
	"H_Beret_02",
	"H_Watchcap_khk",
	"G_Bandanna_beast",
	"G_Aviator",
	"U_C_Poloshirt_blue",
	"U_C_Poloshirt_burgundy",
	"U_C_Poloshirt_salmon",
	"U_C_Poloshirt_tricolour",
	"U_C_Poor_1",
	"U_Rangemaster",
	"U_NikosBody",
	"U_IG_Guerilla3_2",
	"U_OG_Guerilla2_1",
	"U_IG_Guerilla1_1",
	"U_I_G_Story_Protagonist_F",
	"U_I_G_resistanceLeader_F",
	"U_C_Commoner1_1",
	"U_C_Commoner1_2",
	"U_C_Commoner1_3",
	"U_NikosBody",
	"U_C_Poor_1",
	"U_C_Poor_2",
	"U_C_WorkerCoveralls",
	"U_LIB_WP_Soldier_camo_1",
	"U_LIB_WP_Soldier_camo_3",
	"U_LIB_WP_Soldier_camo_2",
	"U_BG_Guerrilla_6_1",
	"U_B_survival_uniform",
	"U_OrestesBody"
];

_unlocked_backpacks = [
"B_LIB_GER_Backpack",
"B_LIB_GER_MedicBackpack"
];

_unlocked_optics = [];

// the flag
_flag = "LIB_FlagCarrier_GER";

// affiliation
_side = independent;

// long range radio
_lrRadio = "tf_rt1523g_green";

/*
These are the vehicles and statics that you can buy at HQ. Currently, the array requires a strict(!) order.
0-2: civilian vehicles
3-10: military vehicles and statics
*/
_vfs = 	[
	"LIB_zis5v",
	"LIB_zis5v_med",
	"LIB_P39",/*heli*/
	"LIB_kfz1",/*jeep*/
	"LIB_Scout_m3",/*M3 Scout*/
	"LIB_US_GMC_Tent",/*Truck Transport*/
	"LIB_SOV_M3_Halftrack", /*M3*/
	"LIB_MG42_Lafette",/*MG*/
	"LIB_BM37",/*mortar*/
	"LIB_Zis3",/*at*/
	"LIB_61k"/*aa*/
];

_civHeli = "LIB_P47";


/*
============================================================================
Everything below this line must be filled out, no exceptions. Mind the types: most are arrays, but some are strings!

All the gear you just provided must be mapped onto the variables used in initVar.sqf, which is what this segement does.

Why two sets of variables, you ask? Why not just ignore everything above the line and map them directly?
Well, If you provide the entire roster above, it makes a lot easier to adjust the spawn tables -- you only need to copy-paste your desired changes,
no need to descend into the depths of config files, EDEN, or online databases.

But hey, your call.
*/

// vehicles
vehTrucks = 		_vTruck; // trucks that spawn at outposts, etc
vehPatrol =			_vPatrol; // vehicles used for road patrols;
vehAPC = 			_vAPC; // APCs
vehIFV = 			_vIFV; // IFVs
vehTank = 			_vMBT; // MBTs
vehSupply = 		_vSupply; // supply vehicles (ammo, fuel, med)
vehAmmo = 			"LIB_opelblitz_ammo"; // ammo truck, for special missions
vehLead = 			["Lib_sdkfz251","Lib_sdkfz251"]; // lead vehicle for convoys, preferably armed MRAP/car
standardMRAP = 		["LIB_Sdkfz_7"]; // default transport MRAP/car
vehTruckBox = 		["LIB_opelblitz_parm"]; // repair truck or at least a prop

// airforce
heli_unarmed = 	["I_Heli_Transport_02_F","I_Heli_light_03_unarmed_F"]; // (un-)armed transport helicopters
heli_armed = 	["I_Heli_light_03_F"]; // armed helicopters
planes = 		_airplane; // attack planes
heli_default = 	"I_Heli_light_03_unarmed_F"; // default helicopter -- NOT AN ARRAY!
indUAV_large = 	"I_UAV_02_F"; // large UAV, unarmed

// initial motorpool/airforce
enemyMotorpoolDef = "LIB_opelblitz_tent_y_camo"; // fallback vehicle in case of an empty motorpool -- NOT AN ARRAY!
enemyMotorpool = 	["LIB_opelblitz_tent_y_camo"]; // starting/current motorpool
indAirForce = 		["LIB_Ju87","LIB_FW190F8"]; // starting/current airforce


// infantry classes, to allow for class-specific skill adjustments and pricing
infList_sniper = 	_infSniper;
infList_NCO = 		_infNCO;
infList_special = 	_infSpecial;
infList_auto = 		_infAuto;
infList_regular = 	_infRegular;
infList_crew = 		_infCrew;
infList_pilots = 	_infPilot;
infList_officers = 	_infOfficer;

// config paths for infantry groups
cfgInf = 			_cfgInf;

// standard group arrays, used for spawning groups
infPatrol = 		_gPatrol;
infGarrisonSmall = 	_gSmall;
infTeamATAA =		_gMissile;
infTeam = 			_gGarrison;
infSquad = 			_gSquad;

// standard roles for static gunner and unarmed helicopter pilot
infGunner =			"LIB_GER_mgunner";
infCrew = 			"LIB_GER_rifleman";
infPilot = 			"LIB_GER_pilot";

// statics to be used
statMG = 			"LIB_MG42_Lafette";
statAT = 			"LIB_FlaK_38";
statAA = 			"LIB_Flakvierling_38";
statMortar = 		"LIB_GrWr34";

allStatMGs = 		allStatMGs + [statMG];
allStatATs = 		allStatATs + [statAT];
allStatAAs = 		allStatAAs + [statAA];
allStatMortars = 	allStatMortars + [statMortar];

/*genStaticBag = 		_statics_bags;*/

// backpacks of dismantled statics -- 0: weapon, 1: tripod/support
statMGBackpacks = 		["I_HMG_01_high_weapon_F","I_HMG_01_support_high_F"];
statATBackpacks = 		["I_AT_01_weapon_F","I_HMG_01_support_F"];
statAABackpacks = 		["I_AA_01_weapon_F","I_HMG_01_support_F"];
statMortarBackpacks = 	["I_Mortar_01_weapon_F","I_Mortar_01_support_F"];

// gear
genWeapons = 	_weapons;
genAmmo = 		_ammo;
genLaunchers = 	_launchers;
genMissiles = 	_missiles;
genMines = 		_mines;
genItems = 		_items;
genOptics = 	_optics;
genBackpacks = 	_backpacks;
genVests = 		_vests;
genHelmets = 	_helmets;

// default launchers
genAALaunchers = ["launch_I_Titan_F"];
genATLaunchers = ["launch_I_Titan_short_F","launch_NLAW_F"];

// standard rifles for your troops to be equipped with
baseRifles = 	_unlocked_rifles;

// NVGs
indNVG = 			"NVGoggles_INDEP";
indFL = 			"acc_flashlight";
indLaser = 			"acc_pointer_IR";

unlockedWeapons = 	_unlocked_weapons;
unlockedRifles = 	_unlocked_rifles;
unlockedMagazines = _unlocked_magazines;
unlockedItems = 	_unlocked_items;
unlockedBackpacks = _unlocked_backpacks;
unlockedOptics = 	_unlocked_optics;

// the flag
cFlag = 			_flag;

// affiliation
side_green =		_side;

// add long range radio (TFAR)
lrRadio = 			_lrRadio;

// add buyable vehicles/statics
vfs =				_vfs;

// define the civilian helicopter that allows you to go undercover
civHeli = 			_civHeli;

// define the ammo crate to be spawned at camps
campCrate = 		"Box_IND_AmmoOrd_F";

// define the black market crate
blackMarketCrate = 	"Box_NATO_WpsSpecial_F";

// define the reward crate
rewardCrate = 	"Box_FIA_Wps_F";

// all the items camps are made of, to avoid object duplication within the HQ perimeter
campItems = ["Land_TentA_F","Land_FoodContainer_01_F","Land_Campfire_F",campCrate,"Land_Wreck_Ural_F","Land_TentDome_F",blackMarketCrate];


