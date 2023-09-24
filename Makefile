# assembler/linker defines
# flags
ASM_FLAGS  = -g -I./ --bin-include-dir ./ $(addprefix -D,${DEFINES})
LINK_FLAGS = --dbgfile bin/${BIN_NAME}.dbg -C ${CFG_FILE} -m bin/${BIN_NAME}.txt
# (??? type) constants for ca65
DEFINES = ${CONFIG}
# pad value is defined in the config file
# cfg file
CFG_FILE = nrom128.cfg

# filename for the binary
BIN_NAME = test

# dependencies
LINK_REQS = $(patsubst src/%.65,obj/%.o,$(wildcard src/*.65))

.PHONY: all clean

all: bin/${BIN_NAME}.nes

clean:
	rm -rf bin/ obj/ d/

obj/%.o: src/%.65 d/%.d
	@mkdir -p obj/
	ca65 ${ASM_FLAGS} -o $@ $<

d/%.d: src/%.65
	@mkdir -p d/
	@sed 's/^\.inc\(bin\|lude\) \+"\(.*\)".*/\2/p;d' $< | sed ':a;N;s/\n/ /;ba' | sed 's|.*|$(patsubst d/%.d,obj/%.o,$@): &|' > $@

bin/${BIN_NAME}.nes: $(LINK_REQS)
	@mkdir -p bin/
	ld65 ${LINK_FLAGS} -o $@ obj/*.o

include $(patsubst src/%.65,d/%.d,$(wildcard src/*.65))
