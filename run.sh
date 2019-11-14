#!/bin/sh

# 自身が起動していたら終了
if [ $$ != `pgrep -fo $0`  ]; then
    echo "[`date '+%Y/%m/%d %T'`] myself is already running. exit myself."
    exit 1
fi

csvfile=./resources/target.csv
for line in `cat ${csvfile} | grep -v ^#`
do
  echo "----------------"
  url=`echo ${line} | cut -d ',' -f 1`
  cookie=`echo ${line} | cut -d ',' -f 2`
  cookie_path="./resources/cookies/${cookie}"
  echo "Target Site: ${url}"
  echo "Using Cookie File: ${cookie}"
  sh ./resources/wget.sh ${url} ${cookie} ${cookie_path}
done

exit 0
