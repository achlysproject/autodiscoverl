%%% ----------------------------------------------------------------------------
%%% @author Igor Kopestenski <igor.kopestenski@uclouvain.be>
%%%     [https://ikopest.me]
%%% @doc
%%%         High level API module.
%%% @end

%% -----------------------------------------------------------------------------
-module(autodiscoverl).
-author('Igor Kopestenski').
%% -----------------------------------------------------------------------------
%% Exports:

%% API:
-export([start/0]).
-export([stop/0]).

%% -----------------------------------------------------------------------------
%% API:

-spec
start() ->
    ok | {'error',{atom(),_}}.
%% @doc
%%     Starts autodiscoverl application.
%% @end
start() ->
    case application:ensure_all_started(autodiscoverl) of
        {ok, _} ->
            ok;
        Err ->
            Err
    end.


-spec
stop() ->
    ok.
%% @doc
%%     Stops autodiscoverl application.
%% @end
stop() ->
    application:stop(autodiscoverl).
