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

        return { left_child, right_child };
    }

    /**
     * Returns the count of the tree for the given index
     *
     * @param index the index of the parent node
     *
     * @return the count of the tree at the given node
     */
    public static uint count (uint index) {
        if ((index & 1) == 0)
            return 1;

        uint depth = depth (index);

        return pow2 (depth + 1) - 1;
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
     * Returns a list of all of the full roots (subtrees where the nodes have
     * either 2 or 0 children) < index
     *
     * @param index the index of the node
     *
     * @return an array or the full roots of the tree
     */
    public static uint[] full_roots (uint index) {
        uint[] result = {};

        uint offset = 0;
        uint factor = 1;

        index /= 2;

        while (true) {
            if (index == 0) return result;
            while (factor * 2 <= index) {
                factor *= 2;
            }
            result += (offset + factor - 1);
            offset = offset + 2 * factor;
            index -= factor;
            factor = 1;
        }
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
     * Returns the left-most node of the tree at the given index
     * 
     * @param index the index of the node
     *
     * @return the index of the left span
     */
    public static uint? left_span (uint index) {
        if ((index & 1) == 0)
            return index;

        uint depth = depth (index);

        return (index + 1) - pow2 (depth);
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
     * Returns the right-most node of the tree at the given index
     * 
     * @param index the index of the parent node
     *
     * @return the index of the right span
     */
    public static uint right_span (uint index) {
        if ((index & 1) == 0)
            return index;

        uint depth = depth (index);

        return (index - 1) + pow2 (depth);
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

    /**
     * Returns the indeces of the left and right spans for a node at the given
     * index
     * 
     * @param index the index of the node
     *
     * @return the indeces of the left and right spanning nodes
     */
    public static uint[] spans (uint index) {
        if ((index & 1) == 0)
            return {index, index};

        uint depth = depth (index);
        uint left_span = (index + 1) - pow2 (depth);
        uint right_span = (index - 1) + pow2 (depth);

        return {left_span, right_span};
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
