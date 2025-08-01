#!/bin/bash

# 检查输入参数
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <repository/image_name:tag>"
  exit 1
fi

IMAGE=$1

# 拆分参数为仓库、镜像名称和标签
REPOSITORY=$(echo $IMAGE | cut -d/ -f1)
IMAGE_NAME=$(echo $IMAGE | cut -d/ -f2 | cut -d: -f1)
TAG=$(echo $IMAGE | cut -d: -f2)
SOURCE_IMAGE="${REPOSITORY}/${IMAGE_NAME}:${TAG}"
TARGET_REGISTRY="registry.cn-hangzhou.aliyuncs.com/whatever233"
TARGET_IMAGE="${TARGET_REGISTRY}/${IMAGE_NAME}:${TAG}"

# 拉取镜像
echo "Pulling image ${SOURCE_IMAGE}..."
docker pull ${SOURCE_IMAGE}

# 为镜像打标签
echo "Tagging image ${SOURCE_IMAGE} as ${TARGET_IMAGE}..."
docker tag ${SOURCE_IMAGE} ${TARGET_IMAGE}

# 推送镜像到目标仓库
echo "Pushing image ${TARGET_IMAGE}..."
docker push ${TARGET_IMAGE}

echo ${TARGET_IMAGE}
echo "Image ${TARGET_IMAGE} pushed successfully."

