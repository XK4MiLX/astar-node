#!/bin/bash

if [[ ! -d /root/astar ]]; then
  BIN_NAME=$(curl -s https://api.github.com/repos/AstarNetwork/Astar/releases/latest | grep "tag_name" | awk '{print "https://github.com/AstarNetwork/Astar/releases/download/" substr($2, 2, length($2)-3) "/astar-collator-v" substr($2, 3, length($2)-4) "-ubuntu-x86_64.tar.gz"}')
  echo -e "Downloading file: $bin_name"
  cd /root
  wget ${BIN_NAME}
  tar -xvf astar-collator*.tar.gz
  mv ./astar-collator /usr/local/bin
  chmod +x /usr/local/bin/astar-collator
  mkdir astar
fi

NODE_NAME="AstraOnFlux-${RANDOM}"
echo -e "Starting Astra Node: $NODE_NAME"
astar-collator \
  --pruning archive \
  --rpc-cors all \
  --name ${NODE_NAME} \
  --chain astar \
  --base-path /root/astar \
  --execution Wasm \
  --rpc-external \
  --ws-external
