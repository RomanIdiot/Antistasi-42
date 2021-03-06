if (!isServer and hasInterface) exitWith {};

private ["_marcador","_posicion","_escarretera","_tam","_road","_veh","_grupo","_unit","_roadcon"];

_marcador = _this select 0;
_posicion = getMarkerPos _marcador;

_NATOSupp = server getVariable "prestigeNATO";


_tam = 1;

while {true} do {
	_road = _posicion nearRoads _tam;
	if (count _road > 0) exitWith {};
	_tam = _tam + 5;
};

_roadcon = roadsConnectedto (_road select 0);
_dirveh = [_road select 0, _roadcon select 0] call BIS_fnc_DirTo;

0 = [getpos (_road select 0), _dirveh, call (compile (preprocessFileLineNumbers "CREATE\compNATORoadblock.sqf"))] call BIS_fnc_ObjectsMapper;

_vehArray = [];
_turretArray = [];
_tempPos = [];
{
	 if (str typeof _x find "B_APC_Wheeled_01_cannon_F" > -1) then {_vehArray pushBack _x;};
	 if (str typeof _x find "B_HMG_01_high_F" > -1) then {_turretArray pushBack _x;};
	 if (str typeof _x find "B_static_AA_F" > -1) then {_turretArray pushBack _x;};
	 if (str typeof _x find "Land_Camping_Light_F" > -1) then {_tempPos = _x;};
} forEach nearestObjects [_road select 0, [], 18];

_veh = _vehArray select 0;
_HMG = _turretArray select 0;
_AA1 = _turretArray select 1;
_AA2 = _turretArray select 2;

if (_NATOSupp < 50) then {
	_AA1 enableSimulation false;
    _AA1 hideObjectGlobal true;
    _AA2 enableSimulation false;
    _AA2 hideObjectGlobal true;
};

sleep 1;

_veh lock 3;

_nul = [_veh] spawn NATOVEHinit;
_veh allowCrewInImmobile true;
sleep 1;
_grupo = [getpos _tempPos, side_blue, (configfile >> "CfgGroups" >> "West" >> "BLU_F" >> "Infantry" >> "BUS_InfTeam_AT")] call BIS_Fnc_spawnGroup;

_unit = _grupo createUnit ["B_crew_F", _posicion, [], 0, "NONE"];
_unit moveInGunner _HMG;
_unit = _grupo createUnit ["B_crew_F", _posicion, [], 0, "NONE"];
_unit moveInGunner _veh;
_unit = _grupo createUnit ["B_crew_F", _posicion, [], 0, "NONE"];
_unit moveInCommander _veh;

if !(_NATOSupp < 50) then {
	_unit = _grupo createUnit ["B_crew_F", _posicion, [], 0, "NONE"];
	_unit moveInGunner _AA1;
	_unit = _grupo createUnit ["B_crew_F", _posicion, [], 0, "NONE"];
	_unit moveInGunner _AA2;
};
{[_x] spawn NATOinitCA} forEach units _grupo;


waitUntil {sleep 1; (not(spawner getVariable _marcador)) or ({alive _x} count units _grupo == 0) or (not(_marcador in puestosNATO))};

if ({alive _x} count units _grupo == 0) then {
	puestosNATO = puestosNATO - [_marcador]; publicVariable "puestosNATO";
	marcadores = marcadores - [_marcador]; publicVariable "marcadores";
	_nul = [5,-5,_posicion] remoteExec ["citySupportChange",2];
	deleteMarker _marcador;
	[["TaskFailed", ["", "Roadblock Lost"]],"BIS_fnc_showNotification"] call BIS_fnc_MP;
};

waitUntil {sleep 1; (not(spawner getVariable _marcador)) or (not(_marcador in puestosNATO))};

deleteVehicle _veh;
{deleteVehicle _x} forEach units _grupo;
deleteGroup _grupo;

_objs = [];
{
	 if (  str typeof _x find "Land_CncBarrier_F" > -1
     	or str typeof _x find "Land_BagBunker_Tower_F" > -1
        or str typeof _x find "RoadBarrier_F" > -1)
		then {
        	_objs pushBack _x;
   		};
} forEach nearestObjects [_road select 0, [], 15];

{
	_x enableSimulation false;
    _x hideObjectGlobal true;
} foreach _objs;
