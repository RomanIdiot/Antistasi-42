if (!isServer and hasInterface) exitWith {};

private ["_marcador","_posicion","_grupo","_campGroup"];

_objs = [];

_marcador = _this select 0;
_posicion = getMarkerPos _marcador;

_fp = "Land_Campfire_F" createVehicle [0,0,0];
_fp setpos _posicion;
_fp inflame true;

_tentA = "Land_TentA_F" createVehicle [0,0,0];
_tentA setPos ([getPos _fp, 5, 0] call BIS_Fnc_relPos);
_tentA setDir ([_fp, _tentA] call BIS_fnc_dirTo);

_tentB = "Land_TentA_F" createVehicle [0,0,0];
_tentB setPos ([getPos _fp, 5, 135] call BIS_Fnc_relPos);
_tentB setDir ([_fp, _tentB] call BIS_fnc_dirTo);

_tentC = "Land_TentA_F" createVehicle [0,0,0];
_tentC setPos ([getPos _fp, 5, 225] call BIS_Fnc_relPos);
_tentC setDir ([_fp, _tentC] call BIS_fnc_dirTo);

_food = "Land_FoodContainer_01_F" createVehicle [0,0,0];
_food setPos ([getPos _fp, 1, 5] call BIS_Fnc_relPos);
_food setDir ([_fp, _food] call BIS_fnc_dirTo);

_crate = campCrate createVehicle [0,0,0];
_crate setPos ([getPos _fp, 2, 210] call BIS_Fnc_relPos);
_crate setDir ([_fp, _crate] call BIS_fnc_dirTo);
_nul = [_crate] call cajaAAF;

[[_food,"heal_camp"],"flagaction"] call BIS_fnc_MP;

_grupo = [_posicion, side_blue, (configfile >> "CfgGroups" >> "West" >> "Guerilla" >> "Infantry" >> "IRG_SniperTeam_M")] call BIS_Fnc_spawnGroup;
_grupo setBehaviour "STEALTH";
_grupo setCombatMode "GREEN";


{[_x] spawn FIAinitBASES;} forEach units _grupo;

waitUntil {sleep 5; (not(spawner getVariable _marcador)) or ({alive _x} count units _grupo == 0) or (not(_marcador in campsFIA))};

if ({alive _x} count units _grupo == 0) then
	{
	campsFIA = campsFIA - [_marcador]; publicVariable "campsFIA";
	marcadores = marcadores - [_marcador]; publicVariable "marcadores";
	deleteMarker _marcador;
	[["TaskFailed", ["", "Camp Lost"]],"BIS_fnc_showNotification"] call BIS_fnc_MP;
	};

waitUntil {sleep 5; (not(spawner getVariable _marcador)) or (not(_marcador in campsFIA))};

{deleteVehicle _x} forEach units _grupo;
deleteGroup _grupo;

[_posicion, "campFIA"] remoteExec ["despawnCamp"];
