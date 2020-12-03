
public void test_iterator () {
    FlatTree.Iterator iter = new FlatTree.Iterator ();
    assert (iter.index == 0);
    assert (iter.parent () == 1);
    assert (iter.parent () == 3);
    assert (iter.parent () == 7);
    assert (iter.right_child () == 11);
    assert (iter.left_child () == 9);
    assert (iter.next () == 13);
    assert (iter.left_span () == 12);
}

public void test_iterator_non_leaf_start () {
    FlatTree.Iterator iter = new FlatTree.Iterator.with_index (1);
    assert (iter.parent () == 3);
    assert (iter.parent () == 7);
    assert (iter.right_child () == 11);
    assert (iter.left_child () == 9);
    assert (iter.next () == 13);
    assert (iter.left_span () == 12);
}

int main () {
    test_iterator ();
    test_iterator_non_leaf_start ();

    return 0;
}