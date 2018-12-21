#!/bin/bash
DATE=`date +%F" "%H:%M`
IP=/root/bak/ip.txt     #ip地址表
DING=/root/bak/alert_dingding.py
for ip in $(cat $IP | sed '/^#/d')
do
    for ((i=1;i<=3;i++))
    do
        ping -c 1 $ip &>/dev/null
    [ $? -ne 0 ] && let FailCount+=1;
    done
done
[ -z $FailCount ] && FailCount=0  #当ping都正常时，FailCount值为空，就设置FailCount值为0，用整数比较
if [ $FailCount -eq 2 ];then
    #echo "$IP ping is failed."
    echo -e "Date : $DATE\nHost : $ip\nProblem : Ping is failed, Please check " | /bin/python /root/bak/alert_dingding.py
fi
