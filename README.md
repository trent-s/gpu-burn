# gpu-burn ![GitHub Workflow Status](https://quay.io/repository/trent_s/gpu-burn/status)

Multi-GPU CUDA stress test
Origin: http://wili.cc/blog/gpu-burn.html

# What is unique about this fork?
The goal is to provide a stable and secure way to easily run gpu-burn on a Kubernetes cluster, hence:
- Updated to lastest base image and cuda library (yeah, this could have been done with environment variables...)
- Also including latest security fixes as updates in the Dockerfile.
- Deployable to Kubernetes clusters such as OpenShift with the included `gpu-burn.yaml`.
- For those that like it, the container behavior is easily tweakable with the newly added `entrypoint.sh`.
- Switched from `Docker` to `podman`.
- And vitally, I provided new images with security fixes when necessary:
  - quay.io/trent_s/gpu-burn

# Building
To build GPU Burn:

`make`

To remove artifacts built by GPU Burn:

`make clean`

GPU Burn builds with a default Compute Capability of 5.0.
To override this with a different value:

`make COMPUTE=<compute capability value>`

CFLAGS can be added when invoking make to add to the default
list of compiler flags:

`make CFLAGS=-Wall`

LDFLAGS can be added when invoking make to add to the default
list of linker flags:

`make LDFLAGS=-lmylib`

NVCCFLAGS can be added when invoking make to add to the default
list of nvcc flags:

`make NVCCFLAGS=-ccbin <path to host compiler>`

CUDAPATH can be added to point to a non standard install or
specific version of the cuda toolkit (default is 
/usr/local/cuda):

`make CUDAPATH=/usr/local/cuda-<version>`

CCPATH can be specified to point to a specific gcc (default is
/usr/bin):

`make CCPATH=/usr/local/bin`

CUDA_VERSION and IMAGE_DISTRO can be used to override the base
images used when building the Docker `image` target, while IMAGE_NAME
can be set to change the resulting image tag:

`make IMAGE_NAME=myregistry.private.com/gpu-burn CUDA_VERSION=12.0.1 IMAGE_DISTRO=ubuntu22.04 image`

# Usage

    GPU Burn
    Usage: gpu_burn [OPTIONS] [TIME]
    
    -m X   Use X MB of memory
    -m N%  Use N% of the available GPU memory
    -d     Use doubles
    -tc    Try to use Tensor cores (if available)
    -l     List all GPUs in the system
    -i N   Execute only on GPU N
    -h     Show this help message
    
    Example:
    gpu_burn -d 3600
