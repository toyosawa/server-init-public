set -eu
echo "-- $(basename $(dirname $0))/$(basename $0) --" >&2

# Install Claude
if [ -x "$(command -v claude)" ]; then
  echo "skip install Claude" >&2
else
  curl -fsSL https://claude.ai/install.sh | bash
fi

echo "-- completed --" >&2
echo "" >&2
