#include "cmake_project_template/cmake_project_template_libsrc.h"

void hello_world() {
    std::cout << __FILE__ << ":" << __LINE__ << " "
              << "Hello World!" << std::endl;
}
