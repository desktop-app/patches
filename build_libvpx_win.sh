set -e
FullExecPath=$PWD
pushd `dirname $0` > /dev/null
FullScriptPath=`pwd`
popd > /dev/null

./configure --prefix=$FullScriptPath/../local \
--target=$TOOLCHAIN \
--disable-examples \
--disable-unit-tests \
--disable-tools \
--disable-docs \
--enable-static-msvcrt \
--enable-vp8 \
--enable-vp9 \
--enable-webm-io \
--size-limit=4096x4096

make -j$NUMBER_OF_PROCESSORS
make -j$NUMBER_OF_PROCESSORS install
