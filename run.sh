#!/bin/bash

qemu-system-aarch64 -nographic \
    -serial tcp:localhost:54320 -serial tcp:localhost:54321 \
    -smp 2 \
    -s -machine virt,secure=on,gic-version=3 \
    -cpu cortex-a57 \
    -d unimp -semihosting-config enable=on,target=native \
    -m 2048 \
    -bios bl1.bin \
    -initrd  rootfs.cpio.gz \
    -kernel  Image -no-acpi \
    -append 'console=ttyAMA0,38400 keep_bootcon root=/dev/vda2 ' \
    -object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0,max-bytes=1024,period=1000 \
    -netdev user,id=vmnic -device virtio-net-device,netdev=vmnic
