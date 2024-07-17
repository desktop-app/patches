set -e
FullExecPath=$PWD
pushd `dirname $0` > /dev/null
FullScriptPath=`pwd`
popd > /dev/null

cd $FullScriptPath/../nv-codec-headers
make PREFIX="$FullScriptPath/../local" install
cd $FullScriptPath/../ffmpeg

export PKG_CONFIG_PATH="$FullExecPath/../local/lib/pkgconfig:$PKG_CONFIG_PATH"
export PATH="$FullExecPath/../gas-preprocessor:$PATH"
echo \#\!/bin/sh > $FullExecPath/../gas-preprocessor/cpp
echo cl \${@:1} >> $FullExecPath/../gas-preprocessor/cpp
chmod a+x $FullExecPath/../gas-preprocessor/cpp

./configure --prefix=$FullScriptPath/../local $ARCH_PARAM \
--toolchain=msvc \
--extra-cflags="-DCONFIG_SAFE_BITSTREAM_READER=1" \
--extra-cxxflags="-DCONFIG_SAFE_BITSTREAM_READER=1" \
--disable-programs \
--disable-doc \
--disable-network \
--disable-everything \
--enable-ffnvcodec \
--enable-nvdec \
--enable-cuvid \
--enable-hwaccel=av1_d3d11va \
--enable-hwaccel=av1_d3d11va2 \
--enable-hwaccel=av1_dxva2 \
--enable-hwaccel=av1_nvdec \
--enable-hwaccel=h264_d3d11va \
--enable-hwaccel=h264_d3d11va2 \
--enable-hwaccel=h264_dxva2 \
--enable-hwaccel=h264_nvdec \
--enable-hwaccel=hevc_d3d11va \
--enable-hwaccel=hevc_d3d11va2 \
--enable-hwaccel=hevc_dxva2 \
--enable-hwaccel=hevc_nvdec \
--enable-hwaccel=mpeg2_d3d11va \
--enable-hwaccel=mpeg2_d3d11va2 \
--enable-hwaccel=mpeg2_dxva2 \
--enable-hwaccel=mpeg2_nvdec \
--enable-hwaccel=mpeg4_nvdec \
--enable-hwaccel=vp8_nvdec \
--enable-protocol=file \
--enable-libdav1d \
--enable-libopus \
--enable-libvpx \
--enable-decoder=aac \
--enable-decoder=aac_fixed \
--enable-decoder=aac_latm \
--enable-decoder=aasc \
--enable-decoder=ac3 \
--enable-decoder=alac \
--enable-decoder=av1 \
--enable-decoder=av1_cuvid \
--enable-decoder=eac3 \
--enable-decoder=flac \
--enable-decoder=gif \
--enable-decoder=h264 \
--enable-decoder=hevc \
--enable-decoder=libdav1d \
--enable-decoder=libvpx_vp8 \
--enable-decoder=libvpx_vp9 \
--enable-decoder=mp1 \
--enable-decoder=mp1float \
--enable-decoder=mp2 \
--enable-decoder=mp2float \
--enable-decoder=mp3 \
--enable-decoder=mp3adu \
--enable-decoder=mp3adufloat \
--enable-decoder=mp3float \
--enable-decoder=mp3on4 \
--enable-decoder=mp3on4float \
--enable-decoder=mpeg4 \
--enable-decoder=msmpeg4v2 \
--enable-decoder=msmpeg4v3 \
--enable-decoder=opus \
--enable-decoder=pcm_alaw \
--enable-decoder=pcm_f32be \
--enable-decoder=pcm_f32le \
--enable-decoder=pcm_f64be \
--enable-decoder=pcm_f64le \
--enable-decoder=pcm_lxf \
--enable-decoder=pcm_mulaw \
--enable-decoder=pcm_s16be \
--enable-decoder=pcm_s16be_planar \
--enable-decoder=pcm_s16le \
--enable-decoder=pcm_s16le_planar \
--enable-decoder=pcm_s24be \
--enable-decoder=pcm_s24daud \
--enable-decoder=pcm_s24le \
--enable-decoder=pcm_s24le_planar \
--enable-decoder=pcm_s32be \
--enable-decoder=pcm_s32le \
--enable-decoder=pcm_s32le_planar \
--enable-decoder=pcm_s64be \
--enable-decoder=pcm_s64le \
--enable-decoder=pcm_s8 \
--enable-decoder=pcm_s8_planar \
--enable-decoder=pcm_u16be \
--enable-decoder=pcm_u16le \
--enable-decoder=pcm_u24be \
--enable-decoder=pcm_u24le \
--enable-decoder=pcm_u32be \
--enable-decoder=pcm_u32le \
--enable-decoder=pcm_u8 \
--enable-decoder=vorbis \
--enable-decoder=vp8 \
--enable-decoder=wavpack \
--enable-decoder=wmalossless \
--enable-decoder=wmapro \
--enable-decoder=wmav1 \
--enable-decoder=wmav2 \
--enable-decoder=wmavoice \
--enable-filter=atempo \
--enable-encoder=libopus \
--enable-parser=aac \
--enable-parser=aac_latm \
--enable-parser=flac \
--enable-parser=gif \
--enable-parser=h264 \
--enable-parser=hevc \
--enable-parser=mpeg4video \
--enable-parser=mpegaudio \
--enable-parser=opus \
--enable-parser=vorbis \
--enable-demuxer=aac \
--enable-demuxer=flac \
--enable-demuxer=gif \
--enable-demuxer=h264 \
--enable-demuxer=hevc \
--enable-demuxer=matroska \
--enable-demuxer=m4v \
--enable-demuxer=mov \
--enable-demuxer=mp3 \
--enable-demuxer=ogg \
--enable-demuxer=wav \
--enable-muxer=ogg \
--enable-muxer=opus

make -j$NUMBER_OF_PROCESSORS
rm -f libavcodec/aarch64/*.d
rm -f libswresample/aarch64/*.d
rm -f libswscale/aarch64/*.d
rm -f libavutil/aarch64/*.d
make -j$NUMBER_OF_PROCESSORS install
