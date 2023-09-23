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
ASM_REQS = $(wildcard src/inc/*.i) $(wildcard src/inc/*.imp)
	# i wonder if i could set this one to only trip for a .65 that shares the .imp's name
LINK_REQS = $(patsubst src/%.65,obj/%.o,$(wildcard src/*.65))
GFX_REQS = 

.PHONY: all clean

all: bin/${BIN_NAME}.nes

clean:
	rm -rf bin/ obj/

obj/%.o: src/%.65 obj/%.d #$(ASM_REQS) $(GFX_REQS)
	@mkdir -p obj/
	ca65 ${ASM_FLAGS} -o $@ $<

obj/%.d: src/%.65
	@mkdir -p obj/
	@ca65 ${ASM_FLAGS} --create-full-dep $@ -o $@.tmp $<
	@sed 's;$@.tmp;$(patsubst %.d,%.o,$@);' -i $@
	@rm -f $@.tmp

bin/${BIN_NAME}.nes: $(LINK_REQS)
	@mkdir -p bin/
	ld65 ${LINK_FLAGS} -o $@ obj/*.o

include $(patsubst src/%.65,obj/%.d,$(wildcard src/*.65))
