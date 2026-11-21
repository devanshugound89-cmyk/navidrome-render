#!/bin/sh
set -e

mkdir -p /root/.config/rclone /music /data
printf "%s\n" "$RCLONE_CONF" > /root/.config/rclone/rclone.conf

rclone mount Gdrive:Music /music \
  --read-only \
  --vfs-cache-mode minimal \
  --vfs-cache-max-age 30m \
  --buffer-size 16M \
  --daemon

export ND_PORT=${PORT:-10000}
export ND_MUSICFOLDER=/music
export ND_DATAFOLDER=/data
export ND_SCANNER_SCHEDULE="@every 6h"

exec /app/navidrome
