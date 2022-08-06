# 3rdparty/3rdpartyConfig.cmake

# Note:
# 1. You don't actually need to compile all these 3rdparty libs. Just install or use pre-built binaries.
# 2. If you do want to compile and build these, please pay attention to the order

add_subdirectory(${CMAKE_CURRENT_LIST_DIR}/gflags)
add_subdirectory(${CMAKE_CURRENT_LIST_DIR}/glog)

if (NOT DEFINED BUILD_SHARED_LIBS)
    set(BUILD_SHARED_LIBS ON)
    set(BUILD_SHARED_LIBS_NOT_DEFINED ON)
endif()
if (NOT BUILD_SHARED_LIBS)
    MESSAGE(WARNING "GoogleTest may failed!")
endif ()
add_subdirectory(${CMAKE_CURRENT_LIST_DIR}/googletest)
add_subdirectory(${CMAKE_CURRENT_LIST_DIR}/benchmark)
if (BUILD_SHARED_LIBS_NOT_DEFINED)
    unset(BUILD_SHARED_LIBS)
    unset(BUILD_SHARED_LIBS_NOT_DEFINED)
endif ()

add_subdirectory(${CMAKE_CURRENT_LIST_DIR}/pybind11)


