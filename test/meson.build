flat_tree_test = executable(
    'FlatTreeTest',
    files('FlatTreeTest.vala'),
    dependencies: [glib, gobject],
    link_with: flat_tree,
    include_directories: lib_directory
)


flat_tree_iterator_test = executable(
    'FlatTreeIteratorTest',
    files('FlatTreeIteratorTest.vala'),
    dependencies: [glib, gobject],
    link_with: flat_tree,
    include_directories: lib_directory
)

test('FlatTreeTest', flat_tree_test)
test('FlatTreeIteratorTest', flat_tree_iterator_test)
