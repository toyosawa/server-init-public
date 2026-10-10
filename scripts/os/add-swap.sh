set -eu
echo "-- $(basename $(dirname $0))/$(basename $0) --" >&2

SWAPFILE=${1:-"/swapfile1"}
SWAPCOUNT=${2:-"8192"}

# Add swap 1
if [ -e "$SWAPFILE" ]; then
  echo "skip add swap 1" >&2
else
  # Mount swap
  sudo dd if=/dev/zero of="$SWAPFILE" bs=1M count="$SWAPCOUNT"
  sudo chmod 600 "$SWAPFILE"
  sudo mkswap "$SWAPFILE"
  sudo swapon "$SWAPFILE"
  sudo swapon -s
  sudo cp -p /etc/fstab /etc/fstab_$(date "+%Y%m%d-%H%M%S")
  echo "$SWAPFILE swap swap defaults 0 0" | sudo tee -a /etc/fstab
  sudo mount -a
fi

echo "-- completed --" >&2
echo "" >&2
