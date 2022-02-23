project('com.github.KaltWulx.ideapadconfigtool', ['c', 'vala'],
          version: '0.1.0',
    meson_version: '>= 0.50.0',
  default_options: [ 'warning_level=2',
                   ],
)
# Include the translations module
i18n = import('i18n')

# Set our translation domain
add_global_arguments('-DGETTEXT_PACKAGE="@0@"'.format (meson.project_name()), language:'c')

dependencies = [
	dependency('gtk+-3.0'),
	dependency('glib-2.0'),
	dependency('gobject-2.0'),
	dependency('granite'),
	]

sources = files(
	'src/Main.vala',
	#View
	'src/view/WidgetIdeaPadMode.vala',
	'src/view/UIMainIdeaPadConfigTool.vala',
	#Model
	'src/model/BatteryConservative.vala',
	'src/model/FnLock.vala',
	'src/model/USBCharging.vala',
		#Interfaces
		'src/model/interfaces/IdeaPadMode.vala',
		#Utils
		'src/model/utils/IdeaPadUtils.vala',
		'src/model/utils/Notification.vala',
	#Controller
	'src/controller/BatteryConservative.vala',
	'src/controller/FnLock.vala',
	'src/controller/USBCharging.vala',
)



#Translate and install our .desktop file
i18n.merge_file(
    input: join_paths('data', 'ideapadconfigtool.desktop.in'),
    output: meson.project_name() + '.desktop',
    po_dir: join_paths(meson.source_root(), 'po'),
    type: 'desktop',
    install: true,
    install_dir: join_paths(get_option('datadir'), 'applications')
)

#Translate and install our .appdata file
i18n.merge_file(
    input: join_paths('data', 'ideapadconfigtool.appdata.xml.in'),
    output: meson.project_name() + '.appdata.xml',
    po_dir: join_paths(meson.source_root(), 'po'),
    install: true,
    install_dir: join_paths(get_option('datadir'), 'metainfo')
)


subdir('po')

executable(
	meson.project_name(),
	sources,
	dependencies: dependencies, install:true
)
