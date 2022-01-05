%Stephen Stengel <stephen.stengel@cwu.edu>
%Prolog program to estimate the value of pi using monte carlo methods
%Compiling is easiest by using "make". See the README.
%Feel free to use and modify this for any purpose.
%This code probably isn't great. I stopped working on it as soon as it
%started working.  :^)


%Hello world function.
helloTest :-
	write("Hello!"), nl,
	halt.


%Base case of the slow loop
mcLoop(0, CountIn, TotalPoints):-
	%write("N is zero"), nl,
	%write("CountIn: "), write(CountIn), nl,
	%write("TotalPoints: "), write(TotalPoints), nl,
	PIapprox is 4.0 * CountIn / TotalPoints,
	write("PIapprox: "), write(PIapprox), nl.

%The slow loop. The ( -> ; ) bit is a ternary if-else, like in C.
mcLoop(N, CountIn, TotalPoints):-
	N > 0,
	M is N - 1,
	%write("Iteration: "), write(N), nl,
	random(X),
	random(Y),
	%write("X: "), write(X), nl,
	%write("Y: "), write(Y), nl,
	Distance is X^2 + Y^2,
	%write("Distance: "), write(Distance), nl,
	(Distance < 1
		-> 
			%write("Distance less than 1. Incrementing."), nl, nl,
			NewCountIn is CountIn + 1,
			mcLoop(M, NewCountIn, TotalPoints)
		;
			%nl,
			mcLoop(M, CountIn, TotalPoints)
	).


%Faster loop. Uses a running sum.
mcLoopFast(N, RunningSum, TotalPoints):-
	N > 0,
	M is N - 1,
	%write("Iteration: "), write(N), nl,
	random(X),
	%write("X: "), write(X), nl,
	ThisValue is sqrt(1 - (X^2)),
	%write("ThisValue: "), write(ThisValue), nl,
	NewRunningSum is RunningSum + ThisValue,
	%write("NewRunningSum: "), write(NewRunningSum), nl,
	mcLoopFast(M, NewRunningSum, TotalPoints).

%Faster loop base case.
mcLoopFast(0, RunningSum, TotalPoints):-
	%write("N is zero"), nl,
	%write("RunningSum: "), write(RunningSum), nl,
	%write("TotalPoints: "), write(TotalPoints), nl,
	PIapprox is 4.0 * RunningSum / TotalPoints,
	write("PIapprox: "), write(PIapprox), nl.


%Helper to run the slow loop.
runloop(0).
runloop(N):-
	N > 0, write("Running..."), nl,
	TotalPoints is N,
	CountIn is 0,
	%write("CountIn: "), write(CountIn), nl,
	mcLoop(N, CountIn, TotalPoints), nl,
	write("DONE"), nl,
	halt.

%Helper to run the faster loop.
runloopFast(0).
runloopFast(N):-
	N > 0, write("Running..."), nl,
	TotalPoints is N,
	CountIn is 0,
	%write("CountIn: "), write(CountIn), nl,
	mcLoopFast(N, CountIn, TotalPoints), nl,
	write("DONE"), nl,
	halt.


%A loop I found on duckduckgo
testloop(0).
testloop(N):- N>0,write("Number: "),write(N),nl, M is N-1, testloop(M).
