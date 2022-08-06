# cmake/utils/InstallUtils.cmake
# ------------------------------------------------------------ #
# Install Destinations
# ------------------------------------------------------------ #
if (NOT DEFINED INSTALL_ARCHIVE_DESTINATION)
    set(INSTALL_ARCHIVE_DESTINATION arch)
endif()

if (NOT DEFINED INSTALL_LIBRARY_DESTINATION)
    set(INSTALL_LIBRARY_DESTINATION lib)
endif()

if (NOT DEFINED INSTALL_RUNTIME_DESTINATION)
    set(INSTALL_RUNTIME_DESTINATION bin)
endif()

if (NOT DEFINED INSTALL_OBJECTS_DESTINATION)
    set(INSTALL_OBJECTS_DESTINATION objs)
endif()

if (NOT DEFINED INSTALL_DEPENDENCIES_DESTINATION)
    set(INSTALL_DEPENDENCIES_DESTINATION deps)
endif()
# ------------------------------------------------------------ #
# Install Functions
# ------------------------------------------------------------ #
include(CMakeParseArguments)
function(install_targets)
    set(multiValueArgs TARGETS)

    cmake_parse_arguments(INSTALL "" "" "${multiValueArgs}" ${ARGN} )
    message(STATUS "INSTALL_TARGETS: ${INSTALL_TARGETS}")
    install(
        TARGETS ${INSTALL_TARGETS}
        COMPONENT TARGETS
        ARCHIVE DESTINATION ${INSTALL_ARCHIVE_DESTINATION}
        LIBRARY DESTINATION ${INSTALL_LIBRARY_DESTINATION}
        RUNTIME DESTINATION ${INSTALL_RUNTIME_DESTINATION}
        OBJECTS DESTINATION ${INSTALL_OBJECTS_DESTINATION}
    )
endfunction()

