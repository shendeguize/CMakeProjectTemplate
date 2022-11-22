# cmake/toolchains/linux/TC-x86_64-linux-gnu-gcc-g++.cmake
set(CMAKE_CROSSCOMPILING OFF)

set(_LOCAL_GCC_BIN_ROOT "/usr/bin")
set(CMAKE_GENERATOR "Unix Makefiles")
set(CMAKE_C_COMPILER "${_LOCAL_GCC_BIN_ROOT}/x86_64-linux-gnu-gcc-11")
set(CMAKE_CXX_COMPILER "${_LOCAL_GCC_BIN_ROOT}/x86_64-linux-gnu-g++-11")
set(CMAKE_LINKER "${_LOCAL_GCC_BIN_ROOT}/x86_64-linux-gnu-ld ")
