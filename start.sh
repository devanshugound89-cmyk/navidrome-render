#!/bin/sh
set -e

mkdir -p /root/.config/rclone
printf "%s\n" "$RCLONE_CONF" > /root/.config/rclone/rclone.conf

exec rclone serve webdav Gdrive:Music \
  --addr 0.0.0.0:${PORT:-10000} \
  --user "${WEBDAV_USER:-admin}" \
  --pass "${WEBDAV_PASS:-changeme123}" \
  --read-only \
  --vfs-cache-mode minimal \
  --buffer-size 16M
