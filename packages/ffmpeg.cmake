ExternalProject_Add(ffmpeg
    DEPENDS
        bzip2
        openssl
        rubberband
        libiconv
        libxml2
        zlib
    GIT_REPOSITORY https://github.com/FFmpeg/FFmpeg.git
    SOURCE_DIR ${SOURCE_LOCATION}
    GIT_CLONE_FLAGS "--sparse --filter=tree:0"
    GIT_CLONE_POST_COMMAND "sparse-checkout set --no-cone /* !tests/ref/fate"
    UPDATE_COMMAND ""
    CONFIGURE_COMMAND ${EXEC} CONF=1 <SOURCE_DIR>/configure
        --cross-prefix=${TARGET_ARCH}-
        --prefix=${MINGW_INSTALL_PREFIX}
        --arch=${TARGET_CPU}
        --target-os=mingw32
        --pkg-config-flags=--static
        --enable-cross-compile
        --enable-runtime-cpudetect
        --enable-gpl
        --enable-version3
        --disable-libass
        --disable-libfreetype
        --disable-libfribidi
        --disable-libfontconfig
        --disable-libharfbuzz
        --disable-filter=drawtext
        --disable-filter=ass
        --disable-filter=subtitles
        --enable-librubberband
        --enable-openssl
        --disable-doc
        --disable-ffplay
        --disable-ffprobe
        --disable-encoders
        --disable-muxers
        --disable-hwaccels
        --disable-devices
        --disable-indevs
        --disable-outdevs
        --disable-videotoolbox
        --disable-audiotoolbox
        --disable-amf
        --disable-cuda
        --disable-cuvid
        --disable-d3d11va
        --disable-dxva2
        --disable-nvdec
        --disable-nvenc
        --disable-vdpau
        --disable-vaapi
        --disable-libplacebo
        --disable-vulkan
        --disable-libshaderc
        --extra-cflags=-Wno-error=int-conversion
    BUILD_COMMAND ${MAKE}
    INSTALL_COMMAND ${MAKE} install
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)

force_rebuild_git(ffmpeg)
cleanup(ffmpeg install)