import json

import requests

from lanzou.api.utils import USER_AGENT
from lanzou.debug import logger

timeout = 2

# 不登录一天
short_url_server = "https://tturl.cn/api/buildDwz"

short_url_server2 = "http://create.link66.cn/createBySingle"


def get_short_url(url: str):
    """短链接生成器"""
    headers = {'User-Agent': USER_AGENT}
    short_url = ""
    try:
        post_data = {
            "url": url,
            "type": 1
        }

        resp = requests.post(short_url_server, data=post_data, verify=False, headers=headers, timeout=timeout)
        print(resp.text)
        rsp = json.loads(resp.text)
        if rsp:
            short_url = rsp["data"][0]
    except Exception as e:
        logger.error(f"get_short_url error: e={e}")

    if not short_url:
        headers["Content-Type"] = "application/x-www-form-urlencoded; charset=UTF-8"
        post_data = {
            "longUrl": url,
            "domain": "1v9.xyz",
            "expireType": 1
        }
        try:
            html = requests.post(short_url_server2, data=post_data, verify=False, headers=headers, timeout=timeout).text
            rsp = json.loads(html)
            if rsp:
                short_url = rsp["data"]
        except Exception as e:
            logger.error(f"get_short_url2 error: e={e}")

    return short_url


if __name__ == "__main__":
    url = get_short_url("https://github.com/Leon406/lanzou-gui")
    print(url)
