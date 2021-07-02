for /f "tokens=* usebackq" %%f in (`where nvcc`) do (set "dummy=%%f" && call set "CUDACXX=%%dummy:\=\\%%")
echo "nvcc is %CUDACXX%, CUDA path is %CUDA_PATH%"
echo "CMAKE_ARGS are %CMAKE_ARGS%"
cmake -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% %CMAKE_ARGS% %SRC_DIR%
ninja install