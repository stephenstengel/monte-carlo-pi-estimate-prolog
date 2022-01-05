#Stephen Stengel <stephen.stengel@cwu.edu>
#makefile for these thingies

#Make all the thingies
all:
	make fast5m && make slow5m && make fast50m && make fast500m \
		&& make hello


#Make individual thingies
fast5m: mcpprolog.pl
	prolog -o fast5m -g "runloopFast(5000000)" -c mcpprolog.pl

slow5m: mcpprolog.pl
	prolog -o slow5m -g "runloop(5000000)" -c mcpprolog.pl

fast50m: mcpprolog.pl
	prolog -o fast50m -g "runloopFast(50000000)" -c mcpprolog.pl

fast500m: mcpprolog.pl
	prolog -o fast500m -g "runloopFast(500000000)" -c mcpprolog.pl

hello: mcpprolog.pl
	prolog -o hello -g "helloTest" -c mcpprolog.pl


#Miscellaneous
.PHONY: clean
clean:
	rm -f fast5m slow5m fast50m fast500m hello mcpprolog.zip

#These last three were for my convenience.
.PHONY: backup
backup:
	ssh-backup-pi | lolcat

.PHONY: zip
zip:
	7z a mcpprolog.zip Makefile README.txt mcpprolog.pl LICENSE

.PHONY: script
script:
	make clean && make && make zip && make backup
