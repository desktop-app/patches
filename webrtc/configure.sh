echo Configuring "out/Debug" build...

if [[ "$OSTYPE" == "darwin"* ]]; then
     ArgumentsList=`echo \
        host_cpu=\"x64\" \
        target_os=\"mac\" \
        is_component_build=false \
        is_debug=true \
        symbol_level=2 \
        proprietary_codecs=true \
        use_custom_libcxx=false \
        use_system_libjpeg=true \
        system_libjpeg_root=\"../../../qt_5_12_8/qtbase/src/3rdparty/libjpeg\" \
        use_xcode_clang=true \
        use_rtti=true \
        enable_iterator_debugging=true \
        enable_dsyms=true \
        mac_deployment_target=\"10.12.0\" \
        rtc_include_tests=false \
        rtc_build_examples=false \
        rtc_build_tools=false \
        rtc_build_opus=false \
        rtc_build_ssl=false \
        rtc_ssl_root=\"../../../openssl_1_1_1/include\" \
        rtc_ssl_libs=[\"../../../openssl_1_1_1/libssl.a\",\"../../../openssl_1_1_1/libcrypto.a\"] \
        rtc_builtin_ssl_root_certificates=true \
        rtc_build_ffmpeg=false \
        rtc_ffmpeg_root=\"../../../ffmpeg\" \
        rtc_ffmpeg_libs=[\"../../../ffmpeg/libavcodec/libavcodec.a\",\"../../../ffmpeg/libswscale/libswscale.a\",\"../../../ffmpeg/libswresample/libswresample.a\",\"../../../ffmpeg/libavutil/libavutil.a\",\"/usr/local/macos/lib/libiconv.a\",\"CoreVideo.framework\"] \
        rtc_opus_root=\"../../../opus/include\" \
        rtc_enable_protobuf=false`

   gn gen out/Debug --ide=xcode --args="$ArgumentsList"
else
    ArgumentsList=`echo \
        host_cpu=\"x64\" \
        target_os=\"linux\" \
        is_component_build=false \
        is_debug=true \
        is_clang=false \
        symbol_level=2 \
        proprietary_codecs=true \
        use_custom_libcxx=false \
        use_system_libjpeg=true \
        system_libjpeg_root=\"../../../qt_5_12_8/qtbase/src/3rdparty/libjpeg\" \
        use_rtti=true \
        use_gold=false \
        use_sysroot=false \
        linux_use_bundled_binutils=false \
        enable_dsyms=true \
        rtc_include_tests=false \
        rtc_build_examples=false \
        rtc_build_tools=false \
        rtc_build_opus=false \
        rtc_build_ssl=false \
        rtc_ssl_root=\"../../../openssl_1_1_1/include\" \
        rtc_ssl_libs=[\"../../../openssl_1_1_1/libssl.a\",\"../../../openssl_1_1_1/libcrypto.a\",\"/lib/x86_64-linux-gnu/libdl.so.2\",\"/usr/lib/x86_64-linux-gnu/libpthread.so\"] \
        rtc_builtin_ssl_root_certificates=true \
        rtc_build_ffmpeg=false \
        rtc_ffmpeg_root=\"../../../ffmpeg\" \
        rtc_ffmpeg_libs=[\"../../../ffmpeg/libavcodec/libavcodec.a\",\"../../../ffmpeg/libswscale/libswscale.a\",\"../../../ffmpeg/libswresample/libswresample.a\",\"../../../ffmpeg/libavutil/libavutil.a\",\"/usr/local/lib/libva-x11.a\",\"/usr/local/lib/libva-drm.a\",\"/usr/local/lib/libva.a\",\"/usr/local/lib/libvdpau.a\",\"/usr/lib/x86_64-linux-gnu/libdrm.a\",\"/usr/lib/x86_64-linux-gnu/libXfixes.a\",\"/usr/lib/x86_64-linux-gnu/libXext.a\",\"/usr/lib/x86_64-linux-gnu/libX11.a\",\"/usr/lib/x86_64-linux-gnu/libxcb.a\",\"/usr/lib/x86_64-linux-gnu/libXau.a\",\"/usr/lib/x86_64-linux-gnu/libXdmcp.a\",\"/usr/lib/x86_64-linux-gnu/libdbus-1.a\"] \
        rtc_opus_root=\"../../../opus/include\" \
        rtc_enable_protobuf=false`

    gn gen out/Debug --args="$ArgumentsList"
fi

echo Configuring "out/Release" build...

if [[ "$OSTYPE" == "darwin"* ]]; then
     ArgumentsList=`echo \
        host_cpu=\"x64\" \
        target_os=\"mac\" \
        is_component_build=false \
        is_debug=false \
        symbol_level=2 \
        proprietary_codecs=true \
        use_custom_libcxx=false \
        use_system_libjpeg=true \
        system_libjpeg_root=\"../../../qt_5_12_8/qtbase/src/3rdparty/libjpeg\" \
        use_xcode_clang=true \
        use_rtti=true \
        enable_iterator_debugging=false \
        enable_dsyms=true \
        mac_deployment_target=\"10.12.0\" \
        rtc_include_tests=false \
        rtc_build_examples=false \
        rtc_build_tools=false \
        rtc_build_opus=false \
        rtc_build_ssl=false \
        rtc_ssl_root=\"../../../openssl_1_1_1/include\" \
        rtc_ssl_libs=[\"../../../openssl_1_1_1/libssl.a\",\"../../../openssl_1_1_1/libcrypto.a\"] \
        rtc_builtin_ssl_root_certificates=true \
        rtc_build_ffmpeg=false \
        rtc_ffmpeg_root=\"../../../ffmpeg\" \
        rtc_ffmpeg_libs=[\"../../../ffmpeg/libavcodec/libavcodec.a\",\"../../../ffmpeg/libswscale/libswscale.a\",\"../../../ffmpeg/libswresample/libswresample.a\",\"../../../ffmpeg/libavutil/libavutil.a\",\"/usr/local/macos/lib/libiconv.a\",\"CoreVideo.framework\"] \
        rtc_opus_root=\"../../../opus/include\" \
        rtc_enable_protobuf=false`

   gn gen out/Release --ide=xcode --args="$ArgumentsList"
else
    ArgumentsList=`echo \
        host_cpu=\"x64\" \
        target_os=\"linux\" \
        is_component_build=false \
        is_debug=false \
        is_clang=false \
        symbol_level=2 \
        proprietary_codecs=true \
        use_custom_libcxx=false \
        use_system_libjpeg=true \
        system_libjpeg_root=\"../../../qt_5_12_8/qtbase/src/3rdparty/libjpeg\" \
        use_rtti=true \
        use_gold=false \
        use_sysroot=false \
        linux_use_bundled_binutils=false \
        enable_dsyms=true \
        rtc_include_tests=false \
        rtc_build_examples=false \
        rtc_build_tools=false \
        rtc_build_opus=false \
        rtc_build_ssl=false \
        rtc_ssl_root=\"../../../openssl_1_1_1/include\" \
        rtc_ssl_libs=[\"../../../openssl_1_1_1/libssl.a\",\"../../../openssl_1_1_1/libcrypto.a\",\"/lib/x86_64-linux-gnu/libdl.so.2\",\"/usr/lib/x86_64-linux-gnu/libpthread.so\"] \
        rtc_builtin_ssl_root_certificates=true \
        rtc_build_ffmpeg=false \
        rtc_ffmpeg_root=\"../../../ffmpeg\" \
        rtc_ffmpeg_libs=[\"../../../ffmpeg/libavcodec/libavcodec.a\",\"../../../ffmpeg/libswscale/libswscale.a\",\"../../../ffmpeg/libswresample/libswresample.a\",\"../../../ffmpeg/libavutil/libavutil.a\",\"/usr/local/lib/libva-x11.a\",\"/usr/local/lib/libva-drm.a\",\"/usr/local/lib/libva.a\",\"/usr/local/lib/libvdpau.a\",\"/usr/lib/x86_64-linux-gnu/libdrm.a\",\"/usr/lib/x86_64-linux-gnu/libXfixes.a\",\"/usr/lib/x86_64-linux-gnu/libXext.a\",\"/usr/lib/x86_64-linux-gnu/libX11.a\",\"/usr/lib/x86_64-linux-gnu/libxcb.a\",\"/usr/lib/x86_64-linux-gnu/libXau.a\",\"/usr/lib/x86_64-linux-gnu/libXdmcp.a\",\"/usr/lib/x86_64-linux-gnu/libdbus-1.a\"] \
        rtc_opus_root=\"../../../opus/include\" \
        rtc_enable_protobuf=false`

    gn gen out/Release --args="$ArgumentsList"
fi

echo Configuration done, now run \"ninja -C out/Debug webrtc\" and \"ninja -C out/Release webrtc\".
