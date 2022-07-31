# cmake/configurations/Options.cmake
include(${CMAKE_CURRENT_LIST_DIR}/../utils/PrintUtils.cmake)
if (NOT DEFINED OPTIONS_SET)
    option(OPTION_BUILD_SHARED_LIBS "Build shared libraries. Default: ON." ON)
    option(OPTION_BUILD_STATIC_LIBS "Build static libraries. Default: ON." ON)
    option(OPTION_BUILD_TESTS "Build tests. Default: ON." ON)
    option(OPTION_BUILD_BENCHMARKS "Build benchmarks. Default: ON." ON)
    option(OPTION_BUILD_EXAMPLES "Build examples. Default: OFF." OFF)
    option(OPTION_VISIBILITY_HIDDEN "Hide symbol visibility for shared library. Default: OFF." OFF)
    option(OPTION_INSTALL_DEPENDENCIES "Install all dependencies and re-link them. Default OFF." OFF)
    option(OPTION_GLOB_RECURSE_FILES "Use GLOB_RECURSE to get all source files. Default OFF." OFF)

    set(OPTIONS_SET TRUE)

    print_option(OPTION_BUILD_SHARED_LIBS)
    print_option(OPTION_BUILD_STATIC_LIBS)
    print_option(OPTION_BUILD_TESTS)
    print_option(OPTION_BUILD_BENCHMARKS)
    print_option(OPTION_BUILD_EXAMPLES)
    print_option(OPTION_VISIBILITY_HIDDEN)
    print_option(OPTION_INSTALL_DEPENDENCIES)
    print_option(OPTION_GLOB_RECURSE_FILES)
endif ()


