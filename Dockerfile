ARG CUDA_VERSION=12.5.0
ARG IMAGE_DISTRO=ubi8.10

FROM nvidia/cuda:${CUDA_VERSION}-devel-${IMAGE_DISTRO} AS builder

WORKDIR /build

COPY . /build/

RUN make

FROM nvidia/cuda:${CUDA_VERSION}-runtime-${IMAGE_DISTRO}

COPY --from=builder /build/gpu_burn /app/
COPY --from=builder /build/compare.ptx /app/
COPY entrypoint.sh /app/

WORKDIR /app

ENTRYPOINT ./entrypoint.sh
