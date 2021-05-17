#!/bin/bash
#食用方法 sh push2.sh ${repo} ${tag}


REGISTRY_URL="192.168.0.2" #镜像仓库url
NAME_SPACE="yuanfu-tms" #命名空间
DATE=$(date +"%Y%m%d%H%M%S")
TAG_VERSION=${DATE} #镜像的版本

if [ "$2" != "" ];
    then
    TAG_VERSION="$2"
fi

# build_push_tag
push_tag()
{
    sh $WORKSPACE/push.sh ${REGISTRY_URL} ${TAG_VERSION}
}

if [ "$1" = "local" ];
    then
    # login
    REGISTRY_URL="192.168.0.2"
    NAME_SPACE="yuanfu-tms"
    docker login --username=admin ${REGISTRY_URL} --password=Yuanfu1211
    push_tag
    elif [ "$1" = "aliyun" ];
    then
    REGISTRY_URL="registry.cn-shanghai.aliyuncs.com"
    NAME_SPACE="yuanfu-tms"
    docker login --username=远孚集团 ${REGISTRY_URL} --password=wzygymtijus9
    push_tag
    elif [ "$1" = "huaweicloud" ];
    then
    REGISTRY_URL="swr.cn-east-2.myhuaweicloud.com"
    NAME_SPACE="yuanfu-tms"
    docker login --username=cn-east-2@VMKGNWR86FUNMDMKNPKJ --password=eefd5bebe0e349a5ed2ffb22bf0a488ec8dba5d2a3075272f8f0d79e0f09616e ${REGISTRY_URL}
    #docker login -u cn-east-2@VMKGNWR86FUNMDMKNPKJ -p eefd5bebe0e349a5ed2ffb22bf0a488ec8dba5d2a3075272f8f0d79e0f09616e ${REGISTRY_URL}
    push_tag
    else
    echo '本地仓库:push.sh local 1.0'
    echo '阿里云仓库:push.sh aliyun 1.0'
    echo '华为云仓库:push.sh huaweicloud 1.0'
fi