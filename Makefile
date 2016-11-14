VERSION := 14.2
RELEASE := slackware-$(VERSION)
MIRROR := http://slackware.osuosl.org
CACHEFS := /tmp/slackware/$(RELEASE)
ROOTFS := /tmp/rootfs-slackware

image: mkimage-slackware.sh
	sudo \
		VERSION="$(VERSION)" \
		RELEASE="$(RELEASE)" \
		MIRROR="$(MIRROR)" \
		CACHEFS="$(CACHEFS)" \
		ROOTFS="$(ROOTFS)" \
		bash $<

all: build.sh
	sh ./build.sh

.PHONY: umount
umount:
	@sudo umount $(ROOTFS)/cdrom || :
	@sudo umount $(ROOTFS)/dev || :
	@sudo umount $(ROOTFS)/sys || :
	@sudo umount $(ROOTFS)/proc || :
	@sudo umount $(ROOTFS)/etc/resolv.conf || :

.PHONY: clean
clean: umount
	sudo rm -rf $(ROOTFS) $(CACHEFS)/paths

.PHONY: dist-clean
dist-clean: clean
	sudo rm -rf $(CACHEFS)

