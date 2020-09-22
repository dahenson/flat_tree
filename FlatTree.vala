namespace FlatTree {

    /**
     * Returns the depth of the given index
     *
     * @param index the index of the node
     *
     * @return the depth of the node
     */
    public static int depth (int index) {
        int depth = 0;

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
    public static int index (int depth, int offset) {
        return (1 + 2 * offset) * pow2 (depth) - 1;
    }

    /**
     * Returns the offset for a node at the given index
     * 
     * @param index the index of the node
     *
     * @return the calculated offset of the node
     */
    public static int offset (int index) {
        if ((index & 1) == 0)
            return index / 2;

        int depth = depth (index);

        return (((index + 1) / pow2 (depth)) - 1) / 2;
    }

    private int pow2 (int n) {
        int x = 1;

        x <<= n;

        return x;
    }
}
