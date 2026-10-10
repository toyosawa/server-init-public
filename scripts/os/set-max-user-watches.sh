set -eu
echo "-- $(basename $(dirname $0))/$(basename $0) --" >&2

CONF_FILE="/etc/sysctl.d/99-set-max-user-watches.conf"

# Watch files limit
if [ -f "$CONF_FILE" ]; then
  echo "skip set fs.inotify.max_user_watches" >&2
else
  echo "fs.inotify.max_user_watches=524288" | sudo tee "$CONF_FILE"
  sudo sysctl -p "$CONF_FILE"
fi

echo "-- completed --" >&2
echo "" >&2

