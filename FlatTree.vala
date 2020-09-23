namespace FlatTree {

    /**
     * Returns the depth of the given index
     *
     * @param index the index of the node
     *
     * @return the depth of the node
     */
    public static uint depth (uint index) {
        uint depth = 0;

        while ((index & 1) != 0) {
            index >>= 1;
            depth++;
        }

        return depth;
    }

    /**
     * Returns an array index for the tree element at the given depth and offset
     * 
     * @param depth the depth of the desired index
     * @param offset the offset of the desired index
     *
     * @return the calculated index of the node at depth and offset
     */
    public static uint index (uint depth, uint offset) {
        return (1 + 2 * offset) * pow2 (depth) - 1;
    }

    /**
     * Returns the offset for a node at the given index
     * 
     * @param index the index of the node
     *
     * @return the calculated offset of the node
     */
    public static uint offset (uint index) {
        if ((index & 1) == 0)
            return index / 2;

        uint depth = depth (index);

        return (((index + 1) / pow2 (depth)) - 1) / 2;
    }

    /**
     * Returns the index of the sibling for a node at the given index
     * 
     * @param index the index of the node
     *
     * @return the index of the sibling node
     */
    public static uint sibling (uint index) {
        uint depth = depth (index);
        uint offset = offset (index);

        if ((offset & 1) == 0) {
            offset += 1;
        } else {
            offset -= 1;
        }

        return FlatTree.index (depth, offset);
    }

    private uint pow2 (uint n) {
        uint x = 1;

        x <<= n;

        return x;
    }
}
