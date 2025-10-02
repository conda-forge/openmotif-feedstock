#!/bin/bash
# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/gnuconfig/config.* .

set -xeuo pipefail

case `uname` in
    Darwin)
	export LDFLAGS="$LDFLAGS -Wl,-rpath,$PREFIX/lib -L$PREFIX/lib"
	;;
    Linux)
	export LDFLAGS="$LDFLAGS -L$PREFIX/lib -liconv"
	;;
esac
export CPPFLAGS="$CPPFLAGS -I$PREFIX/include"

./configure --prefix=$PREFIX \
            --disable-dependency-tracking \
            --disable-silent-rules \
	    --enable-jpeg \
	    --enable-png \
	    --enable-xft

make -j${CPU_COUNT} | sed 's|'$PREFIX'|$PREFIX|g'
if [[ "${CONDA_BUILD_CROSS_COMPILATION:-}" != "1" || "${CROSSCOMPILING_EMULATOR}" != "" ]]; then
make check | sed 's|'$PREFIX'|$PREFIX|g'
fi
make DESTDIR=`pwd`/install/ install | sed 's|'$PREFIX'|$PREFIX|g'
