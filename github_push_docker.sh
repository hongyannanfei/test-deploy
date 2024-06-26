#!/bin/bash

pull_registry="docker.io" # 目标仓库
push_registry="registry.cn-hangzhou.aliyuncs.com/custom01"
image1=""
image2=""
images=($image1 $image2)

for i in "${!images[@]}"
do
    image=`echo ${images[$i]} | awk -F'@' '{print $1}'`
    docker pull ${pull_registry}/${image}
    docker tag ${pull_registry}/${image}  ${push_registry}/${image}
    docker images;
    docker push ${push_registry}/${image}
done
