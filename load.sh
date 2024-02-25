#!/bin/bash

# Load the functions
CURL="curl -sf"
WGET="wget -qO-"
GIT_RAW_URL="https://raw.githubusercontent.com/pzyyll/shell-snippets"

get_url() {
    if [ -x "$(command -v curl)" ]; then
        $CURL "$1"
    elif [ -x "$(command -v wget)" ]; then
        $WGET "$1"
    else
        echo "Neither curl nor wget is installed."
        return 1
    fi
}

# 解析命令行选项
version="main"
while [[ $# -gt 0 ]]; do
    case "$1" in
        -v)
            if [[ -n $2 && $2 != -* ]]; then
                version="$2"
                shift # 跳过选项值
            else
                echo "Error: -v option requires a value."
                exit 1
            fi
            ;;
        -v*) # 紧凑形式的版本号，如 -v3.0.1
            version="${1#-v}" # 删除前缀 -v，保留版本号
            ;;
        *)
            # 如果不是 -v 选项，假设它是一个非选项参数，退出循环
            break
            ;;
    esac
    shift # 跳过已处理的选项或非选项参数
done

root_url="$GIT_RAW_URL/$version"

content=""
for arg in "$@"; do
    result=$(get_url "$root_url/$arg")
    if [ $? -eq 0 ]; then
        content+="$result"
    else
        content+="echo \"Failed to get $arg from $root_url.\""
    fi
    content+=$'\n'
done

echo "$content"