IMAGE=fish/alpine-rpi

all: image

image: rootfs.tar.gz
	docker build -t $(IMAGE) .

rootfs.tar.gz:
	docker build -t builder builder/
	docker run builder > $@

clean:
	rm -f rootfs.tar.gz

push: all
	docker push $(IMAGE)
