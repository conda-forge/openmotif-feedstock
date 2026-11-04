echo -n "Installing main files..."
cp -av "$SRC_DIR/install/$PREFIX/bin" "$PREFIX"
for library in "$SRC_DIR/install/$PREFIX/lib/"*; do
    case "$library" in
        *.a|*.la) ;;
        *) cp -av "$library" "$PREFIX/lib/" ;;
    esac
done
echo "done"
