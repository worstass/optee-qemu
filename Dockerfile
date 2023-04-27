FROM ubuntu:jammy
RUN apt-get -y update && apt-get install -y --no-install-recommends python3-pip qemu-system-aarch64
RUN mkdir -p /optee-qemu
COPY bin/ /optee-qemu/
COPY run.sh soc_term.py /optee-qemu/
WORKDIR /optee-qemu
CMD ["./run.sh"]
