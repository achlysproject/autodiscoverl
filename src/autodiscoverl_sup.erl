%%% ----------------------------------------------------------------------------
%%% @author Igor Kopestenski <igor.kopestenski@uclouvain.be>
%%%     [https://ikopest.me]
%%% @doc
%%%         autodiscoverl root supervisor implementation.
%%% @end
%%% @hidden
%%% ----------------------------------------------------------------------------

%% -----------------------------------------------------------------------------
-module(autodiscoverl_sup).

-author('Igor Kopestenski').

-behaviour(supervisor).
%% -----------------------------------------------------------------------------
%% Exports:

%% 'application' API:
-export([start_link/0]).

%% 'supervisor' callback:
-export([init/1]).

%% -----------------------------------------------------------------------------
%% Records & Macros & Includes:

-define(PROC, ?MODULE).

%% -----------------------------------------------------------------------------
%% API:

-spec
start_link() ->
    {ok, pid()} | {error, term()} | ignore.
start_link() ->
    supervisor:start_link({local, ?PROC}, ?MODULE, undefined).


%% -----------------------------------------------------------------------------
%% 'supervisor' callbacks:

%% @hidden
init(_) -> % (undefined)
    {ok, { {one_for_all, 0, 1}, []} }.
