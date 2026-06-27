set -eu
echo "-- $(basename $(dirname $0))/$(basename $0) --" >&2

# Set push.default
if [ "$(git config --global push.default 2>/dev/null)" = "current" ]; then
  echo "skip git-config global push.default" >&2
else
  git config --global push.default current
fi

# Set branch.autoSetupMerge
if [ "$(git config --global branch.autoSetupMerge 2>/dev/null)" = "simple" ]; then
  echo "skip git-config global branch.autoSetupMerge" >&2
else
  git config --global branch.autoSetupMerge simple
fi

echo "-- completed --" >&2
echo "" >&2
