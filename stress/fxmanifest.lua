fx_version 'adamant'

game 'gta5'
lua54 'yes'
shared_scripts {
	'@ox_lib/init.lua',
	'@es_extended/imports.lua'
}
description 'Bleeding a Stress System by drunkmode by dyny'

client_scripts {
	'bleeding.lua',
	'stress.lua',
	'functions.lua'
}

server_scripts {
	'server.lua'
}

exports {
	'BleedingOff'
}