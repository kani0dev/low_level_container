#!/usr/bin/env bash

set -euo pipefail

ROOTFS="$(realpath rootfs)"


echo "Atualizando site..."

sudo rm -rf rootfs/website
sudo mkdir -p rootfs/website
sudo cp -r website/* rootfs/website/
sudo cp /etc/resolv.conf rootfs/etc/resolv.conf

sudo unshare \
    --pid \
    --uts \
    --ipc \
    --cgroup \
    --fork \
    --mount-proc \
    chroot "$ROOTFS" /bin/sh -c '
        export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
	echo "[1/3] Atualizando repositórios..."
        apk update

        echo "[2/3] Instalando Python..."
        apk add --no-cache python3

        echo "[3/3] Subindo servidor..."

        exec /bin/sh
    '
