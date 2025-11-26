fx_version 'adamant'
game 'gta5'

name 'sx-changesit'
version '0.2.1'
description 'Sacha | Development - Full core'
author 'sacha-development'
lua54 'yes'

shared_scripts {
	'config/sh_*.lua',
	'utils/sh_*.lua',
	'translation/*.lua',
	'modules/**/sh_*.lua'
}

client_scripts {
	'config/cl_*.lua',
	'utils/cl_*.lua',
	'modules/**/cl_*.lua'
}