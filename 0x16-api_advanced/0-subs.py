#!/usr/bin/python3
"""Request reddit"""
import requests


def number_of_subscribers(subreddit):
    try:
        base_url = (
            "https://www.reddit.com/api/info.json?sr_name={}"
            .format(subreddit)
        )
        req = requests.get(
            base_url,
            headers={"User-agent": 'your bot 0.1'},
            allow_redirects=False
        )
        return (
            req.json()
            .get("data")
            .get("children")[0]
            .get("data")
            .get("subscribers")
        )
    except:
        return 0
