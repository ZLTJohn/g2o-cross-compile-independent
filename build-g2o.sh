# bash build-gflags.sh

# git clone https://github.com/google/glog/
# cd glog 
# git checkout  v0.3.5
# cd ..

NDK_ROOT="/opt/android-ndk-r17c"
ABI="armeabi-v7a with NEON"
API_LEVEL="23"
INSTALL_PATH="/home/zltjohn/Desktop/helloAndroid/3rdparty"
cd g2o
rm -rf build
mkdir -p build
# cmake -DCMAKE_TOOLCHAIN_FILE=../script/android.toolchain.cmake -DANDROID_NDK=<YOUR_PATH_TO_ANDROID_NDK_r10d+> -DCMAKE_BUILD_TYPE=Release 
# -DANDROID_ABI="armeabi-v7a with NEON" -DEIGEN3_INCLUDE_DIR="<YOUR_PATH_TO_EIGEN>" -DEIGEN3_VERSION_OK=ON .. 
cd build
  cmake -DCMAKE_BUILD_WITH_INSTALL_RPATH=ON \
      -DCMAKE_TOOLCHAIN_FILE="${NDK_ROOT}/build/cmake/android.toolchain.cmake" \
      -DANDROID_NDK="${NDK_ROOT}" \
      -DANDROID_NATIVE_API_LEVEL=${API_LEVEL} \
      -DANDROID_ABI="$ABI" \
      -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_TESTING=OFF \
      -DANDROID_STL="c++_shared" \
      -DEIGEN3_INCLUDE_DIR="/home/zltjohn/Desktop/helloAndroid/3rdparty/eigen/usr/local/include/eigen3"\
      -DEIGEN3_VERSION_OK=ON\
      ..
  
  cmake --build .  --parallel 4
  cd build
  make DESTDIR=${INSTALL_PATH}/g2o install





# #!/bin/bash

# bash build-gflags.sh
# echo $(pwd)
# #!/usr/bin/env sh
# #NDK_ROOT="${1:-${NDK_ROOT}}"
# NDK_ROOT="/opt/android-ndk-r17c"

# ### ABI setup
# declare -a ANDROID_ABI_LIST=("arm64-v8a" "armeabi-v7a with NEON")

# ### path setup
# SCRIPT=$(readlink -f $0)
# WD=`dirname $SCRIPT`
# GLOG_ROOT=${WD}/glog
# echo $GLOG_ROOT

# BUILD_DIR=${GLOG_ROOT}/build
# INSTALL_DIR=${WD}/android_glog
# N_JOBS=${N_JOBS:-8}

# if [ "${ANDROID_ABI}" = "armeabi" ]; then
#     API_LEVEL=23
# else
#     API_LEVEL=23
# fi

# rm -rf "${BUILD_DIR}"
# mkdir -p "${BUILD_DIR}"
# # cd "${BUILD_DIR}"
# cd ${GLOG_ROOT}

# # First argument is abi type (armeabi-v7a, x86)
# function build_glog {
#   ABI=$1

#   echo "Building Opencv for $ABI"
#   # mkdir build_$ABI
#   # cd build_$ABI

#   echo $(pwd)
# # collect install directories to build/install
#   cmake -DCMAKE_BUILD_WITH_INSTALL_RPATH=ON \
#       -DCMAKE_TOOLCHAIN_FILE="${NDK_ROOT}/build/cmake/android.toolchain.cmake" \
#       -DANDROID_NDK="${NDK_ROOT}" \
#       -DANDROID_NATIVE_API_LEVEL=${API_LEVEL} \
#       -DANDROID_ARM_NEON=ON \
#       -DANDROID_ABI="$ABI" \
#       -DCMAKE_BUILD_TYPE=Release \
#       -DBUILD_TESTING=OFF \
#       -DANDROID_STL="c++_shared" \
#       -Dgflags_DIR="../gflags/build/build_${ABI}" \
#       -S . -B ${BUILD_DIR} -G "Unix Makefiles"\
#       ../../
#   # make -j${N_JOBS}

#   cmake --build ${BUILD_DIR}
#   # cmake --build ${BUILD_DIR} --target test
#   # cmake --build ${BUILD_DIR} --target install
#   # cd ../
# }

# echo $(pwd)
# build_glog armeabi-v7a
# # build_glog arm64-v8a


# cd "${WD}"
# #rm -rf "${BUILD_DIR}"


