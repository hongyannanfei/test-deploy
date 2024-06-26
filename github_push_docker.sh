#!/bin/bash

pull_registry="docker.io" # 目标仓库
push_registry="registry.cn-hangzhou.aliyuncs.com/custom01"
image1="bitnami/mysql:8.0.35-debian-11-r3"
image2="mysql:8.0.35-debian-11-r3"
images=($image1 $image2)

for i in "${!images[@]}"
do
    # image=`echo ${images[$i]} | awk -F'@' '{print $1}'`
    docker pull ${pull_registry}/${image1}
    docker tag ${pull_registry}/${image1}  ${push_registry}/${image2}
    docker images;
    docker push ${push_registry}/${image2}
done
