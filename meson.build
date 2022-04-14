project(
    'flat-tree',
    'vala', 'c',
    version: '0.1.0'
)

glib    = dependency('glib-2.0')
gobject = dependency('gobject-2.0')

subdir('lib')
subdir('test')

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
