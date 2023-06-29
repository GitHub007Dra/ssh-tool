#!/bin/sh
export LC_CTYPE=en_US
cd "`dirname $0`"
BASE_HOME=`pwd`

if [ $# -ne 4 ];then
    echo "Please check the hosts file, the format should be 'host port user password remarks'"
    exit 1
fi

host=$1
user=$2
password=$3
port=$4

if [ -z "$host" ]; then
    echo "物理节点地址为空，请检查host文件配置"
    exit 0
fi
if [ -z "$user" ]; then
    echo "物理机用户名为空，请检查host文件配置"
    exit 0
fi
if [ -z "$password" ]; then
    echo "物理机密码为空，请检查host文件配置"
    exit 0
fi
if [ -z "$port" ]; then
    echo "物理机密码为空，请检查host文件配置"
    exit 0
fi

redict $host $user $password $port
