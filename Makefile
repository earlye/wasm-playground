$(info Entering directory `$(shell pwd)') # close the quotes: '`

.PHONY: all
all: \
	dist/sum.wasm
	dist/sum.js

clean:
	rm -rf dist

.PHONY: .%
.%: dist/%.js dist/%.wasm dist/wasmLoad.js
	node --version
	cd $(dir $<) && node $(notdir $<)


dist/%.wasm : src/%.wat dist
	wat2wasm $< 2>&1 | sed "s/\\.wat[^:]*:/.wat:/g"
	mv $(dir $<)/$(notdir $@) $(dir $@)

dist/%.js : src/%.js dist
	cp $< $@

dist:
	mkdir $@
