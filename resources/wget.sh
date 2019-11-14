# $1: url
# $2: cookie_name
# $3: cookie_path
date=`date "+%Y%m%d"`
http_proxy="localhost:8123" wget --mirror \
    --tries=5 --retry-connrefused --waitretry=1 --read-timeout=20 --timeout=15 --tries=10 \
    --load-cookies=${3} --keep-session-cookies \
    --max-redirect=1 \
    --execute robots=off \
    --convert-links \
    --random-wait \
    --restrict-file-names=unix \
    --referer="${1}" \
    --user-agent="$(cat ./resources/user-agent.txt)" \
    -P ./harvest/${date} \
    "${1}"
    #--append-output="./logs/${1}.log" --server-response \
