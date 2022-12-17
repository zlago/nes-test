@ ECHO OFF
:: assemble each file
ca65 -g -I src/inc/ src/main.65 -o obj/main.o
ca65 -g -I src/inc/ src/input.65 -o obj/input.o
:: link the object files
ld65 --dbgfile bin/test.dbg -C nrom128.cfg obj/main.o obj/input.o -m bin/test.txt -o bin/test.nes
:: done
pause