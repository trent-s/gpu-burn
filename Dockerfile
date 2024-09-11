ARG CUDA_VERSION=12.6.1
ARG IMAGE_DISTRO=ubi9

FROM nvidia/cuda:${CUDA_VERSION}-devel-${IMAGE_DISTRO} AS builder

WORKDIR /build

COPY . /build/

RUN make

FROM nvidia/cuda:${CUDA_VERSION}-runtime-${IMAGE_DISTRO}

COPY --from=builder /build/gpu_burn /app/
COPY --from=builder /build/compare.ptx /app/
COPY entrypoint.sh /app/
RUN yum update --disablerepo=* --enablerepo=ubi-9-appstream-rpms --enablerepo=ubi-9-baseos-rpms -y

WORKDIR /app

ENTRYPOINT ./entrypoint.sh
