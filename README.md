# Alpine Docker images for ARM

This project uses qemu in an Alpine x86 image to build an Alpine rootfs
for ARM rootfs. This rootfs get loaded into a new Docker image and can
be pushed to the Docker Hub via the `push` target.
