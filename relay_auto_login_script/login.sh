#!/bin/sh
export LC_CTYPE=en_US
cd "`dirname $0`"
BASE_HOME=`pwd`

if [ $# -ne 2 ];then
    echo "请检查hosts文件，格式为host user hostname"
    exit 1
fi
# 物理节点 地址 账号 密码 在host文件中配置 (门神登录不需要密码)
host=$1
user=$2

if [ -z "$host" ]; then
    echo "物理节点地址为空，请检查host文件配置"
    exit 0
fi
if [ -z "$user" ]; then
    echo "物理机用户名为空，请检查host文件配置"
    exit 0
fi



# 跳板机 地址 账号 密码 在login.sh文件配置
relayHost=""
relayUser=""
relayPassword=""

if [ -z "$relayHost" ]; then
    echo "跳板机地址为空，请检查login.sh文件配置"
    exit 0
fi
if [ -z "$relayUser" ]; then
    echo "用户名为空，请检查login.sh文件配置"
    exit 0
fi
if [ -z "$relayPassword" ]; then
    echo "密码为空，请检查login.sh文件配置"
    exit 0
fi

./auto_login.exp $host $user $password $relayHost $relayUser $relayPassword
