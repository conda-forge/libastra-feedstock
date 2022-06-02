@REM This explicit path requires that the exact cudatoolkit is installed
set CUDACXX="%CUDA_PATH%\bin\nvcc.exe"
set "CUDACXX=%CUDACXX:\=/%"
set "CXX=%CXX:\=/%"

@REM Conda won't detect CUDA compiler version so manually set archs
set CUDAARCHS="35;50;60;70;80"

echo "CUDACXX is %CUDACXX%"
echo "CXX is %CXX%"
echo "CUDA_PATH is %CUDA_PATH%"
echo "CMAKE_ARGS are %CMAKE_ARGS%"

cd .\build
if errorlevel 1 exit /b 1

cmake -GNinja^
  -DCMAKE_BUILD_TYPE=Release^
  -DCMAKE_INSTALL_PREFIX:PATH="%LIBRARY_PREFIX%"^
  %CMAKE_ARGS%^
  %SRC_DIR%
if errorlevel 1 exit /b 1

cmake --build .
if errorlevel 1 exit /b 1

cmake --install .
if errorlevel 1 exit /b 1
