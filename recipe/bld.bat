for /f "tokens=* usebackq" %%f in (`where nvcc`) do (set "dummy=%%f" && call set "CUDACXX=%%dummy:\=\\%%")
echo "nvcc is %CUDACXX%, CUDA path is %CUDA_PATH%"
echo "CMAKE_ARGS are %CMAKE_ARGS%"

cd .\build
if errorlevel 1 exit /b 1

cmake -GNinja^
  -DCMAKE_BUILD_TYPE=Release^
  -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX%^
  -DCMAKE_CXX_COMPILER=%CXX%^
  -DCMAKE_C_COMPILER=%CC%^
  -DCMAKE_CUDA_COMPILER=%CUDACXX%^
  %CMAKE_ARGS%^
  %SRC_DIR%
if errorlevel 1 exit /b 1

cmake --build .
if errorlevel 1 exit /b 1

cmake --install .
if errorlevel 1 exit /b 1
