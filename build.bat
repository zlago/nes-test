@ ECHO OFF
:: assemble each file
ca65 -I src/inc/ src/main.65 -o obj/main.o
:: link the object files
ld65 -C nrom128.cfg obj/main.o -o bin/test.nes
:: done
pause