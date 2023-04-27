FROM ubuntu:jammy
#FROM debian:bullseye
RUN apt-get -y update && apt-get install qemu-system-aarch64
RUN mkdir -p /optee-qemu
COPY bin/ /optee-qemu/
WORKDIR /optee-qemu
CMD ["./run.sh"]
