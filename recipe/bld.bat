:: Manually specify CUDA host compiler instead of relying on setup scripts
:: https://gitter.im/conda-forge/conda-forge.github.io?at=5f8901b86c8d484be2898fc5

set CUDACXX="%CUDA_PATH%\bin\nvcc.exe"
set CUDAHOSTCXX="%CXX%"

echo "C compiler is %CC%"
%CC%
echo "CXX compiler is %CXX%"
%CXX%
echo "CUDA path is %CUDA_PATH%"
for /f "tokens=* usebackq" %%f in (`where nvcc`) do (set "dummy=%%f" && call set "CUDACXX=%%dummy:\=\\%%")
echo "CUDA compiler is %CUDACXX%"
echo "CUDA host compiler is %CUDAHOSTCXX%"
cmake -G Ninja -DCMAKE_BUILD_TYPE=Release^
  -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX%^
  %CMAKE_ARGS% %SRC_DIR%
ninja install
