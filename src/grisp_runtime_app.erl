-module(grisp_runtime_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    {ok, App} = application:get_application(?MODULE),
    {ok, Vsn} = application:get_key(App, vsn),
    io:format("Kontron AL/BL iMX8 Mini Runtime ~s~n", [Vsn]),
    grisp_runtime_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
