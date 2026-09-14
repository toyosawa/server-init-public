set -eu
echo "-- $(basename $(dirname $0))/$(basename $0) --" >&2

AUTH_KEYS="${HOME}/.ssh/authorized_keys"

if [ -z "${SSH_ALLOWED_KEY:-}" ]; then
  echo "skip configure, not assign SSH_ALLOWED_KEY" >&2
else
  mkdir -p "${HOME}/.ssh"
  chmod 700 "${HOME}/.ssh"
  touch "${AUTH_KEYS}"
  chmod 600 "${AUTH_KEYS}"

  if grep -Fqx "${SSH_ALLOWED_KEY}" "${AUTH_KEYS}"; then
    echo "skip append ${AUTH_KEYS}, already exists" >&2
  else
    echo "${SSH_ALLOWED_KEY}" >> "${AUTH_KEYS}"
  fi
fi

echo "-- completed --" >&2
echo "" >&2
