#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Author: zhuima
# zhuima @ 2017-03-02 10:02:23
# Function:


import json
import sys
import time
import datetime

import requests

reload(sys)
sys.setdefaultencoding('utf-8')

#title = sys.argv[1]
#content = sys.argv[2]


def send_msg(title, content):
    '''
    if you want use this script in another env, Please change the sys
    Maybe you only need sys.argv[1] and sys.argv[2]
    use replace funcation to split line
    '''
    now = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    # 办公网监控群
    url = 'https://oapi.dingtalk.com/robot/send?access_token=b5a4a7f4675640b7f4efa856e2d02bc8e11******708eaa6df045'
    headers = {'content-type': 'application/json'}
    payload = {
        "msgtype": "markdown",
        "markdown": {"title": title,
                    "text": "###   warning！！！网络出现丢包5个以上 \n 当前时间: {0} \n\n  望及时查看网络情况!!!!!".format(now)
        },
        "at": {
            "atMobiles": [
            ],
            "isAtAll": True
        }
    }
    ret = requests.post(url, data=json.dumps(payload), headers=headers)
    print ret.json()


if __name__ == '__main__':
    title = "网络丢包5个了"
    content = ""
    send_msg(title, content)
