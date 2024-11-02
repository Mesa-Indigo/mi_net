use_experimental_fxv2_oal 'yes'
fx_version 'cerulean'
lua54 'yes'
game 'gta5'

name 'mi_lib'
author 'Mesa-Indigo'
version '0.0.0'
repository 'https://github.com/Mesa-Indigo/mi_lib'
description 'Library resource for external HTML scripts'

files {
    'source/**/*.lua',
}

ui_page 'web/dist/index.html'

shared_scripts {
    '@ox_lib/init.lua',
    'source/shared/*.lua',
    'init.lua',
}

client_scripts {
    'source/client/*.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'source/server/*.lua',
}