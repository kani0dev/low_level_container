#!/usr/bin/env bash

set -euo pipefail

ROOTFS="$(realpath rootfs)"


echo "Atualizando site..."

sudo rm -rf rootfs/website
sudo mkdir -p rootfs/website
sudo cp -r website/* rootfs/website/

sudo unshare \
    --pid \
    --uts \
    --ipc \
    --cgroup \
    --fork \
    --mount-proc \
    chroot "$ROOTFS" /bin/sh -c '
        export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

        apk update
        apk add python3

        exec /bin/sh
    '
