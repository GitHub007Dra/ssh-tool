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
# relayHost="relay01.baidu.com"
port=$4

redict $host $user $password $port
