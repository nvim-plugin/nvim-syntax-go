#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

root_dir() {
  dir=$(dirname "$0");
  dir=$(cd "$dir" && pwd);
  dirname "$dir"
}

if [ -z "$NVIM_SYNTAX_GO_LOG_FILE" ]; then
  NVIM_SYNTAX_GO_LOG_FILE=/tmp/nvim-syntax-go.log
fi
touch "$NVIM_SYNTAX_GO_LOG_FILE"

exec "$(root_dir "$0")/bin/nvim-syntax-go" "$@" 2>> "$NVIM_SYNTAX_GO_LOG_FILE"
