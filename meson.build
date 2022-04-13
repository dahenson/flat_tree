project(
    'flat_tree',
    'vala', 'c',
    version: '0.1.0'
)

glib    = dependency('glib-2.0')
gobject = dependency('gobject-2.0')

lib_source = files([
    'lib/FlatTree.vala',
    'lib/FlatTreeIterator.vala'
])

flat_tree_lib = library(
    'flat_tree_lib',
    lib_source,
    dependencies: [glib, gobject]
)

#########
# TESTS #
#########

test_flat_tree_exe = executable(
    'test_flat_tree_lib',
    files('test/FlatTreeTest.vala'),
    dependencies: [glib, gobject],
    link_with: flat_tree_lib
)


test_flat_tree_iterator_exe = executable(
    'test_flat_tree_iterator_lib',
    files('test/FlatTreeIteratorTest.vala'),
    dependencies: [glib, gobject],
    link_with: flat_tree_lib
)

test('test_flat_tree_lib', test_flat_tree_exe)
test('test_flat_tree_iterator_lib', test_flat_tree_iterator_exe)

###########
# VALADOC #
###########

valadoc_outdir = meson.current_build_dir() + '/valadoc'
valadoc_indir = meson.current_source_dir() + '/lib/*.vala'

run_target('valadoc',
    command: [
        'meson/build_valadoc.sh',
        '-i', valadoc_indir,
        '-o', valadoc_outdir,
        '-n', meson.project_name(),
        '-v', meson.project_version()
    ]
)
