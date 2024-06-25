/usr/bin/sh

export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/cuda-12.2/compat:/usr/local/cuda-11.8/compat/:/usr/local/cuda-12.5/compat:/usr/local/cuda-11.7/compar
echo
echo $LD_LIBRARY_PATH
echo
ls /usr/local/cuda-11.7/compat
ls /usr/local/cuda-11.8/compat
ls /usr/local/cuda-12.2/compat
ls /usr/local/cuda-12.5/compat
echo
./gpu_burn 900


