#!/usr/bin/env bash

set -e


echo "================================"
echo "Patch Training Server"
echo "================================"


####################################
# 1. llama-server rename
####################################

echo "[1/3] Rename llama-server -> training-server"


sed -i \
's/"llama-server"/"training-server"/g' \
llm/llama_server.go



####################################
# 2. Change lib directory
####################################

echo "[2/3] Change lib/ollama -> lib/python3"


# ml/path.go

sed -i \
's|lib", "ollama|lib", "python3|g' \
ml/path.go



# llm/llama_binary.go

sed -i \
's|lib", "ollama|lib", "python3|g' \
llm/llama_binary.go



####################################
# 3. Replace comments(optional)
####################################

echo "[3/3] Update comments"


sed -i \
's|lib/ollama|lib/python3|g' \
ml/path.go


sed -i \
's|lib/ollama|lib/python3|g' \
llm/llama_binary.go



echo ""
echo "Patch completed."


echo ""
echo "Check result:"
grep -R "python3" ml/path.go llm/llama_binary.go | head -20

grep -R "training-server" llm/llama_server.go | head -5
