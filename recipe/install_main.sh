echo -n "Installing main files..."
cp -av $SRC_DIR/install/$PREFIX/{bin,lib} $PREFIX
rm -f $PREFIX/lib/*.{a,la}
echo "done"
