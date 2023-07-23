#!/usr/bin/bash
#

export https_proxy=http://127.0.0.1:60081

curl -s https://raw.githubusercontent.com/pexcn/daily/gh-pages/pac/whitelist.pac |
    sed 's/127.0.0.1:1080/127.0.0.1:60080/1' | tee proxy.pac

git add --update

today="$(date +'%m/%d/%Y')"

git commit -m"updated in $today"

if git remote get-url origin; then
    git push origin master:master
else
    git remote add origin git@github.com:owarai/autopac.git
    git branch -u origin/master master
    git push origin master:master
fi
