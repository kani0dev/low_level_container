#!/usr/bin/env bash

set -euo pipefail

ROOTFS="rootfs"

sudo umount "$ROOTFS/sys" 2>/dev/null || true
sudo umount "$ROOTFS/proc" 2>/dev/null || true
sudo umount "$ROOTFS/dev" 2>/dev/null || true

echo "Mounts removidos."
