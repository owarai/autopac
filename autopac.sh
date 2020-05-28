https_proxy=http://172.16.80.2:1090 curl -s https://raw.githubusercontent.com/pexcn/daily/gh-pages/pac/whitelist.pac \
 | sed 's/127.0.0.1:1080/172.16.80.2:1080/1' | tee pac.txt

git add --update

today="$(date +'%m/%d/%Y')"

git commit -m"updated in $today"
