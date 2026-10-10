set -eu
# Usage:
# BASE_URL="ap1.example.com" bash scripts/preset/latest.sh
# SSH_ALLOWED_KEY="ssh-ed25519 AAAA... comment" bash scripts/preset/latest.sh

cd $(dirname $0)/../..

if [ -z "${IS_DEVCONTAINER:-}" ] && [ -z "${BASE_URL:-}" ]; then
  echo "BASE_URL is not assigned." >&2
  SKIP_SET_BASE_URL=1
  if [ -t 0 ]; then
    printf "Skip scripts/os/set-base-url.sh? [Y/n] " >&2
    read -r answer || answer=Y
    case "${answer}" in
      [nN]*)
        printf "Enter BASE_URL: " >&2
        read -r BASE_URL
        export BASE_URL
        SKIP_SET_BASE_URL=
        ;;
    esac
  fi
fi

bash "scripts/os/add-swap.sh"
bash "scripts/os/set-max-user-watches.sh"
[ -z "${IS_DEVCONTAINER:-}" ] && [ -z "${SKIP_SET_BASE_URL:-}" ] && \
bash "scripts/os/set-base-url.sh"
[ -z "${IS_DEVCONTAINER:-}" ] && \
bash "scripts/os/add-ssh-allowed-key.sh"
bash "scripts/os/set-needrestart.sh"
bash "scripts/os/stop-httpd.sh"

bash "scripts/tools/install-anyenv.sh"
bash "scripts/tools/install-jq.sh"
bash "scripts/tools/install-yq.sh"
bash "scripts/tools/install-psql.sh"
bash "scripts/tools/install-claude.sh"
bash "scripts/tools/install-codex.sh"
bash "scripts/tools/install-shell-search.sh"
# bash "scripts/tools/install-aws-cli.sh"
bash "scripts/tools/set-git-default-settings.sh"
[ -z "${IS_DEVCONTAINER:-}" ] && \
bash "scripts/tools/set-git-default-user.sh"

bash "scripts/docker/install-docker.sh"
[ -z "${IS_DEVCONTAINER:-}" ] && \
bash "scripts/docker/launch-traefik.sh"

bash "scripts/node/install-nodenv.sh"
bash "scripts/node/install-node.sh" "24.18.0"
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
