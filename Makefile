# assembler/linker defines
# flags
ASM_FLAGS  = -g $(addprefix -I,${INC_PATHS}) $(addprefix -D,${DEFINES})
LINK_FLAGS = --dbgfile bin/${BIN_NAME}.dbg -C ${CFG_FILE} -m bin/${BIN_NAME}.txt
# include paths
INC_PATHS = src/inc/ src/imp/ src/res/ # incbin seems not to be affected??
# (??? type) constants for ca65
DEFINES = ${CONFIG}
# pad value is defined in the config file
# cfg file
CFG_FILE = nrom128.cfg

# filename for the binary
BIN_NAME = test

# dependencies
ASM_REQS = $(shell find src/inc/ -name '*.i') $(shell find src/inc/ -name '*.imp')
	# i wonder if i could set this one to only trip for a .65 that shares the .imp's name
LINK_REQS = $(patsubst src/%.65,obj/%.o,$(shell find src/ -name '*.65'))
GFX_REQS = 

.PHONY: all clean

all: bin/${BIN_NAME}.nes

clean:
	rm -rf bin/
	rm -rf obj/

bin/:
	mkdir bin/

obj/:
	mkdir obj/

obj/%.o: src/%.65 $(ASM_REQS) $(GFX_REQS) obj/ 
	ca65 ${ASM_FLAGS} -o $@ $<

bin/${BIN_NAME}.nes: $(LINK_REQS) bin/
	ld65 ${LINK_FLAGS} -o $@ obj/*.o
