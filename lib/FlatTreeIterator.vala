namespace FlatTree {
    public class Iterator {
        public uint index { private set; public get; default = 0; }
        public uint offset { private set; public get; default = 0; }
        public uint factor { private set; public get; default = 2; }

        /**
         * Constructs a new flat tree iterator at the given index
         *
         * @param index the index of the node
         */
        public Iterator.at_index (uint index) {
            seek (index);
        }

        /**
         * Is the iterator at the index of a left child
         */
        public bool is_left () {
            if ((offset & 1) == 1)
                return false;

            return true;
        }

        /**
         * Is the iterator at the index of a right child
         */
        public bool is_right () {
            if ((offset & 1) == 0)
                return false;

            return true;
        }

        /**
         * Moves the iterator to the index of the left child at the current
         * index
         *
         * @return the index of the left child node
         */
        public uint left_child () {
            if (factor == 2)
                return index;

            factor /= 2;
            offset *= 2;
            index -= factor / 2;
            return index;
        }

        /**
         * Moves the iterator to the index of the left-most node of the tree
         *
         * @return the index of the left span node
         */
        public uint left_span () {
            if (factor == 2)
                return index;

            index = (index + 1) - (factor / 2);
            offset = index / 2;
            factor = 2;
            return index;
        }

        /**
         * Moves the iterator to the index of the next node at the current
         * depth
         *
         * @return the index of the next node
         */
        public uint next () {
            offset++;
            index += factor;

            return index;
        }

        /**
         * Moves the iterator to the index of the parent node
         *
         * @return the index of the parent node
         */
        public uint parent () {
            if ((offset & 1) == 1) {
                index -= factor / 2;
                offset = (offset - 1) / 2;
            } else {
                index += factor / 2;
                offset /= 2;
            }
            factor *= 2;

            return index;
        }

        /**
         * Moves the iterator to the index of the previous node at the current depth
         *
         * @return the index of the previous node
         */
        public uint prev () {
            if (offset > 0) {
                offset--;
                index -= factor;
            }

            return index;
        }

        /**
         * Moves the iterator to the index of the right child at the current
         * index
         *
         * @return the index of the right child
         */
        public uint right_child () {
            if (factor == 2)
                return index;

            factor /= 2;
            offset = (offset * 2) + 1;
            index += factor / 2;
            return index;
        }

        /**
         * Moves the iterator to the index of the right-most node of the tree
         *
         * @return the index of the right span node
         */
        public uint right_span () {
            if (factor == 2)
                return index;

            index = (index - 1) + (factor / 2);
            offset = index / 2;
            factor = 2;
            return index;
        }

        /**
         * Moves the iterator to the specified tree index
         *
         * @param index the target index for the iterator
         */
        public void seek (uint index) {
            this.index = index;
            this.offset = FlatTree.offset (index);
            var depth = FlatTree.depth (index);
            this.factor = FlatTree.pow2 (depth + 1);
        }
    }
}
