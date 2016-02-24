IMAGE = fish/alpine-armhf
VERSION ?= latest-stable

all: image-stamp
TARBALL = rootfs-$(VERSION).tar.gz

image-stamp: $(TARBALL)
	VERSION=$(VERSION) envsubst '$VERSION' < Dockerfile.envsubst > Dockerfile
	docker build -t $(IMAGE):$(VERSION) .
	touch $@

$(TARBALL):
	docker build -t builder builder/
	docker run builder $(VERSION) > $@

clean:
	rm -f rootfs-*.tar.gz *-stamp

push: all
	docker push $(IMAGE):$(VERSION)
