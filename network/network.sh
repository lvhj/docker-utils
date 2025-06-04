#!/bin/bash

NETWORK_NAME="docker-utils-network"

# 创建外部网络（如果不存在）
if ! docker network ls | grep -q "$NETWORK_NAME"; then
  echo "Creating network: $NETWORK_NAME"
  docker network create --driver bridge "$NETWORK_NAME"
fi