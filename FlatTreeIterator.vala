namespace FlatTree {
    public class Iterator {
        public uint index { private set; public get; default = 0; }
        public uint offset { private set; public get; default = 0; }
        public uint factor { private set; public get; default = 0; }

        public Iterator.with_index (uint index) {
            this.index = index;
        }

        public uint next () {
            return index += 1;
        }

        public uint parent () {
            index = FlatTree.parent (index);
            return index;
        }

        public void prev () {
            if (index > 0)
                index -= 1;
        }

        public uint right_child () {
            index = FlatTree.right_child (index);
            return index;
        }

        public uint left_child () {
            index = FlatTree.left_child (index);
            return index;
        }
    }
}
