
-- game / build information
use_experimental_fxv2_oal 'yes'
fx_version 'cerulean' lua54 'yes' game 'gta5'

-- resource information
repository 'https://github.com/Agimir/mi_tmp'
description 'template script for mesa indigo resources'
author 'Agimir'
name 'mi_tmp'
version '0.0.0'
license 'LGPL-3.0-or-later'

-- shared files
shared_scripts {
    'source/shared/*.lua',
    'data/*.lua',
    'source/init.lua',
}

-- client files
client_scripts {
    'bridge/client/*.lua',
    'source/client/*.lua'
}

-- server files
server_scripts {
    'bridge/server/*.lua',
    'source/server/*.lua'
}

ui_page 'web/source/index.html'

-- resource files
files {
    'source/init.lua',
    'web/source/index.html',
    'web/**/*',
    'web/**/**diagnostic/*',
    'locales/*.json'
}