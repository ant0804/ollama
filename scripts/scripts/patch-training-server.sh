#!/usr/bin/env bash

set -e


FILE="llm/llama_server.go"


echo "Applying training-server patch"


if [ ! -f "$FILE" ]; then
    echo "$FILE not found"
    exit 1
fi


sed -i \
's/"llama-server"/"training-server"/g' \
"$FILE"


echo "Patch completed"
