:: Clean up build config files from upstream
rmdir /s /q build
mkdir build
cd build
if errorlevel 1 exit /b 1

cmake^
  -GNinja^
  -DBUILD_SHARED_LIBS:BOOL=ON^
  -DCMAKE_BUILD_TYPE=Release^
  -DCMAKE_INSTALL_PREFIX:PATH="%LIBRARY_PREFIX%"^
  -DASTRA_USE_CUDA:BOOL=%ASTRA_USE_CUDA%^
  %CMAKE_ARGS%^
  %SRC_DIR%
if errorlevel 1 exit /b 1

cmake --build . --config Release
if errorlevel 1 exit /b 1

cmake --install . --strip
if errorlevel 1 exit /b 1
