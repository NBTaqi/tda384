-module(server).
-export([start/1,stop/1, call/2, loop/0]).

% Start a new server process with the given name
% Do not change the signature of this function.
start(ServerAtom) ->
	Pid= spawn( fun() -> loop(ServerAtom) end),
	catch(unregister(ServerAtom)),
	register(ServerAtom,Pid),
	Pid.
	
	%Pid = spawn(?MODULE, call, ["Server", "Running"]), 
	%register(ServerAtom,Pid),
	%io:fwrite("~p",[Pid]).
		
	
	% TODO Implement function
    % - Spawn a new process which waits for a message, handles it, then loops infinitely
    % - Register this process to ServerAtom
    % - Return the process ID
   %not_implemented.

%loop()->
%	io:fwrite("~p",[ServerAtom]).
	
loop(ServerAtom) ->
   receive 
      {msg, Message} -> 
         io:fwrite(" ~p~n" ,[Message]), 
         loop(); 
  
   Other ->
      io:fwrite("No Message (Server Running)"), 
      loop() 
   end.
      
%loop (state,F) ->
%	receive
%		{request, From, Ref, Data}->
%			case catch (F(state ,Data)) of
%				{'EXIT', Reason } ->
%				  From !{exit, Ref, Reason},
%				  loop(state, F);
%				{reply, R, Newstate} ->
%				  From!{result, Ref, R},
%				  loop(Newstate, F)
%				end;
%		{update, From, Ref, NewF} ->
%			From ! {ok, Ref},
%			loop(state, NewF);
%		stop ->
%			true
%	end.



call(Arg1, Arg2) -> 
   io:format("~p ~p~n", [Arg1,Arg2]). 

   

% Stop the server process registered to the given name,
% together with any other associated processes
   
   
stop(ServerAtom) ->
	%ServerAtom ! {stop, self(), 0},
	%ok.
	exit(whereis(ServerAtom),kill).
	
    % TODO Implement function
    % Return ok
    %not_implemented.
