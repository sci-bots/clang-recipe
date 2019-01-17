export SOURCE_ROOT=$(pwd)

# Clone source for clang release 5.0.0.
git clone -b release_50 --depth 1 https://github.com/llvm-mirror/libcxx clang-libcxx-git
rc=$?; if [[ $rc != 0  ]]; then exit $rc; fi

# Copy headers to ${PREFIX}/include/clang-libcxx
mkdir -p ${PREFIX}/include
cp -ra ${SOURCE_ROOT}/clang-libcxx-git/include ${PREFIX}/include/clang-libcxx
rc=$?; if [[ $rc != 0  ]]; then exit $rc; fi
