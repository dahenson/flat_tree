
public void test_children () {
    uint[] children = {};

    children = FlatTree.children (1);
    assert_true (children[0] == 0);
    assert_true (children[1] == 2);

    children = FlatTree.children (15);
    assert_true (children[0] == 7);
    assert_true (children[1] == 23);

    children = FlatTree.children (23);
    assert_true (children[0] == 19);
    assert_true (children[1] == 27);

    children = FlatTree.children (16);
    assert_true (children == null);
}

public void test_count () {
    assert_true (FlatTree.count (0) == 1);
    assert_true (FlatTree.count (16) == 1);
    assert_true (FlatTree.count (1) == 3);
    assert_true (FlatTree.count (3) == 7);
    assert_true (FlatTree.count (5) == 3);
    assert_true (FlatTree.count (23) == 15);
    assert_true (FlatTree.count (27) == 7);
}

public void test_depth () {
    assert_true (FlatTree.depth (0) == 0);
    assert_true (FlatTree.depth (6) == 0);
    assert_true (FlatTree.depth (1) == 1);
    assert_true (FlatTree.depth (5) == 1);
    assert_true (FlatTree.depth (15) == 4);
    assert_true (FlatTree.depth (23) == 3);
}

public void test_full_roots () {
    /* uint[] roots; */
    /*  */
    /* roots = FlatTree.full_roots (0); */
    /* assert (roots.length == 0); */
    /*  */
    /* roots = FlatTree.full_roots (2); */
    /* assert (roots.length == 1); */
    /* assert (roots[0] == 2); */
}

public void test_index () {
    // Depth
    assert_true (FlatTree.index (0, 0) == 0);
    assert_true (FlatTree.index (1, 0) == 1);
    assert_true (FlatTree.index (2, 0) == 3);
    assert_true (FlatTree.index (3, 0) == 7);
    assert_true (FlatTree.index (4, 0) == 15);

    // Offset
    assert_true (FlatTree.index (0, 1) == 2);
    assert_true (FlatTree.index (0, 5) == 10);
    assert_true (FlatTree.index (2, 2) == 19);
    assert_true (FlatTree.index (3, 1) == 23);
}

public void test_left_child () {
    assert_true (FlatTree.left_child (0) == null);
    assert_true (FlatTree.left_child (1) == 0);
    assert_true (FlatTree.left_child (3) == 1);
    assert_true (FlatTree.left_child (15) == 7);
}

public void test_left_span () {
    assert_true (FlatTree.left_span (2) == 2);
    assert_true (FlatTree.left_span (1) == 0);
    assert_true (FlatTree.left_span (3) == 0);
    assert_true (FlatTree.left_span (11) == 8);
    assert_true (FlatTree.left_span (19) == 16);
}

public void test_offset () {
    assert_true (FlatTree.offset (0) == 0);
    assert_true (FlatTree.offset (10) == 5);
    assert_true (FlatTree.offset (19) == 2);
    assert_true (FlatTree.offset (21) == 5);
}

public void test_parent () {
    assert_true (FlatTree.parent (0) == 1);
    assert_true (FlatTree.parent (13) == 11);
    assert_true (FlatTree.parent (8) == 9);
    assert_true (FlatTree.parent (25) == 27);
}

public void test_right_child () {
    assert_true (FlatTree.right_child (4) == null);
    assert_true (FlatTree.right_child (1) == 2);
    assert_true (FlatTree.right_child (3) == 5);
    assert_true (FlatTree.right_child (15) == 23);
}

public void test_right_span () {
    assert_true (FlatTree.right_span (4) == 4);
    assert_true (FlatTree.right_span (1) == 2);
    assert_true (FlatTree.right_span (3) == 6);
    assert_true (FlatTree.right_span (15) == 30);
    assert_true (FlatTree.right_span (23) == 30);
}

public void test_sibling () {
    assert_true (FlatTree.sibling (0) == 2);
    assert_true (FlatTree.sibling (2) == 0);
    assert_true (FlatTree.sibling (5) == 1);
    assert_true (FlatTree.sibling (19) == 27);
}

public void test_spans () {
    uint[] spans = {};

    spans = FlatTree.spans (0);
    assert_true (spans[0] == 0);
    assert_true (spans[1] == 0);

    spans = FlatTree.spans (16);
    assert_true (spans[0] == 16);
    assert_true (spans[1] == 16);

    spans = FlatTree.spans (3);
    assert_true (spans[0] == 0);
    assert_true (spans[1] == 6);

    spans = FlatTree.spans (19);
    assert_true (spans[0] == 16);
    assert_true (spans[1] == 22);
}

public static int main (string[] args) {
    Test.init (ref args);

    Test.add_func ("/libflat-tree/children", test_children);
    Test.add_func ("/libflat-tree/count", test_count);
    Test.add_func ("/libflat-tree/depth", test_depth);
    Test.add_func ("/libflat-tree/full_roots", test_full_roots);
    Test.add_func ("/libflat-tree/index", test_index);
    Test.add_func ("/libflat-tree/left_child", test_left_child);
    Test.add_func ("/libflat-tree/left_span", test_left_span);
    Test.add_func ("/libflat-tree/offset", test_offset);
    Test.add_func ("/libflat-tree/parent", test_parent);
    Test.add_func ("/libflat-tree/right_child", test_right_child);
    Test.add_func ("/libflat-tree/right_span", test_right_span);
    Test.add_func ("/libflat-tree/sibling", test_sibling);
    Test.add_func ("/libflat-tree/spans", test_spans);

    return Test.run ();
}
