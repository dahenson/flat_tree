project(
    'flat_tree',
    'vala', 'c',
    version: '0.1'
)

dependencies = [
  dependency('glib-2.0'),
  dependency('gobject-2.0')
]

source = files([
    'lib/FlatTree.vala',
    'lib/FlatTreeIterator.vala'
])

flat_tree_lib = library('flat_tree_lib', source, dependencies: dependencies)

# Build Tests
test_sources = files('test/FlatTreeTest.vala')
test_exe = executable('test_flat_tree_lib', test_sources, dependencies: dependencies, link_with: flat_tree_lib)
test('test_flat_tree_lib', test_exe)

test_sources = files('test/FlatTreeIteratorTest.vala')
test_iterator_exe = executable('test_flat_tree_iterator_lib', test_sources, dependencies: dependencies, link_with: flat_tree_lib)
test('test_flat_tree_iterator_lib', test_iterator_exe)

# Build The Docs
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
