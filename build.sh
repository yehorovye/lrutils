#!/usr/bin/env bash

set -e

BIN_DIR="$HOME/bin"
mkdir -p "$BIN_DIR"

if ! echo "$PATH" | grep -q "$BIN_DIR"; then
  echo "warning: $BIN_DIR is not in your PATH"
fi

find . -type f -name "*.cr" | while read -r file; do
  base=$(basename "$file" .cr)
  crystal build "$file" -o "$BIN_DIR/$base" --release
  echo "built $file -> $BIN_DIR/$base"
done
