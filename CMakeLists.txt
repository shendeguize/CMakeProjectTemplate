# Project: CMakeProjectTemplate
# CMakeLists.txt

cmake_minimum_required(VERSION 3.15)

include(${CMAKE_CURRENT_LIST_DIR}/cmake/utils/CMakeUtils.cmake)
option(PRINT_VAR "Print variables. Default ON." ON)
option(PRINT_OPTION "Print option. Default ON." ON)
# **************************************** #
# Project Information
# **************************************** #
include(CMakeProjectTemplateConfig.cmake)
project(${CMAKE_PROJECT_TEMPLATE_PROJECT_NAME})

# **************************************** #
# Project Configurations
# **************************************** #
list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_LIST_DIR}/cmake)
include(${CMAKE_CURRENT_LIST_DIR}/cmake/configurations/Configurations.cmake)
set(CMAKE_INSTALL_PREFIX ${CMAKE_PROJECT_TEMPLATE_INSTALL_PREFIX})

# **************************************** #
# Project Sub-Directories
# **************************************** #
add_subdirectory(src)

# **************************************** #
# Project Installation
# **************************************** #

