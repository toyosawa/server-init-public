set -eu
echo "-- $(basename $(dirname $0))/$(basename $0) --" >&2

SERVICE_NAME=apache2
if [ "$(sudo systemctl is-enabled apache2)" != "enabled" ]; then
  echo "skip disable httpd." >&2
else
  sudo systemctl disable apache2
fi
if ! sudo systemctl is-active --quiet $SERVICE_NAME; then
  echo "skip stop httpd." >&2
else
  sudo systemctl stop apache2
fi

echo "-- completed --" >&2
echo "" >&2
