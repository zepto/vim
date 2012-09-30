if exists("did_load_filetypes")
	finish
endif
"au BufNewFile,BufRead *.hs,*.lhs,*.chs set noexpandtab

au BufNewFile,BufRead *.asm,*.[sS],*.[aA],*.mac,*.lst	setfiletype asmx86
"au BufNewFile,BufRead *.asm,*.[sS],*.[aA],*.mac,*.lst	setfiletype gas
"au BufNewFile,BufRead *.asm,*.[sS],*.[aA],*.mac,*.lst	call Bif()
"func! Bif()
    "let b:asmsyntax="asmx86"
"endfunc
augroup filetypedetect
	au! BufRead,BufNewFile *.agh»·setfiletype argh
augroup END
augroup filetypedetect
	au! BufRead,BufNewFile *.boo setfiletype boo
augroup END
augroup filetypedetect
	au! BufRead,BufNewFile *.gs setfiletype genie
augroup END
augroup filetypedetect
    au! BufRead,BufNewFile *.rs setfiletype rust
augroup END
