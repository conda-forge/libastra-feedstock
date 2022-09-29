cd .\build
if errorlevel 1 exit /b 1

:: Conda-forge CUDA build environment does not work with Ninja
cmake^
  -DBUILD_SHARED_LIBS:BOOL=ON^
  -DCMAKE_BUILD_TYPE=Release^
  -DCMAKE_INSTALL_PREFIX:PATH="%LIBRARY_PREFIX%"^
  -DASTRA_USE_CUDA:BOOL=%ASTRA_USE_CUDA%^
  %CMAKE_ARGS%^
  %SRC_DIR%
if errorlevel 1 exit /b 1

cmake --build .
if errorlevel 1 exit /b 1

cmake --install .
if errorlevel 1 exit /b 1
