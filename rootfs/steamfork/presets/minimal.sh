#!/bin/bash
rm -rf /tmp/builder-releasetag
rm -rf /tmp/build_temp_ver

export DISTRO_NAME="SteamFork"
export IMAGE_HOSTNAME="steamfork"
export OS_CODENAME="Minimal"
export OS_FS_PREFIX="sf"

export HOME_URL="https://www.steamfork.org"
export DOCUMENTATION_URL="https://wiki.steamfork.org"
export SUPPORT_URL="${HOME_URL}"
export BUG_REPORT_URL="https://github.com/SteamFork#community"

echo -e ${RELEASE_TAG} > /tmp/builder-releasetag
echo -e "$(echo ${DISTRO_NAME} | tr '[:upper:]' '[:lower:]')_$(echo ${OS_CODENAME} | tr '[:upper:]' '[:lower:]')_${RELEASE_TAG}" > /tmp/build_temp_ver
export BUILDVER=$(cat /tmp/build_temp_ver)
export IMAGEFILE="${BUILDVER}"
export ENABLED_SERVICES=( NetworkManager
			firewalld
			systemd-resolved
                        nix.mount
                        steamos-offload.target
			fstrim.timer
                        var-lib-pacman.mount
                        etc.mount
                        opt.mount
                        root.mount
                        srv.mount
                        usr-lib-debug.mount
                        usr-local.mount
                        var-cache-pacman.mount
                        var-lib-docker.mount
                        var-lib-flatpak.mount
                        var-lib-systemd-coredump.mount
                        var-log.mount
                        var-tmp.mount )
export DISABLED_SERVICES=()
export PLYMOUTH_THEME=""
export FINAL_DISTRIB_IMAGE=${BUILDVER}
export KERNELCHOICE="linux"
export BASE_BOOTSTRAP_PKGS="base base-devel linux-firmware intel-ucode amd-ucode dkms jq btrfs-progs core-3.6/grub efibootmgr openssh"
export STEAMOS_PKGS="acl
                    accountsservice
                    adobe-source-code-pro-fonts
                    aom
                    arch-install-scripts
                    archiso
                    archlinux-keyring
                    argon2
                    at-spi2-core
                    attr
                    audit
                    autoconf
                    automake
                    avahi
                    base
                    base-devel
                    bash
                    bc
                    binutils
                    bison
                    brotli
                    btrfs-progs
                    bzip2
                    c-ares
                    ca-certificates
                    ca-certificates-mozilla
                    ca-certificates-utils
                    cairo
                    cantarell-fonts
                    ccache
                    coreutils
		    cronie
                    cryptsetup
                    curl
                    dav1d
                    db5.3
                    dbus
                    dbus-broker
                    dbus-broker-units
                    dconf
                    debugedit
                    default-cursors
                    desktop-file-utils
                    device-mapper
                    diffutils
                    dosfstools
                    dvisvgm
                    e2fsprogs
                    ectool
                    efibootmgr
                    efivar
                    erofs-utils
                    expat
                    fakeroot
                    ffcall
                    fftw
                    file
                    filesystem
                    findutils
                    flex
                    fontconfig
                    freetype2
                    fribidi
                    fuse-common
                    fuse-overlayfs
                    fuse2
                    fuse3
                    gawk
                    gc
                    gcc
                    gcc-libs
                    gd
                    gdbm
                    gdk-pixbuf2
                    gettext
                    ghostscript
                    giflib
                    git
                    glib2
                    glibc
                    gmp
                    gnupg
                    gnutls
                    gpgme
                    gpm
                    graphite
                    graphviz
                    grep
                    groff
                    gsettings-desktop-schemas
                    gsfonts
                    gtk-update-icon-cache
                    gtk2
                    gts
                    guile
                    gzip
                    harfbuzz
                    hicolor-icon-theme
                    hiredis
                    holo-desync
                    holo-dmi-rules
                    holo-fstab-repair
                    holo-keyring
                    holo-nix-offload
                    holo-sudo
                    hwdata
                    iana-etc
                    icu
                    ijs
                    imagemagick
                    iproute2
                    iptables
                    iputils
                    jansson
                    jbig2dec
                    jbigkit
                    json-c
                    kbd
		    kdumpst
                    keyutils
                    kmod
                    krb5
                    lcms2
                    less
                    libarchive
                    libassuan
                    libavif
                    libbpf
                    libburn
                    libcap
                    libcap-ng
                    libcups
                    libdaemon
                    libdatrie
                    libde265
                    libedit
                    libei
                    libelf
                    libevdev
                    libevent
                    libffi
                    libgcrypt
                    libgpg-error
                    libheif
                    libice
                    libidn
                    libidn2
                    libisl
                    libisoburn
                    libisofs
                    libjpeg-turbo
                    libksba
                    libldap
                    liblqr
                    libmnl
                    libmpc
                    libnetfilter_conntrack
                    libnfnetlink
                    libnftnl
                    libnghttp2
                    libnghttp3
                    libngtcp2
                    libnl
                    libnsl
                    libp11-kit
                    libpaper
                    libpcap
                    libpng
                    libpsl
                    libraqm
                    librsvg
                    libsasl
                    libseccomp
                    libsecret
                    libsigsegv
                    libsm
                    libssh2
                    libsynctex
                    libsysprof-capture
                    libtasn1
                    libthai
                    libtiff
                    libtirpc
                    libtool
                    libunistring
                    libusb
                    libutempter
                    libuv
                    libverto
                    libwebp
                    libx11
                    libxau
                    libxaw
                    libxcb
                    libxcomposite
                    libxcrypt
                    libxcursor
                    libxdamage
                    libxdmcp
                    libxext
                    libxfixes
                    libxft
                    libxi
                    libxinerama
                    libxkbcommon
                    libxml2
                    libxmu
                    libxpm
                    libxrandr
                    libxrender
                    libxt
                    libxtst
                    libyaml
                    libyuv
                    licenses
                    linux
                    linux-api-headers
                    linux-firmware
                    linux-firmware-whence
		    extra-3.6/llvm
                    lsof
                    lz4
                    lzo
                    m4
                    make
                    mkinitcpio
                    mkinitcpio-busybox
                    mpdecimal
                    mpfr
                    mtools
                    ncurses
                    netpbm
                    nettle
                    networkmanager
                    node-gyp
                    nodejs
                    nodejs-nopt
                    npm
                    npth
		    open-vm-tools
                    openjpeg2
                    openssh
                    openssl
                    ostree
                    p11-kit
                    pacman
                    pacman-mirrorlist
                    pahole
                    pam
                    pambase
                    pango
                    patch
                    pciutils
                    pcre2
                    perl
                    perl-error
                    perl-mailtools
                    perl-timedate
                    pikaur
                    pinentry
                    pixman
                    pkgconf
                    plymouth
                    pnpm
                    poppler-data
                    popt
                    potrace
                    procps-ng
                    psmisc
                    pyalpm
                    python
                    python-babel
                    python-charset-normalizer
                    python-docutils
                    python-idna
                    python-imagesize
                    python-jinja
                    python-markupsafe
                    python-packaging
                    python-pygments
                    python-pytz
                    python-requests
                    python-snowballstemmer
                    python-sphinx
                    python-sphinx-alabaster-theme
                    python-sphinxcontrib-applehelp
                    python-sphinxcontrib-devhelp
                    python-sphinxcontrib-htmlhelp
                    python-sphinxcontrib-jsmath
                    python-sphinxcontrib-qthelp
                    python-sphinxcontrib-serializinghtml
                    python-urllib3
                    python-yaml
                    rav1e
                    readline
                    rsync
                    screen
                    sed
                    semver
                    shadow
                    shared-mime-info
                    sqlite
                    squashfs-tools
                    steamos-atomupd-client
                    steamos-devkit-service
                    steamos-efi
                    steamos-log-submitter
                    steamos-manager
                    steamos-networking-tools
                    steamos-reset
                    steamos-systemreport
                    steamos-tweak-mtu-probing
                    sudo
                    svt-av1
                    systemd
                    systemd-libs
                    systemd-sysvcompat
                    tar
                    texinfo
                    texlive-basic
                    texlive-bin
                    texlive-latex
                    texlive-latexextra
                    texlive-latexrecommended
                    texlive-pictures
                    tpm2-tss
                    tzdata
                    util-linux
                    util-linux-libs
                    vim
                    vim-runtime
                    webrtc-audio-processing
                    which
                    woff2
                    x265
                    xcb-proto
                    xkeyboard-config
                    xorg-xprop
                    xorgproto
                    xxhash
                    xz
                    zlib
                    zstd
                    zziplib"

export UI_BOOTSTRAP="${STEAMOS_PKGS}
                  bc
                  zenity
		  ryzenadj
                  steamfork-device-support
                  steamfork-customizations
		  steamfork-installer
		  steamfork-keyring
                  jupiter-hw-support
                  jupiter-legacy-support"

export POSTCOPY_BIN_EXECUTION=""
