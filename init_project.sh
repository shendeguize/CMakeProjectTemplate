#!/bin/bash
# init_project.sh

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
Init the project with your project name.
Notice:
    ${RED}Your project should be snake style.${GREEN}
Args:
    [-h] [--help] -- For help
    [-n n] [--name n] -- Your project name.

Examples:
    bash ./init_project.sh -h
    bash ./init_project.sh -n your_project_name
    bash ./init_project.sh --name your_project_name
${NC}
"
ARGS=$(getopt -o hn: --long help,name: -- "$@")

eval set -- "$ARGS"

help=true
name=""

while true; do
    case "$1" in
    -h | --help)
        help=true
        shift
        ;;
    -n| --name)
        name="$2"
        help=false
        shift 2
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

name_snake=$name
name_camel=$(sed -r 's/(^|_)(\w)/\U\2/g' <<<"$name_snake")
name_upper=${name_snake^^}

echo -e "name_snake would be set to $name_snake"
echo -e "name_camel would be set to $name_camel"
echo -e "name_upper would be set to $name_upper"

read -r -p "Are you sure? [Y/N] " response
if [[ ! "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    echo "exit"
    exit 0
fi

