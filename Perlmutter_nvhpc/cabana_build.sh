module load PrgEnv-nvidia
module load cudatoolkit/11.5
module load craype-accel-nvidia80
module load cmake/3.22.0
module unload darshan

export cuda=$CRAY_CUDATOOLKIT_DIR
export PATH=$cuda/bin:$PATH
export LD_LIBRARY_PATH=$cuda/lib64:$LD_LIBRARY_PATH
export installroot=$PWD
export srcroot=$installroot/../

# kokkos
export kk=$installroot/kokkos/install
export kksrc=$srcroot/kokkos

# cabana
export cabanasrc=$srcroot/Cabana/
export cabana=$installroot/cabana/install

export CMAKE_PREFIX_PATH=$kk:$CMAKE_PREFIX_PATH


cd $installroot
mkdir -p cabana/build
cd cabana/build
cmake $cabanasrc -DCMAKE_BUILD_TYPE=Release \
                 -DCMAKE_CXX_COMPILER=CC \
                 -DCMAKE_INSTALL_PREFIX=$cabana

make install -j4

