#!/bin/bash
# 使用curl检查网页是否可以正常访问，如果无法访问则发邮件。

SITE=www.baidu.com
PROT=80
URL="http://$SITE:$PROT"  
#mail_info
email_sender=(chenruining@qq.com)
email_title="$SITE端口$PROT故障警告！！！"
email_content="主机$SITE:$PROT不通!请及时处理。 \n监控邮件，不必回复"
time=3

check_once()   
{   
        echo   
        echo "$(date)  monitor check once"  
        # 2018.03.09 -I/--head -s/--silent   
        #if curl -s -I --connect-timeout 5 --max-time 10 http://localhost:$1/; then   
        if curl -s -I -L --connect-timeout 5 --max-time 10 $URL | grep -q "200 OK";   
  
  
	then   
                echo "$(date)  web maybe OK"  
		time=3
        else   
		
                echo "$(date)  web maybe FAILURE"  

		if [ $time -gt 0 ];
		then
		notify_error
		((time = time-1))
		fi

		echo "$(date)  mail send OK"
        fi   
}   

#故障邮件报警
notify_error()
{
	
	for var in ${email_sender[@]};
	do
		echo --------------------------------------------
		echo -e `date +"%Y-%m-%d %H:%M.%S"` $email_content | /bin/mail -s $email_title $var
	done
}

# 每隔一分钟检查一次网页是否正常   
while true;   
do   
	sleep 60  
	check_once >> /root/logs/check.$(date +%Y-%m-%d).log   
done   
