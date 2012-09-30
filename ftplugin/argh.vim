" argh.vim filetype plugin for Argh!
"
" Copyright (C) 2004 by Thomas Arendsen Hein <thomas@intevation.de>
" This program is free software under the GNU GPL (>=v2)
"
" Description:
"
"   - Sets some variables (most important is virtualedit)
"   - Cursor stays on the entered character, except for commands changing
"     the flow control: hjklHJKL
"
" Installation:
"
"   Save this script as ~/.vim/ftplugin/argh.agh
"   Create (or modify) ~/.vim/filetype.vim:
"     if exists("did_load_filetypes")
"       finish
"     endif
"
"     augroup filetypedetect
"       au! BufRead,BufNewFile *.agh»·setfiletype argh
"     augroup END

setlocal sw=1 ts=8 sts=1 et ve=all

function! <SID>ArghKeyDo(key)
	if mode() ==# 'R'
		let move = ''
		if a:key =~? '[hjkl]'
			let move = tolower(a:key)
		endif
		return a:key."\<C-O>h".move
	else
		return a:key
	endif
endfunction

function! <SID>ArghKeyRemap(from, to)
	let key = a:from
	while (key <=# a:to)
		execute "inoremap <buffer> ".key." <C-R>=<SID>ArghKeyDo('".key."')<CR>"
		let key = nr2char(char2nr(key)+1)
	endwhile
endfunction

call <SID>ArghKeyRemap('a', 'z')
call <SID>ArghKeyRemap('A', 'Z')
call <SID>ArghKeyRemap('0', '9')

