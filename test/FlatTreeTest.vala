
public void test_children () {
    uint[] children = {};

    children = FlatTree.children (1);
    assert (children[0] == 0);
    assert (children[1] == 2);

    children = FlatTree.children (15);
    assert (children[0] == 7);
    assert (children[1] == 23);

    children = FlatTree.children (23);
    assert (children[0] == 19);
    assert (children[1] == 27);

    children = FlatTree.children (16);
    assert (children == null);
}

public void test_count () {
    assert (FlatTree.count (0) == 1);
    assert (FlatTree.count (16) == 1);
    assert (FlatTree.count (1) == 3);
    assert (FlatTree.count (3) == 7);
    assert (FlatTree.count (5) == 3);
    assert (FlatTree.count (23) == 15);
    assert (FlatTree.count (27) == 7);
}

public void test_depth () {
    assert (FlatTree.depth (0) == 0);
    assert (FlatTree.depth (6) == 0);
    assert (FlatTree.depth (1) == 1);
    assert (FlatTree.depth (5) == 1);
    assert (FlatTree.depth (15) == 4);
    assert (FlatTree.depth (23) == 3);
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
    assert (FlatTree.index (0, 0) == 0);
    assert (FlatTree.index (1, 0) == 1);
    assert (FlatTree.index (2, 0) == 3);
    assert (FlatTree.index (3, 0) == 7);
    assert (FlatTree.index (4, 0) == 15);

    // Offset
    assert (FlatTree.index (0, 1) == 2);
    assert (FlatTree.index (0, 5) == 10);
    assert (FlatTree.index (2, 2) == 19);
    assert (FlatTree.index (3, 1) == 23);
}

public void test_left_child () {
    assert (FlatTree.left_child (0) == null);
    assert (FlatTree.left_child (1) == 0);
    assert (FlatTree.left_child (3) == 1);
    assert (FlatTree.left_child (15) == 7);
}

public void test_left_span () {
    assert (FlatTree.left_span (2) == 2);
    assert (FlatTree.left_span (1) == 0);
    assert (FlatTree.left_span (3) == 0);
    assert (FlatTree.left_span (11) == 8);
    assert (FlatTree.left_span (19) == 16);
}

public void test_offset () {
    assert (FlatTree.offset (0) == 0);
    assert (FlatTree.offset (10) == 5);
    assert (FlatTree.offset (19) == 2);
    assert (FlatTree.offset (21) == 5);
}

public void test_parent () {
    assert (FlatTree.parent (0) == 1);
    assert (FlatTree.parent (13) == 11);
    assert (FlatTree.parent (8) == 9);
    assert (FlatTree.parent (25) == 27);
}

public void test_right_child () {
    assert (FlatTree.right_child (4) == null);
    assert (FlatTree.right_child (1) == 2);
    assert (FlatTree.right_child (3) == 5);
    assert (FlatTree.right_child (15) == 23);
}

public void test_right_span () {
    assert (FlatTree.right_span (4) == 4);
    assert (FlatTree.right_span (1) == 2);
    assert (FlatTree.right_span (3) == 6);
    assert (FlatTree.right_span (15) == 30);
    assert (FlatTree.right_span (23) == 30);
}

public void test_sibling () {
    assert (FlatTree.sibling (0) == 2);
    assert (FlatTree.sibling (2) == 0);
    assert (FlatTree.sibling (5) == 1);
    assert (FlatTree.sibling (19) == 27);
}

public void test_spans () {
    uint[] spans = {};

    spans = FlatTree.spans (0);
    assert (spans[0] == 0);
    assert (spans[1] == 0);

    spans = FlatTree.spans (16);
    assert (spans[0] == 16);
    assert (spans[1] == 16);

    spans = FlatTree.spans (3);
    assert (spans[0] == 0);
    assert (spans[1] == 6);

    spans = FlatTree.spans (19);
    assert (spans[0] == 16);
    assert (spans[1] == 22);
}

int main () {
    test_children ();
    test_count ();
    test_depth ();
    test_full_roots ();
    test_index ();
    test_left_child ();
    test_left_span ();
    test_offset ();
    test_parent ();
    test_right_child ();
    test_right_span ();
    test_sibling ();
    test_spans ();

    return 0;
}
