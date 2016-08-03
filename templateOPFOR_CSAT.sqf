// (un-)armed transport helicopters
opHeliTrans = 		["O_Heli_Light_02_unarmed_F","O_Heli_Transport_04_bench_F"];

// helicopter that dismounts troops
opHeliDismount = 	"O_Heli_Transport_04_bench_F"; // Mi-290 Taru (Bench)

// helicopter that fastropes troops in
opHeliFR = 			"O_Heli_Light_02_unarmed_F"; // PO-30 Orca (Unarmed)

// gunship
opGunship = 		"O_Heli_Attack_02_F"; // Mi-48 Kajman

// CAS, fixed-wing
opCASFW = 			"O_Plane_CAS_02_F"; // To-199 Neophron (CAS)

// small UAV (Darter, etc)
opUAVsmall = 		"O_UAV_01_F"; // Tayran AR-2

// air force
opAir = 			["O_Heli_Light_02_unarmed_F","O_Heli_Transport_04_bench_F","O_Heli_Attack_02_F","O_Plane_CAS_02_F","O_Heli_Light_02_F"];

// infantry classes, to allow for class-specific skill adjustments and pricing
opIOfficer = 		"SG_sturmtrooper_lieutenant"; // officer/official
opIPilot = 			"LIB_GER_pilot"; // pilot
opIOfficer_2 = 		"SG_sturmtrooper_unterofficer"; // officer/traitor
opIUSL = 			"SG_sturmtrooper_unterofficer"; // squad leader, urban camo
opIURifle = 		"SG_sturmtrooper_stggunner"; // rifleman, urban camo

	
// config path for infantry groups
opCfgInf = 			(configfile >> "CfgGroups" >> "West" >> "SG_STURM" >> "Infantry");	

// standard group arrays, used for spawning groups
opISniper = 		"SS_SniperTeam"; // sniper team
opISpecOps = 		"SS_MP44Squad"; // spec opcs
opISquad = 		"SG_GER_infantry_squad"; // squad

// the affiliation
side_red = 			east;
