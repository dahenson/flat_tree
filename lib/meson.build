lib_directory = include_directories(['.'])

lib_source = files([
    'FlatTree.vala',
    'FlatTreeIterator.vala'
])

flat_tree = library(
    'flat-tree',
    lib_source,
    dependencies: [glib, gobject]
)

