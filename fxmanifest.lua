fx_version "cerulean"


author "CanX"
version '1.0.0'


lua54 'yes'

games {
    "gta5",
}

ui_page 'web/index.html'


client_script {
    "client/**/*",
    'locales/*.lua',
}

files {
    'web/index.html',
    'web/**/*',
}


