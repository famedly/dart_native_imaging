all: Imaging.js Imaging.wasm

JS_PREFIX := prefix.js
JS_SUFFIX := suffix1.js wrapper.js suffix2.js
JS_FUNCTIONS := functions.json
JS_METHODS := runtime_methods.json
SRC := ../ios/native_imaging/Sources/native_imaging/src

Imaging.js: build/libImaging.a $(JS_FUNCTIONS) $(JS_METHODS) $(JS_PREFIX) $(JS_SUFFIX)
	emcc -s MODULARIZE=1 -s ALLOW_MEMORY_GROWTH=1 -O3 --closure 1 \
	    -s EXPORTED_FUNCTIONS=@$(JS_FUNCTIONS) \
	    -s EXPORTED_RUNTIME_METHODS=@$(JS_METHODS) \
	    $(foreach f,$(JS_PREFIX),--extern-pre-js $(f)) \
	    $(foreach f,$(JS_SUFFIX),--extern-post-js $(f)) \
	    $< -o $@

Imaging.wasm: Imaging.js

$(JS_FUNCTIONS): custom_functions.json build/libImaging.a
	printf '#include "%s"\n' $(SRC)/extra.h \
	| emcc -I $(SRC) -I $(SRC)/blurhash -I ../codegen -E - \
	| jq -nR --slurpfile c $< \
	  '$$c + [inputs | select(test("IMAGING_EXPORT")) | scan("[^ ]+(?=\\()") | "_"+.]' > $@

build/lib%.a: build/Makefile FORCE
	$(MAKE) -C build $*

build/Makefile:
	emcmake cmake -DCMAKE_BUILD_TYPE=Release -DJPEG_ENCODE=OFF -S $(SRC) -B build

FORCE:
