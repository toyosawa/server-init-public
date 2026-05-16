set -eu
# Usage:
# BASE_URL="ap1.example.com" bash scripts/preset/latest.sh

cd $(dirname $0)/../..

bash "scripts/os/add-swap.sh"
# bash "scripts/os/set-max-user-watches.sh"
[ -z "${IS_DEVCONTAINER:-}" ] && \
bash "scripts/os/set-base-url.sh"
bash "scripts/os/set-needrestart.sh"
bash "scripts/os/stop-httpd.sh"

bash "scripts/tools/install-anyenv.sh"
bash "scripts/tools/install-jq.sh"
bash "scripts/tools/install-yq.sh"
bash "scripts/tools/install-psql.sh"
bash "scripts/tools/install-claude.sh"
bash "scripts/tools/install-shell-search.sh"
# bash "scripts/tools/install-aws-cli.sh"
[ -z "${IS_DEVCONTAINER:-}" ] && \
bash "scripts/tools/set-git-default-user.sh"

bash "scripts/docker/install-docker.sh"
[ -z "${IS_DEVCONTAINER:-}" ] && \
bash "scripts/docker/launch-traefik.sh"

bash "scripts/node/install-nodenv.sh"
bash "scripts/node/install-node.sh" "24.14.1"
bash "scripts/node/install-npm-global.sh" "corepack"
bash "scripts/node/install-npm-global.sh" "yarn"

# bash "scripts/python/install-pyenv.sh"
# bash "scripts/python/install-poetry.sh"
bash "scripts/python/install-python.sh" "3.14"
bash "scripts/python/install-uv.sh"
# bash "scripts/python/install-uv-python.sh" "3.13"

# bash "scripts/php/install-phpenv.sh"
# bash "scripts/php/install-php.sh" "8.4"
# bash "scripts/php/install-composer.sh"

echo "-- completed all --" >&2
