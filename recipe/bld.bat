:: Manually specify CUDA host compiler instead of relying on setup scripts
:: https://gitter.im/conda-forge/conda-forge.github.io?at=5f8901b86c8d484be2898fc5

:: nvcc activation script does not set these env variables
set "CUDACXX=%CUDA_HOME%\bin\nvcc.exe"
set "CUDAHOSTCXX=%CXX%"

echo "C compiler is %CC%"
"%CC%"
echo "CXX compiler is %CXX%"
"%CXX%"
echo "CUDA path is %CUDA_PATH%"
echo "CUDA home is %CUDA_HOME%"
echo "CUDA compiler is %CUDACXX%"
"%CUDACXX%" --version
echo "CUDA host compiler is %CUDAHOSTCXX%"
echo "CMAKE_ARGS is %CMAKE_ARGS%"
echo "SRC_DIR is %SRC_DIR%"
dir
if %errorlevel% neq 0 exit /b %errorlevel%

:: Overriding activation scripts does not work
::  -DCMAKE_CUDA_COMPILER="%CUDACXX:\=/%" ^
::  -DCMAKE_CUDA_HOST_COMPILER="%CUDAHOSTCXX:\=/%" ^
cmake -GNinja ^
      -DCMAKE_INSTALL_PREFIX:PATH="%LIBRARY_PREFIX%" ^
      -DCMAKE_PREFIX_PATH:PATH="%LIBRARY_PREFIX%" ^
      -DCMAKE_BUILD_TYPE:STRING=Release ^
      %CMAKE_ARGS% .
if %errorlevel% neq 0 exit /b %errorlevel%

ninja install .
if %errorlevel% neq 0 exit /b %errorlevel%
exit /b 0
