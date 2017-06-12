echo -n "Installing doc files..."
cp -a $SRC_DIR/install/$PREFIX/share/man/* $PREFIX/share/man
echo " done"
#Examples break in "Fixing links"; need feature from conda-build 3 to fix this
#cp -a $SRC_DIR/install/$PREFIX/share/Xm $PREFIX/share/
