%%% ----------------------------------------------------------------------------
%%% @author <Igor Kopestenski>
%%% @doc
%%%         autodiscoverl application behaviour implementation.
%%% @end
%%% @hidden

%% -----------------------------------------------------------------------------
-module(autodiscoverl_app).
-author('Igor Kopestenski').
-behaviour(application).
%% -----------------------------------------------------------------------------
%% Exports:

%% 'application' callbacks:
-export([start/2
        ,stop/1]).

%% -----------------------------------------------------------------------------
%% 'application' callbacks:

%% @hidden
start(_, _) -> % (Type, InitArg)
    autodiscoverl_sup:start_link().


%% @hidden
stop(_) -> % (State)
    ok.
