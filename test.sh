#!/bin/bash

source /dev/stdin <<< "$(curl -s https://raw.githubusercontent.com/pzyyll/shell-snippets/main/load.sh | bash -s -- color_echo mk_dir)"

# source /dev/stdin <<< "$(bash ./load.sh color_echo mk_dir)"

color_echo "Hello, world!" red
mk_dir "test"
mk_dir "test/test1"