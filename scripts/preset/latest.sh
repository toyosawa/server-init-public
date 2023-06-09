set -eu
# Usage:
# BASE_URL="example.com" bash scripts/preset/latest.sh

LIB_DIR=$(cd $(dirname $0)/..; pwd)

bash "${LIB_DIR}/fs/set-max-user-watches.sh"
bash "${LIB_DIR}/fs/add-swap-1.sh"
bash "${LIB_DIR}/fs/set-base-url.sh"

bash "${LIB_DIR}/tools/install-anyenv.sh"
bash "${LIB_DIR}/tools/install-aws-cli.sh"
bash "${LIB_DIR}/tools/install-jq.sh"
bash "${LIB_DIR}/tools/install-yq.sh"
bash "${LIB_DIR}/tools/set-git-default-user.sh"

bash "${LIB_DIR}/node/install-nodenv.sh"
bash "${LIB_DIR}/node/install-node.sh" "16.14.2"
bash "${LIB_DIR}/node/install-npm-global.sh" yarn

# bash "${LIB_DIR}/php/install-phpenv.sh"
# bash "${LIB_DIR}/php/install-php.sh" "8.1.8"
# bash "${LIB_DIR}/php/install-composer.sh"

bash "${LIB_DIR}/docker/install-docker.sh"
bash "${LIB_DIR}/docker/install-docker-compose.sh"
bash "${LIB_DIR}/docker/launch-traefik.sh"

echo "-- completed all --" >&2

