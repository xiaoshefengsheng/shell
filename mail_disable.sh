#mail_name1.txt 腾讯企业邮箱用户地址使用
#!/bin/bash
#根据corypid及corysecret执行GET获取到access_token,使用awk处理获取到需要字符串并赋值给access_token变量
access_token=$(curl 'https://api.exmail.qq.com/cgi-bin/gettoken?corpid=w***b2&corpsecret=y****wYc' | awk  -F ',' '{print $3}' | awk -F ':' '{print $2}' | awk -F '"' '{print $2}')
while read line; do  
curl --request POST   --url "https://api.exmail.qq.com/cgi-bin/user/update?access_token=${access_token}"   --header 'Content-Type: application/x-www-form-urlencoded'   --header 'Postman-Token: 877e314d-d5d2-4d4f-a1df-3bd562329027'   --header 'cache-control: no-cache'  -d "{\"userid\":\"${line}\",\"enable\":0}"
done</root/bak/mail_sh/mail_name1.txt