#!/bin/bash
# clang-format-helper.sh

GREEN='\033[0;32m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m' # No Color

set -e
set -o pipefail

usage="
${GREEN}
Run gtest and generate coverage
Args:
    [-h] [--help] -- For help
    [-c] [--check] -- Check whether the whole project is in good state, only work under clean git state.

Examples:
    bash ./clang-format-helper.sh
    bash ./clang-format-helper.sh -c
    bash ./clang-format-helper.sh --check
${NC}
"

ARGS=$(getopt -o hc --long help,check -- "$@")

eval set -- "$ARGS"

help=false
check=false

while true; do
    case "$1" in
    -h | --help)
        help=true
        shift
        ;;
    -c | --check)
        check=true
        shift
        ;;
    --)
        shift
        break
        ;;
    *)
        echo "Internal error! $1"
        exit 1
        ;;
    esac
done

if [ ${help} == true ]; then
    echo -e "${usage}"
    exit 0
fi

echo
echo "Checking formatting using the following clang-format version:"
clang-format --version
echo

if [ $check == "true" ]; then
    if [ ! -z "$(git status --untracked-files=no --porcelain)" ]; then
        echo "Script must be applied on a clean git state"
        exit 1
    fi
fi

# perform clang-format on all cpp-files
file_list=$(
    find . -type f \
        ! -path "./.git/*" \
        ! -path "./3rdparty/*" \
        ! -path "./build*" \
        ! -path "./cmake*" \
        ! -path "./scripts" \
        ! -path "./web-resources" \
        ! -name "*.pb.h" \
        ! -name "*.pb.cc" |
        grep -E ".*(\.c|\.cc|\.cpp|\.h|\.hpp)$"
)

clang-format --style=file $file_list -i -Werror #--verbose

if [ $check == "true" ]; then
    # check if something was modified
    notcorrectlist=$(git status --porcelain | grep '^ M' | cut -c4-)
    # if nothing changed ok
    if [[ -z $notcorrectlist ]]; then
        # send a negative message to gitlab
        echo "Excellent. Very good formatting!"
        exit 0
    else
        echo "The following files have clang-format problems:"
        git diff
    fi
    exit 1
fi
