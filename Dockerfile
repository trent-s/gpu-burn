# ARG CUDA_VERSION=11.7.0
ARG CUDA_VERSION=12.5.0
ARG IMAGE_DISTRO=ubi8

# FROM nvidia/cuda:${CUDA_VERSION}-devel-ubuntu20.04 AS builder
FROM nvidia/cuda:${CUDA_VERSION}-devel-${IMAGE_DISTRO} AS builder

WORKDIR /build

COPY . /build/

RUN make

# FROM nvidia/cuda:${CUDA_VERSION}-base-ubuntu20.04
# FROM nvidia/cuda:${CUDA_VERSION}-runtime-${IMAGE_DISTRO}
FROM nvidia/cuda:${CUDA_VERSION}-runtime-${IMAGE_DISTRO}

COPY --from=builder /build/gpu_burn /app/
COPY --from=builder /build/compare.ptx /app/
COPY entrypoint.sh /app/

WORKDIR /app

ENTRYPOINT ./entrypoint.sh
