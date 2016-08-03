_tiempo = _this select 0;

_tiempo = _tiempo - (lastIncome) - (50*(count (mrkFIA - puestosFIA)));

if (_tiempo < 0) then {_tiempo = 0};

cuentaCA = cuentaCA + round (random _tiempo);

publicVariable "cuentaCA";






