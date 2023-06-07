:: Clean up build config files from upstream
del astra_vc14*
rmdir /s /q build
mkdir build
cd build
if errorlevel 1 exit /b 1

for /f "tokens=* usebackq" %%f in (`where cl.exe`) do (set "dummy=%%f" && call set "CXX=%%dummy:\=\\%%")
echo %CXX%
for /f "tokens=* usebackq" %%f in (`where cl.exe`) do (set "dummy=%%f" && call set "CC=%%dummy:\=\\%%")
echo %CC%

set "CMAKE_GENERATOR_PLATFORM="
set "CMAKE_GENERATOR_TOOLSET="

:: Conda-forge CUDA build environment does not work with Ninja
cmake^
  -DBUILD_SHARED_LIBS:BOOL=ON^
  -DCMAKE_BUILD_TYPE=Release^
  -DCMAKE_INSTALL_PREFIX:PATH="%LIBRARY_PREFIX%"^
  -DASTRA_USE_CUDA:BOOL=%ASTRA_USE_CUDA%^
  %CMAKE_ARGS%^
  %SRC_DIR%
if errorlevel 1 exit /b 1

cmake --build . --config Release
if errorlevel 1 exit /b 1

cmake --install .
if errorlevel 1 exit /b 1
