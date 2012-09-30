" AUTHOR:     Maksim Ryzhikov
" Maintainer: Josiah Gordon <josiahg@gmail.com
" VERSION:    1.0.0
" Modified version of google translater by Maksim Ryshikov.
" It translates from japanese to english using parts from mattn's excite
" translator and Maksim's goog translator.

let s:goog_conf = { 
            \ 'langpair' : 'jp|en', 
            \ 'cmd' : 'lua',
            \ 'charset' : 'utf-8',
            \ }

"set root script path
let s:root_path = expand("<sfile>:p:h")

"global translator function
"@return String
function! GoogTranslate(...)
  "define variable
  let s:query = a:000
  let outp = ""

  "call sub translator
  let outp = s:_googLuaTranslate(s:query)

  return outp
endfunction

"sub translator is implemented on lua
"@return String
function! s:_googLuaTranslate(query)
    if !has('lua') | return 0 | endif

    silent! exec "luafile " . s:root_path . "/goog-translator.lua"
    return s:outp
endfunction

fun! GoogTransBlock()
    let strline = ''
    for curline in getline(0, '$')
        let strline = GoogTranslate(curline)
        let jstr = strline
        " Open or go result buffer.
        let bufname = '==Translate== Google'
        let winnr = bufwinnr(bufname)
        if winnr < 1
          execute 'below new '.escape(bufname, ' ')
        else
          if winnr != winnr()
        execute winnr.'wincmd w'
          endif
        endif
        setlocal buftype=nofile bufhidden=hide noswapfile wrap ft=
        " Append translated string.
        if line('$') == 1 && getline('$').'X' ==# 'X'
          call setline(1, split(jstr, "\n"))
        else
          call append(line('$'), split(jstr, "\n"))
        endif
        normal! Gzt
    endfor
endfun

function! ExciteTranslateBuffer() range
    " Concatenate input string.
    let jstr = ''
    for curline in range(a:firstline, a:lastline)
      let strline = substitute(getline(curline), '^\s\+\|\s\+$', '', 'g')
      " Do translate.
      let jstr = jstr . ' ' . ExciteTranslate(strline)
    endfor
    " Put to buffer.
    " Open or go result buffer.
    let bufname = '==Translate== Excite'
    let winnr = bufwinnr(bufname)
    if winnr < 1
        execute 'below new '.escape(bufname, ' ')
    else
        if winnr != winnr()
    execute winnr.'wincmd w'
        endif
    endif
    setlocal buftype=nofile bufhidden=hide noswapfile wrap ft=
    " Append translated string.
    if line('$') == 1 && getline('$').'X' ==# 'X'
        call setline(1, split(jstr, "\n"))
    else
        call append(line('$'), '--------')
        call append(line('$'), split(jstr, "\n"))
    endif
    normal! Gzt
endfunction

command! -nargs=0 -range ExciteTranslateA <line1>,<line2>call ExciteTranslateBuffer()
