#!/usr/bin/env bash

set -euo pipefail

ROOTFS="$(realpath rootfs)"

sudo unshare \
    --mount \
    --pid \
    --uts \
    --ipc \
    --net \
    --cgroup \
    --fork \
    --mount-proc \
    chroot "$ROOTFS" /bin/sh
