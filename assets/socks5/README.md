```sh
cp .env.example .env
cp _danted.conf.example _danted.conf

# start
docker compose up -d

# test proxy on proxy-server
curl --proxy 'socks5h://dev:cftyuhbvg@127.0.0.1:8022' 'https://api.ipify.org/'
```
