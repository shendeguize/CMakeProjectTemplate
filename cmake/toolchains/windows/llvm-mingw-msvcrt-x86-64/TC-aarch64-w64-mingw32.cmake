# cmake/toolchains/windows/llvm-mingw-msvcrt-x86-64/TC-aarch64-w64-mingw32.cmake
set(CMAKE_CROSSCOMPILING ON)

set(MY_LOCAL_LLVM_MINGW_ROOT "D:/Program Files/toolchains/llvm-mingw-20220323-msvcrt-x86_64")
set(CMAKE_GENERATOR "MinGW Makefiles")
set(CMAKE_C_COMPILER "${MY_LOCAL_LLVM_MINGW_ROOT}/bin/aarch64-w64-mingw32-cc.exe")
set(CMAKE_CXX_COMPILER "${MY_LOCAL_LLVM_MINGW_ROOT}/bin/aarch64-w64-mingw32-c++.exe")
set(CMAKE_LINKER "aarch64-w64-mingw32-ld")
