/usr/bin/sh

RUNSECONDS=${RUNSECONDS:=60}
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/cuda-12.6/compat

./gpu_burn ${RUNSECONDS}


