# src/CMakeLists.txt

# **************************************** #
# Project Information
# **************************************** #
project(${CMAKE_PROJECT_TEMPLATE_PROJECT_NAME} C CXX)

# **************************************** #
# Project Sources
# **************************************** #
if (OPTION_GLOB_RECURSE_FILES)
    file(GLOB_RECURSE CMAKE_PROJECT_TEMPLATE_PROJECT_CFILES
        ${CMAKE_PROJECT_TEMPLATE_SOURCE_DIR}/*c
        ${CMAKE_PROJECT_TEMPLATE_SOURCE_DIR}/*cc
        ${CMAKE_PROJECT_TEMPLATE_SOURCE_DIR}/*cpp)

    file(GLOB_RECURSE CMAKE_PROJECT_TEMPLATE_PROJECT_HFILES
        ${CMAKE_PROJECT_TEMPLATE_INCLUDE_DIR}/*h
        ${CMAKE_PROJECT_TEMPLATE_INCLUDE_DIR}/*hpp)

    list(REMOVE CMAKE_PROJECT_TEMPLATE_PROJECT_CFILES ${CMAKE_CURRENT_LIST_DIR}/executable_hello_world.cpp)
else ()
    set(CMAKE_PROJECT_TEMPLATE_PROJECT_CFILES
        ${CMAKE_PROJECT_TEMPLATE_SOURCE_DIR}/lib_hello_world.cpp)

    set(CMAKE_PROJECT_TEMPLATE_PROJECT_HFILES
        ${CMAKE_PROJECT_TEMPLATE_INCLUDE_DIR}/cmake_project_template/lib_hello_world.h)
endif ()
set(CMAKE_PROJECT_TEMPLATE_EXECUTABLE_CFILES ${CMAKE_CURRENT_LIST_DIR}/executable_hello_world.cpp)

# **************************************** #
# Project Targets
# **************************************** #
set(PROJECT_OBJECT_NAME ${PROJECT_NAME}_object)
add_library(${PROJECT_OBJECT_NAME} OBJECT
    ${CMAKE_PROJECT_TEMPLATE_PROJECT_CFILES} ${CMAKE_PROJECT_TEMPLATE_PROJECT_HFILES})
set_property(TARGET ${PROJECT_OBJECT_NAME} PROPERTY POSITION_INDEPENDENT_CODE 1)

if (OPTION_BUILD_SHARED_LIBS)
    set(PROJECT_SHARED_NAME ${PROJECT_NAME}_shared)
    add_library(${PROJECT_SHARED_NAME} SHARED
        $<TARGET_OBJECTS:${PROJECT_OBJECT_NAME}>)
    add_library(${PROJECT_NAME}::shared ALIAS ${PROJECT_SHARED_NAME})
    set_target_properties(${PROJECT_SHARED_NAME} PROPERTIES OUTPUT_NAME ${PROJECT_NAME})
endif ()

if (OPTION_BUILD_STATIC_LIBS)
    set(PROJECT_STATIC_NAME ${PROJECT_NAME}_static)
    add_library(${PROJECT_STATIC_NAME} STATIC
        $<TARGET_OBJECTS:${PROJECT_OBJECT_NAME}>)
    add_library(${PROJECT_NAME}::static ALIAS ${PROJECT_STATIC_NAME})
    set_target_properties(${PROJECT_STATIC_NAME} PROPERTIES OUTPUT_NAME ${PROJECT_NAME})
endif ()

set(PROJECT_EXECUTABLE_NAME ${PROJECT_NAME}_executable)
add_executable(${PROJECT_EXECUTABLE_NAME} ${CMAKE_PROJECT_TEMPLATE_EXECUTABLE_CFILES})

# **************************************** #
# Targets Includes and linkages
# **************************************** #

# ********** library ********** #
set(PROJECT_LIB_INCLUDE_DIRS
    ${CMAKE_PROJECT_TEMPLATE_INCLUDE_DIR}
    )

set(PROJECT_LIB_LINKAGE_LIBRARIES
    )

target_include_directories(${PROJECT_OBJECT_NAME} PUBLIC
    ${PROJECT_LIB_INCLUDE_DIRS}
    )

target_link_libraries(${PROJECT_OBJECT_NAME} PUBLIC
    ${PROJECT_LIB_LINKAGE_LIBRARIES}
    )

# ********** executable ********** #
set(PROJECT_EXE_INCLUDE_DIRS
    ${CMAKE_PROJECT_TEMPLATE_INCLUDE_DIR}
    )

set(PROJECT_EXE_LINKAGE_LIBRARIES
    ${PROJECT_OBJECT_NAME}
    )

target_include_directories(${PROJECT_EXECUTABLE_NAME} PUBLIC
    ${PROJECT_EXE_INCLUDE_DIRS}
    )

target_link_libraries(${PROJECT_EXECUTABLE_NAME} PUBLIC
    ${PROJECT_EXE_LINKAGE_LIBRARIES}
    )