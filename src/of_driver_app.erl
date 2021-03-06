%%------------------------------------------------------------------------------
%% Copyright 2014 FlowForwarding.org
%%
%% Licensed under the Apache License, Version 2.0 (the "License");
%% you may not use this file except in compliance with the License.
%% You may obtain a copy of the License at
%%
%%     http://www.apache.org/licenses/LICENSE-2.0
%%
%% Unless required by applicable law or agreed to in writing, software
%% distributed under the License is distributed on an "AS IS" BASIS,
%% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%% See the License for the specific language governing permissions and
%% limitations under the License.
%%-----------------------------------------------------------------------------

%% @author Erlang Solutions Ltd. <openflow@erlang-solutions.com>
%% @copyright 2014 FlowForwarding.org

-module(of_driver_app).
-copyright("2013, Erlang Solutions Ltd.").

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    of_driver_db:install(),
    ok = lager:start(),
    case of_driver_sup:start_link() of
		{ok, Pid} -> {ok, Pid};
		Error     -> Error
    end.

stop(_State) ->
    ok.
