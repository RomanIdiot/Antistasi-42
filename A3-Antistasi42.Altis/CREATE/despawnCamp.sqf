if (!isServer and hasInterface) exitWith {};

/*
0: position of the camp
1: type of the camp
*/

_pos = _this select 0;
_type = _this select 1;
_objs = [];

{
	if (str typeof _x find "Land_Campfire_" > -1) then {_x inflame false;};
} forEach nearestObjects [_pos, [], 15];
sleep 2;

if (_type == "campFIA") then {
	{
    	if ((  str typeof _x find "Land_TentA_" > -1
        	or str typeof _x find "Land_Campfire_" > -1
        	or str typeof _x find "Land_FoodContainer_01_" > -1
        	or str typeof _x find campCrate > -1))
		then {
        	_objs pushBack _x;
   		};
	} forEach nearestObjects [_pos, [], 15];

}
else {
	if (_type == "campTony") then {
	{
		 if (  str typeof _x find blackMarketCrate > -1
       	    or str typeof _x find "Land_Wreck_Ural_F" > -1
        	or str typeof _x find "Land_TentDome_F" > -1
        	or str typeof _x find "Land_Campfire_" > -1)
		then {
        	_objs pushBack _x;
    	};
	} forEach nearestObjects [_pos, [], 15];
	};
};

{
	_x enableSimulation false;
    _x hideObjectGlobal true;
} foreach _objs;