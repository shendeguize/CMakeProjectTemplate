# cmake/utils/PrintUtils.cmake

function(_print_cmake_var_inner _control_flag _var_type _var_name)
    if (_control_flag)
        message(STATUS "${_var_type} ${_var_name}: ${${_var_name}}")
    endif ()
endfunction()

if (NOT DEFINED PRINT_VAR)
    set(PRINT_VAR ON)
endif ()

function(print_variable _var_name)
    _print_cmake_var_inner(PRINT_VAR Variable ${_var_name})
endfunction()


if (NOT DEFINED PRINT_OPTION)
    set(PRINT_OPTION ON)
endif ()

function(print_option _option_name)
    _print_cmake_var_inner(PRINT_OPTION Option ${_option_name})
endfunction()



