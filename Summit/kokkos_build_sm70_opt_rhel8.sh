module load gcc/7.5.0
module load cuda/10.2.89
module load cmake/3.20.2

export installroot=$PWD
export kk=$installroot/kokkos/install
export srcroot=$installroot/../
export kksrc=$srcroot/kokkos
export cuda=$CUDA_DIR
export OMPI_CXX=$kksrc/bin/nvcc_wrapper
export PATH=$cuda/bin:$PATH
export LD_LIBRARY_PATH=$cuda/lib64:$LD_LIBRARY_PATH

cd $installroot
mkdir -p kokkos/build
cd kokkos/build
cmake $kksrc \
      -DCMAKE_CXX_COMPILER=mpiCC \
      -DCMAKE_CXX_FLAGS= -DKokkos_ARCH_VOLTA70=ON \
      -DKokkos_ENABLE_SERIAL=ON \
      -DKokkos_ENABLE_OPENMP=off \
      -DKokkos_ENABLE_CUDA=on \
      -DKokkos_ENABLE_CUDA_LAMBDA=on \
      -DKokkos_ENABLE_DEBUG=off \
      -DKokkos_ENABLE_PROFILING=on \
      -DCMAKE_INSTALL_PREFIX=$kk
make -j4 install

