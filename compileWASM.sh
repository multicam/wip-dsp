#!/bin/bash

# CPP_FUNCS="[ '_grayScale', '_brighten', '_invert', '_noise', '_multiFilter', '_multiFilterFloat', '_sobelFilter', '_convFilter', '_doubler' ]" 

# echo "compiling C++ to WASM ..."
# emcc -o ./lib/webdsp_c.js ./cpp/webdsp.cpp \
# -lm -O3 \
# -s WASM=1 \
# -s ALLOW_MEMORY_GROWTH=1 \
# -s EXPORTED_FUNCTIONS="[ '_grayScale', '_brighten', '_invert', '_noise', '_multiFilter', '_multiFilterFloat', '_sobelFilter', '_convFilter', '_doubler' ]" \
# # -s EXPORT_ALL=1 \

# sed -i .bak 's/else{doRun()}/&script.dispatchEvent(doneEvent);/' lib/webdsp_c.js

# rm lib/*.bak

echo "compiling C++ to WASM ..."

emcc -o ./lib/webdsp_c.js ./cpp/webdsp.cpp -lm -O3 -s WASM=1 \
-s 'EXPORTED_FUNCTIONS=["_malloc","_free","_grayScale","_brighten","_invert","_noise","_multiFilter","_multiFilterFloat","_sobelFilter","_convFilter"]' \
-s ALLOW_MEMORY_GROWTH=1 

# sed -i '.bak' 's/else{doRun()}/&script.dispatchEvent(doneEvent);/' lib/webdsp_c.js

echo 'script.dispatchEvent(doneEvent);console.log("yo");' | tee -a lib/webdsp_c.js >/dev/null

echo "done"