#!/bin/sh

# This script should be executed from Libraries/webrtc/src directory.
# It removes all files, which are not necessary for building TDesktop.

logInfo() {
    echo [INFO] $1
}

copyToNew() {
    cp -R $1 ../src_new/$1
}

copyLib() {
    if [ -d out/$1 ]; then
        mkdir -p ../src_new/out/$1/obj/
        cp out/$1/obj/libwebrtc.a ../src_new/out/$1/obj/libwebrtc.a
    fi
}

mkdirSrc() {
    logInfo "Creating an empty directory"

    mkdir ../src_new
}

copyCommonTypesHeader() {
    logInfo "Copying common_types.h file"

    copyToNew common_types.h
}

copyApi() {
    logInfo "Copying api files"

    copyToNew api
}

copyCall() {
    logInfo "Copying call files"

    copyToNew call
}

copyCommonVideo() {
    logInfo "Copying common_video files"

    copyToNew common_video
}

copyLogging() {
    logInfo "Copying logging files"

    copyToNew logging
}

copyMedia() {
    logInfo "Copying media files"

    copyToNew media
}

copyModules() {
    logInfo "Copying modules files"

    copyToNew modules
}

copyPc() {
    logInfo "Copying pc files"

    copyToNew pc
}

copyP2p() {
    logInfo "Copying p2p files"

    copyToNew p2p
}

copyRtcBase() {
    logInfo "Copying rtc_base files"

    copyToNew rtc_base
}

copySdk() {
    logInfo "Copying sdk files"

    copyToNew sdk
}

copySystemWrappers() {
    logInfo "Copying system_wrappers files"

    copyToNew system_wrappers
}

copyAbseilCpp() {
    logInfo "Copying third_party/abseil-cpp files"

    mkdir ../src_new/third_party
    copyToNew third_party/abseil-cpp
}

copyLibyuv() {
    logInfo "Copying third_party/libyuv files"

    copyToNew third_party/libyuv
}

copyLibDebug() {
    logInfo "Copying Debug libwebrtc.a file"

    copyLib Debug
}

copyLibRelease() {
    logInfo "Copying Release libwebrtc.a file"

    copyLib Release
}

replaceSrc() {
    logInfo "Deleting old src directory"

    cd ..
    rm -rf src

    logInfo "Renaming new src directory"

    mv src_new src
    cd src
}

mkdirSrc
copyCommonTypesHeader
copyApi
copyCall
copyCommonVideo
copyLogging
copyMedia
copyModules
copyPc
copyP2p
copyRtcBase
copySdk
copySystemWrappers
copyAbseilCpp
copyLibyuv
copyLibDebug
copyLibRelease
replaceSrc
