@echo off

:: This script should be executed from Libraries\webrtc\src directory.
:: It removes all files, which are not necessary for building TDesktop.

call:mkdirSrc
call:copyCommonTypesHeader
call:copyApi
call:copyCall
call:copyCommonVideo
call:copyLogging
call:copyMedia
call:copyModules
call:copyPc
call:copyP2p
call:copyRtcBase
call:copySdk
call:copySystemWrappers
call:copyAbseilCpp
call:copyLibyuv
call:copyLibDebug
call:copyLibRelease
call:replaceSrc

GOTO:EOF

:: Funtions
:logInfo
    echo [INFO] %~1
GOTO:EOF

:copyToNew
    PowerShell Copy-Item %1 ../src_new/%1 -Recurse
GOTO:EOF

:copyLib
    if exist out\%1 (
        mkdir ..\src_new\out\%1\obj\
        PowerShell Copy-Item out\%1\obj\webrtc.lib ..\src_new\out\%1\obj\webrtc.lib
    )
GOTO:EOF

:mkdirSrc
    call:logInfo "Creating an empty directory"

    mkdir ..\src_new
GOTO:EOF

:copyCommonTypesHeader
    call:logInfo "Copying common_types.h file"

    call:copyToNew common_types.h
GOTO:EOF

:copyApi
    call:logInfo "Copying api files"

    call:copyToNew api
GOTO:EOF

:copyCall
    call:logInfo "Copying call files"

    call:copyToNew "call"
GOTO:EOF

:copyCommonVideo
    call:logInfo "Copying common_video files"

    call:copyToNew common_video
GOTO:EOF

:copyLogging
    call:logInfo "Copying logging files"

    call:copyToNew logging
GOTO:EOF

:copyMedia
    call:logInfo "Copying media files"

    call:copyToNew media
GOTO:EOF

:copyModules
    call:logInfo "Copying modules files"

    call:copyToNew modules
GOTO:EOF

:copyPc
    call:logInfo "Copying pc files"

    call:copyToNew pc
GOTO:EOF

:copyP2p
    call:logInfo "Copying p2p files"

    call:copyToNew p2p
GOTO:EOF

:copyRtcBase
    call:logInfo "Copying rtc_base files"

    call:copyToNew rtc_base
GOTO:EOF

:copySdk
    call:logInfo "Copying sdk files"

    call:copyToNew sdk
GOTO:EOF

:copySystemWrappers
    call:logInfo "Copying system_wrappers files"

    call:copyToNew system_wrappers
GOTO:EOF


:copyAbseilCpp
    call:logInfo "Copying third_party\abseil-cpp files"

    mkdir ..\src_new\third_party
    call:copyToNew third_party\abseil-cpp
GOTO:EOF


:copyLibyuv
    call:logInfo "Copying third_party\libyuv files"

    call:copyToNew third_party\libyuv
GOTO:EOF

:copyLibDebug
    call:logInfo "Copying Debug webrtc.lib file"

    call:copyLib Debug
GOTO:EOF

:copyLibRelease
    call:logInfo "Copying Release webrtc.lib file"

    call:copyLib Release
GOTO:EOF

:replaceSrc
    call:logInfo "Deleting old src directory"

    cd ..
    PowerShell Remove-Item src -Force -Recurse

    call:logInfo "Renaming new src directory"

    PowerShell Rename-Item -Path src_new -NewName src
    cd src
GOTO:EOF
