set -eu
echo "-- $(basename $(dirname $0))/$(basename $0) --" >&2

# Install Codex CLI
if [ -x "$(command -v codex)" ]; then
  echo "skip install Codex CLI" >&2
else
  curl -fsSL https://chatgpt.com/codex/install.sh | bash
fi

echo "-- completed --" >&2
echo "" >&2
