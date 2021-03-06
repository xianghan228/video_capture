#!/bin/bash

mydir=${PWD}

# Checkout the dependencies module
if [ ! -d ${d}/dependencies ] ; then
    git clone https://github.com/roxlu/dependencies.git
fi

# Set environment variables
vs="2013"
source ./dependencies/build.sh

# Create build dir.
if [ ! -d ${mydir}/${build_dir} ] ; then
    mkdir ${mydir}/${build_dir}
fi

# And compile
cd ${mydir}
cd ${build_dir}

cmake \
    -DCMAKE_BUILD_TYPE=${cmake_build_type} \
    -DUSE_OPENGL=On \
    -DUSE_GENERATE_X86=On \
    -DUSE_GENERATE_IPHONE=Off \
    -DUSE_GENERATE_IPHONE_SIMULATOR=Off \
    -DUSE_GENERATE_RPI=Off \
    -DUSE_DECKLINK=Off \
    -DEXTERN_LIB_DIR=${extern_path}/lib \
    -DEXTERN_INC_DIR=${extern_path}/include \
    -DEXTERN_SRC_DIR=${extern_path}/src \
    -DTINYLIB_DIR=${sources_path}/tinylib/ \
    -DCMAKE_INSTALL_PREFIX=${install_path} \
    -G "${cmake_generator}" \
    ../

cmake --build . --target install --config ${cmake_build_config}

rc=$?; 
if [ $rc != 0 ]; then
    exit
fi

cd ${install_path}/bin

#./easy_opengl_example
#./videocapture
#./opengl_example
#./api_example
./easy_opengl_example
#./decklink_example
#./test_conversion
#./test_capability_filter
#./test_v4l2_devices
#./test_linux_device_list


