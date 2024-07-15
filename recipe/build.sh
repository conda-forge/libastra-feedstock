
cd ./build

cmake -GNinja \
  -DCMAKE_BUILD_TYPE=Release \
  -DASTRA_USE_CUDA:BOOL=${ASTRA_USE_CUDA} \
  ${CMAKE_ARGS} \
  ${SRC_DIR}

cmake --build . -v

cmake --install . --strip
