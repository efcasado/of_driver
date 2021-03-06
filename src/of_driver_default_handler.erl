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

-module(of_driver_default_handler).

-export([
    init/6,
    handle_connect/7,
    handle_message/2,
    handle_error/2,
    handle_disconnect/2,
    terminate/2
]).

init(_IpAddr, _DataPathId, _Features, _Version, _Connection, _InitOpt) ->
    {error, no_handler}.

handle_connect(_IpAddr, _DataPathId, _Features, _Version, _Connection, _AuxId, _InitOpt) ->
    {error, no_handler}.

% init/handle_connect refuse the connection, so these other callback
% functions should never be called.
handle_message(_Msg, State) ->
    {ok, State}.

handle_error(_Msg, State) ->
    {ok, State}.

handle_disconnect(_Reason, _State) ->
    ok.

terminate(_Reason, _State) ->
    ok.
