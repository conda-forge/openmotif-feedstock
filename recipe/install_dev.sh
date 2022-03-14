echo -n "Installing -dev files..."
cp -a $SRC_DIR/install/$PREFIX/include/* $PREFIX/include
cp -a $SRC_DIR/install/$PREFIX/lib/*.a $PREFIX/lib
echo " done"
