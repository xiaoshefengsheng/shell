#!/bin/bash
nowdate=$(date "+%Y-%m-%d %H:%M:%S")
#ifconfig.me查询较慢
#remote_ip=$(curl 'ifconfig.me')
#cip.cc是一个web地址，查询的信息输出较多，用awk匹配出包含IP的行
#remote_ip=$(curl 'cip.cc' | awk '/IP/')
remote_ip=$(curl 'ip.cip.cc')
echo -e "公网IP为： $remote_ip  现在时间：$nowdate" | mail -s "HOME-IP" chenruining@qq.com
echo -e "公网IP为： $remote_ip  现在时间：$nowdate" >>/home/xiaoshe/share/remote_ip.txt

