#!/bin/bash
while read line; do
curl --request POST   --url 'https://api.exmail.qq.com/cgi-bin/user/update?access_token=Z****-A'   --header 'Content-Type: application/x-www-form-urlencoded'   --header 'Postman-Token: 877e314d-d5d2-4d4f-a1df-3bd562329027'   --header 'cache-control: no-cache'  -d "{\"userid\":\"${line}\",\"enable\":0}"
done</root/bak/mail_sh/mail_name.txt
#mail_name.txt 腾讯企业邮箱用户地址使用