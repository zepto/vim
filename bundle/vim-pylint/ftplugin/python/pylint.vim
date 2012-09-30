" Vim compiler file for Python
" Plugin:     Style checking tool for Python
" Maintainer:   Oleksandr Tymoshenko <gonzo@univ.kiev.ua>
" Last Change:  2012 February 06
" Version:      0.7 
" Contributors:
"     Artur Wroblewski
"     Menno
"     Jose Blanca
"     Sasha Hart
"     Josiah Gordon
"
" Installation:
"   Drop pylint.vim in ~/.vim/ftplugin/python directory. Ensure that your PATH
"   environment variable includes the path to 'pylint' executable.
"
" Usage:
"   Pylint is called after a buffer with Python code is saved. QuickFix
"   window is opened to show errors, warnings and hints provided by Pylint.
"   Code rate calculated by Pylint is displayed at the bottom of the
"   window.
"
"   Above is realized with :Pylint command. To disable calling Pylint every
"   time a buffer is saved put into .vimrc file
"
"       let g:pylint_onwrite = 0
"
"   Displaying code rate calculated by Pylint can be avoided by setting
"
"       let g:pylint_show_rate = 0
"
"   Openning of QuickFix window can be disabled with
"
"       let g:pylint_cwindow = 0
"
"   Setting signs for the lines with errors can be disabled with
"
"	let g:pylint_signs = 0
"
"   Show pylint error numbers with
"
"       let g:pylint_error_numbers = 1
"
"   Of course, the standard :make command can be used as in case of every
"   other compiler (but you get the signs with :Pylint).
"

if exists('current_compiler')
  finish
endif
let current_compiler = 'pylint'

if !exists('g:pylint_command')
    let g:pylint_command = 'pylint'
endif


if !exists('g:pylint_onwrite')
    let g:pylint_onwrite = 1
endif

if !exists('g:pylint_show_rate')
    let g:pylint_show_rate = 1
endif

if !exists('g:pylint_cwindow')
    let g:pylint_cwindow = 1
endif

if !has("signs")
    echoerr "This version of vim was not compiled with +signs, so pylint won't show any marks in the margin"
    let g:pylint_signs = 0
elseif !exists('g:pylint_signs')
    let g:pylint_signs = 1
endif

if !exists('g:pylint_error_numbers')
    let g:pylint_error_numbers = 0
endif

if exists(':Pylint') != 2
    command Pylint :call Pylint(0)
endif

fun BuildMakePrg()
    " 1. allow user to choose whether they see the (mangled) error numbers or not
    " 2. vim only recognizes error, warning, and info; other things are rendered as
    "    single characters, which is inconsistent with spelling out 'error',
    "    'warning', 'info'. so until vim's quickfix acts more consistently,
    "    convert refactor/convention violations to warnings, and 'fatal' to
    "    'error'.
    if g:pylint_error_numbers == 1
        let s:makeprg = g:pylint_command . ' -f parseable -r n -i y ' .
                    \ shellescape(expand('%')) .
                    \ '\| sed ''s_: \[[RC]_: \[W_''' .
                    \ '\| sed ''s_: \[[F]_:\ \[E_'''
    else
        let s:makeprg = g:pylint_command . ' -f parseable -r n ' .
                    \ shellescape(expand('%')) .
                    \ '\| sed ''s_: \[[RC]_: \[W_''' .
                    \ '\| sed ''s_: \[[F]_:\ \[E_'''
    endif

    let s:errorformat = '%f:%l: [%t%n%.%#] %m,%f:%l: [%t%.%#] %m,%Z,%-GNo config%m'
endfun

"signs definition
if has("signs")
    " vim only supports 3 error types in quickfix, so everything is shoehorned
    " into those types - but it's not a huge stretch.
    " Info: random stuff pylint wants to tell you
    " (Pylint examples: I0001 I0010 I0011 I0012 I0013)
    sign define I text=i texthl=SignColumn
    " Warning: stylistic problems, minor programming issues
    " (C/R/W errors in Pylint)
    sign define W text=W texthl=SignColumn 
    " Error: likely bug, fatal parse error, etc.
    sign define E text=E texthl=SignColumn linehl=Error
endif

if g:pylint_onwrite
    augroup python
        au!
        au BufWritePost * call Pylint(1)
    augroup end
endif

function! Pylint(writing)
    " Make sure we have a buffer name.
    if empty(bufname('')) && empty(bufname(bufnr('')))
        return
    else
        let l:bufname=bufname(bufnr(''))
    endif

    call BuildMakePrg()

    if !a:writing && &modified
        " Save before running
        write
    endif	

    if has('win32') || has('win16') || has('win95') || has('win64')
        setlocal sp=>%s
    else
        setlocal sp=>%s\ 2>&1
    endif

    " Save the original values for resetting later.
    let s:old_makeprg = &makeprg
    let s:old_errorformat = &errorformat

    " Set the make program and error format.
    let &makeprg = s:makeprg
    let &errorformat = s:errorformat

    " If check is executed by buffer write - do not jump to first error
    if !a:writing
        silent make
    else
        silent make!
    endif
    
    set lazyredraw

    " Set the makeprg and errorformat variables back to there original values.
    let &makeprg = s:old_makeprg
    let &errorformat = s:old_errorformat

    " Get the error list.
    let errors = getqflist()
    let has_results = errors != []

    if g:pylint_signs
        call <SID>PlacePylintSigns(errors)
    endif

    " Display the quickfix window with a list of errors and warnings.
    if has_results
        execute 'belowright copen'
        setlocal wrap
        "nnoremap <buffer> <silent> c :cclose<CR> :sign unplace *<CR>
        nnoremap <buffer> <silent> q :cclose<CR>
    endif

    " Force redraw the screen.
    set nolazyredraw
    redraw!

    call <SID>PylintEvaluation(errors)

    if g:pylint_show_rate
        echon 'code rate: ' b:pylint_rate ', prev: ' b:pylint_prev_rate
    endif

    " Show pylint passed message if there were no results.
    if has_results == 0
        hi Green ctermfg=green
        echohl Green
        echon " Pylint PASSED"
        echohl
    endif
endfunction

function! s:PylintEvaluation(errors)
    let l:list = a:errors
    let b:pylint_rate = '0.00'
    let b:pylint_prev_rate = '0.00'
    for l:item in l:list
        if l:item.type == 'I' && l:item.text =~ 'Your code has been rated'
            let l:re_rate = '\(-\?[0-9]\{1,2\}\.[0-9]\{2\}\)/'
            let b:pylint_rate = substitute(l:item.text, '.*rated at '.l:re_rate.'.*', '\1', 'g')
            " Only if there is information about previous run
            if l:item.text =~ 'previous run: '
                let b:pylint_prev_rate = substitute(l:item.text, '.*previous run: '.l:re_rate.'.*', '\1', 'g')
            endif    
        endif
    endfor
endfunction

function! s:PlacePylintSigns(errors)
    "in which buffer are we?
    "in theory let l:buffr=bufname(l:item.bufnr)
    "should work inside the next loop, but i haven't manage to do it
    let l:buffr = bufname('')
    "the previous lines are suppose to work, but sometimes it doesn't
    if empty(l:buffr)
        let l:buffr=bufname(bufnr(''))
    endif

    "first remove all signs
    exec('sign unplace *')
    "now we place one sign for every quickfix line
    let l:list = a:errors
    let l:id = 1
    for l:item in l:list
        "the line signs
        let l:lnum=item.lnum
        let l:type=item.type
        "sign place 1 line=l:lnum name=pylint file=l:buffr
        "if l:type != 'I' && l:type != ''
        if l:type != ''
            "let l:exec = printf('sign place %d name=%s line=%d file=%s',
                                "\ l:id, l:type, l:lnum, l:buffr)
            exec "sign place ". l:id ." line=". l:lnum ." name=". l:type ." file=". l:buffr
            let l:id = l:id + 1
            "execute l:exec
        endif
    endfor
endfunction

