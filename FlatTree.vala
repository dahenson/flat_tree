namespace FlatTree {

    /**
     * Returns the children of the given index, or null if no children are
     * present
     *
     * @param index the index of the node
     *
     * @return an array containing the indeces of both children nodes, or null
     *         if index is a leaf node and no children are present
     */
    public static uint[]? children (uint index) {
        if ((index & 1) == 0)
            return null;

        uint depth = depth (index);
        uint child_offset = offset_given_depth (index, depth) * 2;

        depth -= 1;
        uint left_child = FlatTree.index (depth, child_offset);
        uint right_child = FlatTree.index (depth, child_offset + 1);

        uint[2] children = { left_child, right_child };

        return children;
    }

    /**
     * Returns the depth of the given index
     *
     * @param index the index of the node
     *
     * @return the depth of the node
     */
    public static uint depth (uint index) {
        uint depth = 0;

        while ((index & 1) == 1) {
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
     * Returns the left child of a node at the given index, or null if no
     * children are present
     * 
     * @param index the index of the node
     *
     * @return the index of the left child node
     */
    public static uint? left_child (uint index) {
        if ((index & 1) == 0)
            return null;

        uint depth = depth (index);
        uint offset = offset_given_depth (index, depth);

        return FlatTree.index (depth - 1, offset * 2);
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
     * Returns the index of the parent for a node at the given index
     * 
     * @param index the index of the node
     *
     * @return the index of the parent node
     */
    public static uint parent (uint index) {
        uint depth = depth (index);
        uint offset = offset_given_depth (index, depth);

        if ((offset & 1) == 1)
            offset -= 1;

        return FlatTree.index (depth + 1, offset / 2);
    }

    /**
     * Returns the right child of a node at the given index, or null if no
     * children are present
     * 
     * @param index the index of the node
     *
     * @return the index of the right child node
     */
    public static uint? right_child (uint index) {
        if ((index & 1) == 0)
            return null;

        uint depth = depth (index);
        uint offset = offset_given_depth (index, depth);

        return FlatTree.index (depth - 1, offset * 2 + 1);
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
        uint offset = offset_given_depth (index, depth);

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

    private uint offset_given_depth (uint index, uint depth) {
        if ((index & 1) == 0)
            return index / 2;

        return (((index + 1) / pow2 (depth)) - 1) / 2;
    }
}
