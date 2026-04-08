set -eu
echo "-- $(basename $(dirname $0))/$(basename $0) --" >&2

# Install psql client
if [ -x "$(command -v psql)" ]; then
  echo "skip install psql client" >&2
else
  sudo apt update -y
  sudo apt-get -y install postgresql-client
fi

echo "-- completed --" >&2
echo "" >&2
