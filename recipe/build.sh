
cd ./build

cmake -GNinja \
  -DCMAKE_BUILD_TYPE=Release \
  ${CMAKE_ARGS} \
  ${SRC_DIR}

cmake --build .

cmake --install .
