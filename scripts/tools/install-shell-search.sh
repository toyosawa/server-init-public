set -eu
echo "-- $(basename $(dirname $0))/$(basename $0) --" >&2

SCRIPT_FILE="/etc/profile.d/shell_search.sh"
if [ -e "${SCRIPT_FILE}" ]; then
  echo "skip add ${SCRIPT_FILE}" >&2
elif [ -n "${BASE_URL:-}" ]; then
  sudo tee ${SCRIPT_FILE} <<EOL
# interactive shellで↑↓で履歴が出るように
if [[ $- == *i* ]]; then
  bind '"\C-n": history-search-forward'
  bind '"\C-p": history-search-backward'
  bind '"\e[A": history-search-backward'
  bind '"\e[B": history-search-forward'
fi
EOL
else
  echo "skip configure, not exist ${SCRIPT_FILE} nor assign BASE_URL" >&2
fi

if [ -e "${SCRIPT_FILE}" ]; then
  FILE="/etc/bash.bashrc"
  SCRIPT=". ${SCRIPT_FILE}"
  if [ -n "$(grep "${SCRIPT}" "${FILE}")" ]; then
    echo "skip append ${FILE}" >&2
  else
    echo "${SCRIPT}" | sudo tee -a "${FILE}" >&2
  fi

  source ${SCRIPT_FILE}
fi

echo "-- completed --" >&2
echo "" >&2
