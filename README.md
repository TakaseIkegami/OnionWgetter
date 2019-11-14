# OnionWgetter

## 環境セットアップ
### Polipo
1. Poilpoをインストールする
2. /etc/polipo/config あるいは ~/.polipo として設定ファイルを設置する
3. 設定ファイルに以下を記入(尚、デフォルトの設定状態はブラウザから `127.0.0.1:8123` を開くと確認できる)
```
 socksParentProxy = "localhost:9050"  # 親ポートとしてtorを動かすポートを指定
 socksProxyType = socks5  # socksのタイプを指定(5推奨)
 diskCacheRoot = ""  # polipoがキャッシングするのをやめる(デフォルトは `/usr/local/var/cache/polipo/` )
```

### Kronymous
1. GoogleWebStoreからChrome拡張機能であるKronymousをインストールする

### ProxyHelper
1. GoogleWebStoreからChrome拡張機能であるProxyHelperをインストールする

### EditThisCookie
1. GoogleWebStoreからChrome拡張機能であるEditThisCookieをインストールする

--

## Coookieの用意
1. Chromeを起動
2. `chrome://apps` にアクセスし、Kronymousを起動
3. 「START TOR PROXY」を押すと9999/tcpでtor proxyが立ち上がる
4. Chrome拡張機能のProxyHelperで以下を設定する
    - SOCKS PROXY:127.0.0.1
    - PORT:9999
    - SOCKS5
5. Chromeから対象サイトにログイン
6. Chrome拡張機能のEditThisCookieを使用して対象サイトのCookieをエクスポート
7. `OnionWgetter/resources/cookies/` 以下に任意のファイルを作成し、そこにCookieを書き込む
8. `OnionWgetter/resources/target.csv` に「対象サイト,Cookieファイル名」を書き込む

## クロール実行
1. tor(9050/tcp)を起動
2. polipo(8123/tcp)を起動
3. `$ sh run.sh`
4. target.csvに記載された対象サイトを順次周回し、収集したファイル、収集状況のログを以下に出力する。
    - ログ(append形式): `OnionWgetter/logs/<対象サイト名>.log`
    - 収集データ: `OnionWgetter/harvest/<クローリング開始日>/<対象サイト名>/`
