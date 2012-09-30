" This is a vim script to load and setup python related plugins.

" Only do this when not done yet for this buffer
if exists("b:did_python_setup_ftplugin")
  finish
endif
let b:did_python_setup_ftplugin = 1

"runtime ftplugin/python_calltips.vim

" Python Fold setup"{{{
"autocmd FileType python setlocal foldopen=all
autocmd FileType python setlocal foldclose=all
autocmd FileType python setlocal foldmethod=indent
autocmd FileType python setlocal foldlevel=2000
autocmd FileType python setlocal foldcolumn=4
"}}}

" Add python paths for completion."{{{
autocmd FileType python setlocal path+=/usr/lib/python3.2
autocmd FileType python setlocal path+=/usr/lib/python3.2/site-packages
autocmd FileType python setlocal path+=/usr/lib/python2.7
autocmd FileType python setlocal path+=/usr/lib/python2.7/site-packages
"}}}

" Python vim-rope setup"{{{
fun! s:LoadRope()
    " Turn on and setup the ropevim plugin.
    setlocal rtp+=~/.vim/python_bundle/ropevim
    runtime ftplugin/python/ropevim.vim
    map <buffer> <localleader>j :RopeGotoDefinition<CR>
    map <buffer> <localleader>r :RopeRename<CR>
endfun

map <buffer> <localleader>rv :call <SID>LoadRope()<CR>
"}}}

" Add the virtualenv's site-packages to vim path"{{{
"py << EOF
"import os.path
"import sys
"import vim
"if 'VIRTUAL_ENV' in os.environ:
    "project_base_dir = os.environ['VIRTUAL_ENV']
    "sys.path.insert(0, project_base_dir)
    "activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    "execfile(activate_this, dict(__file__=activate_this))
"EOF
"}}}
