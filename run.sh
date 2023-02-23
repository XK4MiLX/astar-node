#!/bin/bash

if [[ ! -d /root/astar ]]; then
  cd /root
  echo "Creating config directory..."
  mkdir astar
fi

NODE_NAME="AstarOnFlux-${RANDOM}"
echo -e "Starting Astar Node: $NODE_NAME"
astar-collator \
  --pruning archive \
  --rpc-cors all \
  --name ${NODE_NAME} \
  --chain astar \
  --base-path /root/astar \
  --execution Wasm \
  --rpc-external \
  --ws-external
