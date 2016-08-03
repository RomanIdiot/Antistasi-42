private ["_tipo","_coste","_grupo","_unit","_tam","_roads","_road","_pos","_camion","_texto","_mrk","_hr","_exists","_posicionTel","_tipogrupo","_resourcesFIA","_hrFIA"];

if (!([player] call hasRadio)) exitWith {hint "You need a radio in your inventory to be able to give orders to other squads"};

_tipo = _this select 0;
_marcadores = mrkAAF;

openMap true;
posicionTel = [];
if (_tipo != "delete") then {hint "Click on the position you wish to establish the camp."} else {hint "Click on the camp to abandon a camp."};

onMapSingleClick "posicionTel = _pos;";

waitUntil {sleep 1; (count posicionTel > 0) or (not visiblemap)};
onMapSingleClick "";

if (!visibleMap) exitWith {};

if (getMarkerPos "respawn_west" distance posicionTel < 100) exitWith {hint "Location is too close to base"; openMap false;};

_posicionTel = posicionTel;
_pos = [];

if ((_tipo == "delete") and (count campsFIA < 1)) exitWith {hint "No camps to abandon."};
if ((_tipo == "delete") and ({(alive _x) and (!captive _x) and ((side _x == side_green) or (side _x == side_red)) and (_x distance _posicionTel < 500)} count allUnits > 0)) exitWith {hint "You cannot delete a camp while enemies are near it."};

_coste = 500;
_hr = 0;

if ((_tipo != "delete") && (count campsFIA > 4)) exitWith {hint "You can only sustain a maximum of five camps."};

if (_tipo != "delete") then {
	_tipogrupo = "IRG_SniperTeam_M";

	_formato = (configfile >> "CfgGroups" >> "West" >> "Guerilla" >> "Infantry" >> _tipogrupo);
	_unidades = [_formato] call groupComposition;
	{_coste = _coste + (server getVariable _x); _hr = _hr +1} forEach _unidades;
}
else {
	_mrk = [campsFIA,_posicionTel] call BIS_fnc_nearestPosition;
	_pos = getMarkerPos _mrk;
	if (_posicionTel distance _pos >10) exitWith {hint "No camp nearby"};
};

_resourcesFIA = server getVariable "resourcesFIA";
_hrFIA = server getVariable "hr";

if (((_resourcesFIA < _coste) or (_hrFIA < _hr)) and (_tipo!= "delete")) exitWith {hint format ["You lack of resources to build this camp. \n %1 HR and %2 € needed",_hr,_coste]};

if (_tipo != "delete") then {
	[-_hr,-_coste] remoteExec ["resourcesFIA",2];
};

[[_tipo,_posicionTel],"establishCamp"] call BIS_fnc_MP;

