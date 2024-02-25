#!/bin/bash
source /dev/stdin <<< "$(curl -s https://raw.githubusercontent.com/pzyyll/shell_snippets/main/load.sh | bash color_echo mk_dir)"

color_echo "Hello, world!" red
mk_dir "test"
mk_dir "test/test1"