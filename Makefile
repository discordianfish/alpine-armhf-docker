IMAGE=fish/alpine-rpi

all: image-stamp

image-stamp: rootfs.tar.gz
	docker build -t $(IMAGE) .
	touch $@

rootfs.tar.gz:
	docker build -t builder builder/
	docker run builder > $@

clean:
	rm -f rootfs.tar.gz *-stamp

push: all
	docker push $(IMAGE)
