# cmake/toolchains/linux/x86_64-linux-gnu-gcc/TC-aarch64-x86_64-linux-gnu-gcc.cmake
set(CMAKE_CROSSCOMPILING ON)

set(MY_LOCAL_GCC_BIN_ROOT "/usr/bin")
set(CMAKE_GENERATOR "Unix Makefiles")
set(CMAKE_C_COMPILER "${MY_LOCAL_GCC_BIN_ROOT}/aarch64-linux-gnu-gcc-11")
set(CMAKE_CXX_COMPILER "${MY_LOCAL_GCC_BIN_ROOT}/aarch64-linux-gnu-g++-11")
set(CMAKE_LINKER "${MY_LOCAL_GCC_BIN_ROOT}/aarch64-linux-gnu-ld ")
