" File: zepto_dark.vim
" Author: Josiah Gordon
" Description: A dark 16 color colorscheme for gui and terminal vim.
"
" Console to gui color table: {{{
" Black:
"       Darkgray:    #6c6c6c
"       Black:       #2b2b2b
" Red:
"       DarkRed:     #DE6951
"       Red:         #ee8870
" Green:
"       DarkGreen:   #9dbf60
"       Green:       #bcda55
" Yellow:
"       DarkYellow:  #E2A564
"       Yellow:      #f2c585
" Blue:
"       DarkBlue:    #223344
"       Blue:        #2187F6
"       LightBlue:   #5FD5FC
" Magenta:
"       DarkMagenta: #a85cae
"       Magenta:     #E41F66
" Cyan:
"       DarkCyan:    #4390B1
"       Cyan:        #66cebe
" White:
"       Grey:        #d2d2d2
"       White:       #ffffff
" }}}

" Initialize." {{{
set background=dark
hi clear

if exists("syntax_on")
    syntax reset
endif

let colors_name = "zepto_dark"
" }}}

" Standard colors."{{{
hi SpecialKey ctermfg=darkgrey ctermbg=NONE guifg=#6c6c6c guibg=#2b2b2b
hi NonText ctermfg=darkgrey ctermbg=NONE guifg=#6c6c6c guibg=#2b2b2b
hi EndOfBuffer ctermfg=darkgrey ctermbg=NONE guifg=#6c6c6c guibg=#2b2b2b
hi Directory cterm=BOLD ctermfg=blue ctermbg=NONE gui=BOLD guifg=#2187F6 guibg=#2b2b2b
hi ErrorMsg cterm=NONE ctermfg=white ctermbg=red gui=BOLD guifg=#FFFFFF guibg=#ee8870

hi IncSearch cterm=NONE ctermfg=black ctermbg=grey gui=BOLD guifg=#2b2b2b guibg=#d2d2d2
hi Search cterm=BOLD ctermfg=white ctermbg=blue gui=underline guifg=#ffffff guibg=#2187F6

hi MoreMsg ctermfg=green ctermbg=NONE guifg=#bcda55 guibg=#2b2b2b
hi ModeMsg cterm=BOLD ctermfg=blue ctermbg=NONE gui=BOLD guifg=#2187F6 guibg=#2b2b2b
hi LineNr cterm=NONE ctermfg=darkgrey ctermbg=NONE gui=NONE guifg=#6c6c6c guibg=#2b2b2b
hi CursorLineNr cterm=BOLD ctermfg=grey ctermbg=NONE gui=NONE guifg=#d2d2d2 guibg=#2b2b2b
hi Question ctermfg=darkgreen ctermbg=NONE guifg=#9dbf60 guibg=#2b2b2b

hi StatusLine cterm=BOLD ctermfg=white ctermbg=darkcyan gui=BOLD guifg=#ffffff guibg=#4390B1
hi StatusLineNC cterm=BOLD ctermfg=grey ctermbg=darkblue gui=BOLD guifg=#d2d2d2 guibg=#223344
hi StatusLineTerm cterm=NONE ctermfg=white ctermbg=darkmagenta gui=BOLD guifg=#ffffff guibg=#a85cae
hi StatusLineTermNC cterm=NONE ctermfg=grey ctermbg=darkmagenta gui=BOLD guifg=#d2d2d2 guibg=#a85cae

hi VertSplit cterm=NONE ctermfg=grey ctermbg=NONE guifg=#d2d2d2 guibg=#d2d2d2
hi Title ctermfg=blue ctermbg=NONE guifg=#2187F6 guibg=#2b2b2b

hi Visual cterm=NONE ctermfg=darkblue ctermbg=green guifg=#223344 guibg=#bcda55
hi WarningMsg cterm=NONE ctermfg=darkyellow ctermbg=NONE gui=BOLD guifg=#E2A564 guibg=#2b2b2b

hi Folded ctermfg=darkgrey ctermbg=NONE guifg=#6c6c6c guibg=NONE
hi FoldColumn cterm=NONE ctermfg=green ctermbg=NONE gui=NONE guifg=#bcda55 guibg=#2b2b2b

hi DiffAdd ctermfg=white ctermbg=blue guifg=#FFFFFF guibg=#2187F6
hi DiffChange ctermfg=white ctermbg=darkmagenta guifg=#FFFFFF guibg=#a85cae
hi DiffDelete ctermfg=white ctermbg=yellow guifg=#FFFFFF guibg=#f2c585
hi DiffText ctermfg=white ctermbg=red guifg=#FFFFFF guibg=#ee8870

hi SignColumn cterm=NONE ctermfg=red  ctermbg=NONE gui=NONE guifg=#ee8870 guibg=#2b2b2b

hi SpellBad ctermfg=white ctermbg=red guifg=#FFFFFF guibg=#ee8870
hi SpellCap ctermfg=white ctermbg=blue guifg=#FFFFFF guibg=#2187F6
hi SpellRare ctermfg=white ctermbg=magenta guifg=#FFFFFF guibg=#E41F66
hi SpellLocal ctermfg=white ctermbg=darkmagenta guifg=#FFFFFF guibg=#a85cae

" Vim 700 colors.
if version >= 700
    hi Pmenu cterm=NONE ctermfg=grey ctermbg=darkblue guifg=#d2d2d2 guibg=#223344
    hi PmenuSel cterm=NONE ctermfg=white ctermbg=darkcyan guifg=#ffffff guibg=#4390B1
    hi PmenuSbar cterm=NONE ctermfg=grey ctermbg=darkblue guifg=#d2d2d2 guibg=#223344
    hi PmenuThumb cterm=NONE ctermfg=grey ctermbg=grey guifg=#d2d2d2 guibg=#2b2b2b

    hi CursorColumn cterm=BOLD ctermfg=NONE ctermbg=darkblue gui=BOLD guibg=#223344
    hi CursorLine cterm=BOLD ctermfg=NONE ctermbg=darkblue gui=BOLD guibg=#223344
    hi ColorColumn cterm=BOLD ctermfg=NONE ctermbg=darkcyan gui=BOLD guifg=NONE guibg=#4390B1
endif

hi TabLine cterm=NONE ctermfg=white ctermbg=grey gui=NONE guifg=#ffffff guibg=#d2d2d2
hi TabLineSel cterm=BOLD ctermfg=white ctermbg=NONE gui=BOLD guifg=#ffffff guibg=NONE
hi TabLineFill cterm=NONE ctermfg=NONE ctermbg=grey gui=NONE guibg=#d2d2d2

hi MatchParen cterm=NONE ctermfg=white ctermbg=darkcyan gui=NONE guifg=#ffffff guibg=#4390B1
hi Normal cterm=NONE ctermfg=NONE ctermbg=NONE guifg=#d2d2d2 guibg=#2b2b2b
" }}}

" Syntax highlighting."{{{
hi Comment     cterm=italic ctermfg=darkgrey gui=italic guifg=#6c6c6c
hi Constant    cterm=NONE ctermfg=darkcyan ctermbg=NONE guifg=#4390B1
hi Special     cterm=BOLD ctermfg=white ctermbg=NONE guifg=#FFFFFF
hi Identifier  cterm=NONE ctermfg=darkmagenta ctermbg=NONE guifg=#a85cae
hi Statement   cterm=NONE ctermfg=cyan ctermbg=NONE guifg=#66cebe
hi PreProc     cterm=NONE ctermfg=blue ctermbg=NONE guifg=#2187F6
hi Type        cterm=NONE ctermfg=yellow ctermbg=NONE guifg=#f2c585
hi String      cterm=NONE ctermfg=darkgreen ctermbg=NONE guifg=#9dbf60
hi Number      cterm=NONE ctermfg=magenta ctermbg=NONE guifg=#E41F66
hi Function    cterm=NONE ctermfg=darkyellow ctermbg=NONE guifg=#E2A564
hi Conditional cterm=NONE ctermfg=blue ctermbg=NONE guifg=#2187F6
hi Operator    cterm=NONE ctermfg=white ctermbg=NONE guifg=#FFFFFF
hi Keyword     cterm=NONE ctermfg=blue ctermbg=NONE guifg=#2187F6
hi Delimiter   cterm=NONE ctermfg=darkmagenta ctermbg=NONE guifg=#a85cae
" }}}
