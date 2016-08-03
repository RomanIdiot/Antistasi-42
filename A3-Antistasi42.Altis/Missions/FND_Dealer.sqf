if (!isServer and hasInterface) exitWith{};

_sites = ciudades - mrkAAF;
if (count _sites == 0) exitWith{hint "You need the support of at least one city."};

_site = selectRandom _sites;
_position = getMarkerPos _site;

_tiempolim = floor random [30,60,90];;
_fechalim = [date select 0, date select 1, date select 2, date select 3, (date select 4) + _tiempolim];
_fechalimnum = dateToNumber _fechalim;

_range = [_site] call sizeMarker;
_bldgs = nearestObjects [_position, ["house"], _range];
_posbldg = [];
_bldg = _bldgs select 0;
while {count _posbldg < 3} do
	{
	_bldg = _bldgs call BIS_Fnc_selectRandom;
	_posbldg = [_bldg] call BIS_fnc_buildingPositions;
	if (count _posbldg < 3) then {_bldgs = _bldgs - [_bldg]};
	};

_posDealer = selectRandom _posbldg;
_nombredest = [_site] call localizar;

_grpDealer = createGroup side_blue;
_dealer = _grpDealer createUnit ["C_Nikos_aged", _posDealer, [], 0, "FORM"];
_dealer setIdentity "Nomad";
_dealer disableAI "move";
_dealer setunitpos "up";

[[_dealer,"bm_mission"],"flagaction"] call BIS_fnc_MP;

_posTsk = (position _bldg) getPos [random 100, random 360];

_tsk = ["FND",[side_blue,civilian],[format ["A former associate of Petros' is trying to leave Altis. His departure is scheduled for %2:%3. If you manage to get to him in time, you might be able to convince him to stay and support our case. Unfortunatly, we are unaware of his current location, but he was spotted near %1. Most likely, he'll have taken shelter in a building...",_nombredest,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4],"Find the Veteran",_site],_posDealer,"CREATED",5,true,true,"Find"] call BIS_fnc_setTask;
misiones pushBack _tsk; publicVariable "misiones";

waitUntil {sleep 1; (dateToNumber date > _fechalimnum) or (not alive _dealer) or ({(side _x == side_blue) and (_x distance _dealer < 5)} count allUnits > 0)};

_tsk = ["FND",[side_blue,civilian],[format ["A former associate of Petros' is trying to leave Altis. His departure is scheduled for %2:%3. If you manage to get to him in time, you might be able to convince him to stay and support our case. Unfortunatly, we are unaware of his current location, but he was spotted near %1. Most likely, he'll have taken shelter in a building...",_nombredest,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4],"Find the Veteran",_site],_posDealer,"SUCCEEDED",5,true,true,"Find"] call BIS_fnc_setTask;

_mrkDealer = createMarker [format ["Nomad%1", random 100], _posDealer];
_mrkDealer setMarkerShape "ICON";

nomadPos = [_mrkDealer]; publicVariable "nomadPos";
marcadores = marcadores + [_mrkDealer]; publicVariable "marcadores";
spawner setVariable [_mrkDealer,false,true];
_mrkDealer setMarkerType "loc_bunker";
_mrkDealer setMarkerColor "ColorOrange";
_mrkDealer setMarkerText "Nomad";