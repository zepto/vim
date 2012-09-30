if (&filetype == "python")
    noremap <silent><buffer><F6> :pyfile $HOME/.vim/python/pyrun.py<CR>:<CR>
    inoremap <silent><buffer><F6> <ESC>:pyfile $HOME/.vim/python/pyrun.py<CR>a
endif

