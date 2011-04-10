-module(lists1).
-export([min/1, max/1, min_max/1]).
-compile({no_auto_import, [min/2, max/2]}).

% min([E|L]) when L == [] -> E;
% min([E1, E2| L]) when E1 < E2 -> min([E1] ++ L);
% min([E1, E2| L]) when E1 > E2 -> min([E2] ++ L).

% max([E|L]) when L == [] -> E;
% max([E1, E2| L]) when E1 > E2 -> max([E1] ++ L);
% max([E1, E2| L]) when E1 < E2 -> max([E2] ++ L).

min([E|L]) -> min(E, L).
min(E, []) -> E;
min(E1, [E2|L]) when E1 < E2 -> min(E1, L);
min(_E1, [E2|L]) -> min(E2, L).

max([E|L]) -> max(E, L).
max(E, []) -> E;
max(E1, [E2|L]) when E1 > E2 -> max(E1, L);
max(_E1, [E2|L]) -> max(E2, L).

min_max([E|L]) -> min_max({E, E}, L).
min_max(MinMax, []) -> MinMax;
min_max({Min, Max}, [E|L]) when E < Min -> min_max({E, Max}, L);
min_max({Min, Max}, [E|L]) when E > Max -> min_max({Min, E}, L);
min_max(MinMax, [_E|L]) -> min_max(MinMax, L).