#!/usr/bin/env bash

set -euo pipefail

ROOTFS="rootfs"
ALPINE_VERSION="3.22.1"
ARCH="x86_64"

if [ -d "$ROOTFS/bin" ]; then
    echo "Rootfs já existe."
    exit 0
fi

TMP_FILE="/tmp/alpine-minirootfs.tar.gz"

echo "Baixando Alpine..."

wget -O "$TMP_FILE" \
"https://dl-cdn.alpinelinux.org/alpine/v3.22/releases/${ARCH}/alpine-minirootfs-${ALPINE_VERSION}-${ARCH}.tar.gz"

mkdir -p "$ROOTFS"

echo "Extraindo..."

tar -xzf "$TMP_FILE" -C "$ROOTFS"

echo "Rootfs criado em $ROOTFS"
