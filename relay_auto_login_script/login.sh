#!/bin/sh
export LC_CTYPE=en_US
cd "`dirname $0`"
BASE_HOME=`pwd`

if [ $# -ne 3 ];then
    echo "请检查hosts文件，格式为host user password，如果使用门神登录，格式为host DoorGod spider/work/root"
    exit 1
fi

node_host=$1
node_user=$2
node_password=$3
UAuditHost=""
UAuditUser=""
UAuditPassword=""
./auto_login.exp $node_host $node_user $node_password $UAuditHost $UAuditUser $UAuditPassword
