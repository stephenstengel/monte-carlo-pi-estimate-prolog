stephen stengel <stephen.stengel@cwu.edu> 29 May, 2020
Readme for my Monte Carlo Prolog thingy.
Feel free to use and modify this for any purpose.
Licensed under the MIT license.
This prolog script implements a Monte Carlo Method for estimating PI
using recursion.

-----

These instructions are for linux. To run this stuff you will need a
prolog compiler, like swi-prolog, and it will be helpfull to install
"make". Also, if you don't have 7zip, that's a great tool as well:

sudo apt install swi-prolog make p7zip p7zip-full

Unzip the folder that this stuff came in:

7z x mcpprolog.zip

Then, you can compile the predicates automatically by typing:

make

Then you can type "ls" to see the executables. You can run them like:

./fast5m

Or, to time them:

time ./fast5m

fast5m runs with five million random points, fast50m with 50 million,
and fast500m with 500 million. fast50m takes about 6 minutes to run on
my raspberry pi 3 and about a minute on my core 2 duo.

You can halt unresponsive prolog scripts by pressing:

control + c

and then:

control + d

-----

You can also run these thingies inside the prolog interpreter if you
want. Just type "prolog" without any arguments to open the interpreter.
Then, inside the interpreter, type:

consult("mcpprolog.pl").

Which will load all the predicates for use. Then you can call any of the
predicates in the file, like:

runloopFast(123).

If you do this, you should remove the "halt"s from the ends of some of
the definitions; I put those in for command line use.

-----

To do this stuff in python should be pretty easy. Here are my versions
in Lua. You will barely need to change it to translate it to python. I'm
feeling lazy now. Bye!
Make sure your random numbers are floats between [0 and 1)!

function betterPiEstimate(numberOfPoints)
    local runningSum = 0
    for i = 1, numberOfPoints do
        local x = math.random()
        runningSum = runningSum + math.sqrt(1 - x^2)
    end
    return 4.0 * runningSum / numberOfPoints
end

function piEstimate(numberOfPoints)
    local countIn = 0
    for i = 1, numberOfPoints do
        local x,y = math.random(), math.random()
        if (x*x + y*y < 1) then
            countIn = countIn + 1
        end
    end
    return countIn * 4.0 / numberOfPoints
end
