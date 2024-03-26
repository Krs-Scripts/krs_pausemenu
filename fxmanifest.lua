
fx_version "cerulean"
game "gta5"
lua54 "yes"


name 'krs_pausamenu'
author 'Karos#7804'


client_scripts {
    
    'client/*.lua'
 
}

server_scripts {

    'server/*.lua'
}

shared_scripts {

    '@es_extended/imports.lua',
	'@ox_lib/init.lua',
    -- 'config.lua'
}

ui_page 'ui/index.html'

files {
    'ui/index.html',
    'ui/script.js',
    'ui/style.css',
    'ui/sfondo.png', 
    'ui/sfondo2.png', 

}
