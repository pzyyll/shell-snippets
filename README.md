# ShellSnippets
Just like the name of the repository, it defines some reusable functions.

# Use:

```
# e.g use color_echo
source /dev/stdin <<< "$(curl -s https://raw.githubusercontent.com/pzyyll/shell_snippets/main/color_echo)"

# You can also use the load.sh script to import the scripts you need in batch (such as color_echo, mk_dir, etc.)
source /dev/stdin <<< "$(curl -s https://raw.githubusercontent.com/pzyyll/shell_snippets/main/load.sh | bash color_echo mk_dir)"

```
