-module(time).
-export([swedish_date/0]).

swedish_date() ->
	[Year, Month, Day] = tuple_to_list(date()),
	integer_to_list((Year - 2000) * 10000 + Month * 100 + Day).