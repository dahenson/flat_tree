
public void test_depth () {
    assert (FlatTree.depth (0) == 0);
    assert (FlatTree.depth (6) == 0);
    assert (FlatTree.depth (1) == 1);
    assert (FlatTree.depth (5) == 1);
    assert (FlatTree.depth (15) == 4);
    assert (FlatTree.depth (23) == 3);
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

public void test_offset () {
    assert (FlatTree.offset (0) == 0);
    assert (FlatTree.offset (10) == 5);
    assert (FlatTree.offset (19) == 2);
    assert (FlatTree.offset (21) == 5);
}

int main () {
    test_depth ();
    test_index ();
    test_offset ();

    return 0;
}
