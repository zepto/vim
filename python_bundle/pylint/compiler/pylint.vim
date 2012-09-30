" Vim compiler file for Python
" Compiler:     Style checking tool for Python
" Maintainer:   Oleksandr Tymoshenko <gonzo@univ.kiev.ua>
" Last Change:  2010 april 29
" Version:      0.6 
" Contributors:
"     Artur Wroblewski
"     Menno
"     Jose Blanca
"     Sasha Hart
"
" Installation:
"   Drop pylint.vim in ~/.vim/compiler directory. Ensure that your PATH
"   environment variable includes the path to 'pylint' executable.
"
"   Add the following line to the autocmd section of .vimrc
"
"      autocmd FileType python compiler pylint
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

if exists(":CompilerSet") != 2          " older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

" 1. allow user to choose whether they see the (mangled) error numbers or not
" 2. vim only recognizes error, warning, and info; other things are rendered as
"    single characters, which is inconsistent with spelling out 'error',
"    'warning', 'info'. so until vim's quickfix acts more consistently,
"    convert refactor/convention violations to warnings, and 'fatal' to
"    'error'.
if g:pylint_error_numbers == 1
    CompilerSet makeprg=(pylint3\ -f\ parseable\ -r\ n\ -i\ y\ %\ 
                \\\\|\ sed\ 's_:\ \\[[RC]_:\ \\[W_' 
                \\\\|\ sed\ 's_:\ \\[[F]_:\ \\[E_')
else
    CompilerSet makeprg=(pylint3\ -f\ parseable\ -r\ n\ %\ 
                \\\\|\ sed\ 's_:\ \\[[RC]_:\ \\[W_'
                \\\\|\ sed\ 's_:\ \\[[F]_:\ \\[E_')
endif

CompilerSet efm=%f:%l:\ \[%t%n%.%#\]\ %m,%f:%l:\ \[%t%.%#\]\ %m,%Z,%-GNo\ config%m

"signs definition
if has("signs")
    " vim only supports 3 error types in quickfix, so everything is shoehorned
    " into those types - but it's not a huge stretch.
    " Info: random stuff pylint wants to tell you
    " (Pylint examples: I0001 I0010 I0011 I0012 I0013)
    sign define I text=ℹ texthl=SignColumn
    " Warning: stylistic problems, minor programming issues
    " (C/R/W errors in Pylint)
    sign define W text=☹ texthl=SignColumn 
    " Error: likely bug, fatal parse error, etc.
    sign define E text=⚠ texthl=SignColumn linehl=Error
endif

if g:pylint_onwrite
    augroup python
        au!
        au BufWritePost * call Pylint(1)
    augroup end
endif

function! Pylint(writing)
    if !a:writing && &modified
        " Save before running
        write
    endif	

    if has('win32') || has('win16') || has('win95') || has('win64')
        setlocal sp=>%s
    else
        setlocal sp=>%s\ 2>&1
    endif

    " If check is executed by buffer write - do not jump to first error
    if !a:writing
        silent make
    else
        silent make!
    endif

    if g:pylint_cwindow
        cwindow
    endif

    call PylintEvaluation()

    if g:pylint_show_rate
        echon 'code rate: ' b:pylint_rate ', prev: ' b:pylint_prev_rate
    endif

    if g:pylint_signs
        call PlacePylintSigns()
    endif
endfunction

function! PylintEvaluation()
    let l:list = getqflist()
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

function! PlacePylintSigns()
    "in which buffer are we?
    "in theory let l:buffr=bufname(l:item.bufnr)
    "should work inside the next loop, but i haven't manage to do it
    let l:buffr = bufname('%')
    "the previous lines are suppose to work, but sometimes it doesn't
    if empty(l:buffr)
        let l:buffr=bufname(1)
    endif

    "first remove all signs
    exec('sign unplace *')
    "now we place one sign for every quickfix line
    let l:list = getqflist()
    let l:id = 1
    for l:item in l:list
	"the line signs
	let l:lnum=item.lnum
	let l:type=item.type
	"sign place 1 line=l:lnum name=pylint file=l:buffr
	"if l:type != 'I' && l:type != ''
	if l:type != ''
	    let l:exec = printf('sign place %d name=%s line=%d file=%s',
	                        \ l:id, l:type, l:lnum, l:buffr)
	    let l:id = l:id + 1
	    execute l:exec
	endif
    endfor
endfunction

