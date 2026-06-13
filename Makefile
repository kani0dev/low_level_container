ROOTFS := rootfs
ALPINE_VERSION := 3.22.1
ARCH := x86_64

.PHONY: install run clean

install: $(ROOTFS)/bin
	./scripts/mount.sh

$(ROOTFS)/bin:
	./scripts/alpine_install.sh

run:
	./scripts/create_conteainer.sh

clean:
	./scripts/umount.sh
	rm -rf $(ROOTFS)
