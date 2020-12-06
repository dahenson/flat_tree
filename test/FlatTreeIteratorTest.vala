
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
    FlatTree.Iterator iter = new FlatTree.Iterator.at_index (1);
    assert (iter.parent () == 3);
    assert (iter.parent () == 7);
    assert (iter.right_child () == 11);
    assert (iter.left_child () == 9);
    assert (iter.next () == 13);
    assert (iter.left_span () == 12);
}

public void test_iterator_seek () {
    FlatTree.Iterator iter = new FlatTree.Iterator ();
    assert (iter.index == 0);

    iter.seek (3);
    assert (iter.index == 3);
    assert (iter.factor == 8);
    assert (iter.offset == 0);

    iter.seek (12);
    assert (iter.index == 12);
    assert (iter.factor == 2);
    assert (iter.offset == 6);
}

public void test_iterator_is_right () {
    FlatTree.Iterator iter = new FlatTree.Iterator ();
    assert (iter.is_right () == false);

    iter.seek (2);
    assert (iter.is_right () == true);

    iter.seek (7);
    assert (iter.is_right () == false);
}

public void test_iterator_is_left () {
    FlatTree.Iterator iter = new FlatTree.Iterator ();
    assert (iter.is_left () == true);

    iter.seek (6);
    assert (iter.is_left () == false);

    iter.seek (3);
    assert (iter.is_left () == true);
}

int main () {
    test_iterator ();
    test_iterator_non_leaf_start ();
    test_iterator_seek ();
    test_iterator_is_right ();
    test_iterator_is_left ();

    return 0;
}
