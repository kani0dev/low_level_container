#!/usr/bin/env bash

set -euo pipefail

ROOTFS="rootfs"

sudo mount --bind /dev "$ROOTFS/dev"
sudo mount --bind /proc "$ROOTFS/proc"
sudo mount --bind /sys "$ROOTFS/sys"

echo "Mounts realizados."
