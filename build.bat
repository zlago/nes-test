@ ECHO OFF
:: assemble each file
ca65 -g -I src/inc/ -I src/imp/ src/main.65  -o obj/main.o
ca65 -g -I src/inc/ -I src/imp/ src/input.65 -o obj/input.o
ca65 -g -I src/inc/ -I src/imp/ src/reset.65 -o obj/reset.o
ca65 -g -I src/inc/ -I src/imp/ src/irq.65   -o obj/irq.o
ca65 -g -I src/inc/ -I src/imp/ src/nmi.65   -o obj/nmi.o

:: link the object files
ld65 --dbgfile bin/test.dbg -C nrom128.cfg obj/main.o obj/input.o obj/reset.o -m bin/test.txt obj/irq.o obj/nmi.o -o bin/test.nes

:: done
pause