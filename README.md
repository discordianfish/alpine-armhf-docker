# Alpine Docker images for ARM

This project uses qemu in an Debian x86 image to build an Alpine rootfs
tarball for ARM. This rootfs get loaded into a new Docker image and can
be pushed to the Docker Hub via the `push` target.
