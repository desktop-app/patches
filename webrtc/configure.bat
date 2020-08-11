@echo off
setlocal EnableDelayedExpansion
set DEPOT_TOOLS_WIN_TOOLCHAIN=0

echo Configuring "out/Debug" build...

call gn gen out/Debug --ide=vs --args="!="!^
    host_cpu=\"x86\" !="^"!^
    target_os=\"win\" !="^"!^
    is_clang=false !="^"!^
    is_component_build=false !="^"!^
    is_debug=true !="^"!^
    symbol_level=2 !="^"!^
    proprietary_codecs=true !="^"!^
    use_custom_libcxx=false !="^"!^
    use_system_libjpeg=true !="^"!^
    system_libjpeg_root=\"../../../qt_5_12_8/qtbase/src/3rdparty/libjpeg\" !="^"!^
    enable_iterator_debugging=true !="^"!^
    rtc_include_tests=false !="^"!^
    rtc_build_examples=false !="^"!^
    rtc_build_tools=false !="^"!^
    rtc_build_opus=false !="^"!^
    rtc_build_ssl=false !="^"!^
    rtc_ssl_root=\"../../../openssl_1_1_1/include\" !="^"!^
    rtc_ssl_libs=[\"../../../openssl_1_1_1/out32.dbg/libssl.lib\",\"../../../openssl_1_1_1/out32.dbg/libcrypto.lib\"] !="^"!^
    rtc_builtin_ssl_root_certificates=true !="^"!^
    rtc_build_ffmpeg=false !="^"!^
    rtc_ffmpeg_root=\"../../../ffmpeg\" !="^"!^
    rtc_ffmpeg_libs=[\"../../../ffmpeg/libavutil/libavutil.a\",\"../../../ffmpeg/libavcodec/libavcodec.a\",\"../../../ffmpeg/libswscale/libswscale.a\",\"../../../ffmpeg/libswresample/libswresample.a\"] !="^"!^
    rtc_opus_root=\"../../../opus/include\" !="^"!^
    rtc_enable_protobuf=false !="^"!^
"

echo Configuring "out/Release" build...

call gn gen out/Release --ide=vs --args="!="!^
    host_cpu=\"x86\" !="^"!^
    target_os=\"win\" !="^"!^
    is_clang=false !="^"!^
    is_component_build=false !="^"!^
    is_debug=false !="^"!^
    symbol_level=1 !="^"!^
    proprietary_codecs=true !="^"!^
    use_custom_libcxx=false !="^"!^
    use_system_libjpeg=true !="^"!^
    system_libjpeg_root=\"../../../qt_5_12_8/qtbase/src/3rdparty/libjpeg\" !="^"!^
    enable_iterator_debugging=false !="^"!^
    rtc_include_tests=false !="^"!^
    rtc_build_examples=false !="^"!^
    rtc_build_tools=false !="^"!^
    rtc_build_opus=false !="^"!^
    rtc_build_ssl=false !="^"!^
    rtc_ssl_root=\"../../../openssl_1_1_1/include\" !="^"!^
    rtc_ssl_libs=[\"../../../openssl_1_1_1/out32/libssl.lib\",\"../../../openssl_1_1_1/out32/libcrypto.lib\"] !="^"!^
    rtc_builtin_ssl_root_certificates=true !="^"!^
    rtc_build_ffmpeg=false !="^"!^
    rtc_ffmpeg_root=\"../../../ffmpeg\" !="^"!^
    rtc_ffmpeg_libs=[\"../../../ffmpeg/libavutil/libavutil.a\",\"../../../ffmpeg/libavcodec/libavcodec.a\",\"../../../ffmpeg/libswscale/libswscale.a\",\"../../../ffmpeg/libswresample/libswresample.a\"] !="^"!^
    rtc_opus_root=\"../../../opus/include\" !="^"!^
    rtc_enable_protobuf=false !="^"!^
"

echo.
echo Configuration done, now run "ninja -C out/Debug webrtc" and "ninja -C out/Release webrtc".
