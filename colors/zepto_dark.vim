" File: zepto_dark.vim
" Author: Josiah Gordon
" Description: A dark 16 color colorscheme for gui and terminal vim.
" Last Modified: January 16, 2013
"
" Console to gui color table: {{{
" Black:
"       Darkgray:    #6c6c6c
"       Black:       #3d3d3d
" Red:
"       DarkRed:     #DE6951
"       Red:         #c56a47
" Green:
"       DarkGreen:   #bcda55
"       Green:       #9dbf60
" Yellow:
"       DarkYellow:  #E2A564
"       Yellow:      #EC8A25
" Blue:
"       DarkBlue:    #2187F6
"       Blue:        #5495DC
"       LightBlue:   #5FD5FC
" Magenta:
"       DarkMagenta: #875C8D
"       Magenta:     #E41F66
" Cyan:
"       DarkCyan:    #4390B1
"       Cyan:        #276CC2
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
hi SpecialKey ctermfg=lightblue ctermbg=NONE guifg=#5FD5FC guibg=#3d3d3d
hi NonText ctermfg=NONE ctermbg=NONE guifg=#d2d2d2 guibg=#3d3d3d
hi Directory cterm=BOLD ctermfg=darkblue ctermbg=NONE gui=BOLD guifg=#2187F6 guibg=#3d3d3d
hi ErrorMsg cterm=NONE ctermfg=white ctermbg=red gui=BOLD guifg=#FFFFFF guibg=#c56a47

hi IncSearch cterm=NONE ctermfg=white ctermbg=grey gui=BOLD guifg=#FFFFFF guibg=#d2d2d2
hi Search cterm=BOLD ctermfg=white ctermbg=cyan gui=underline guifg=NONE guibg=NONE

hi MoreMsg ctermfg=green ctermbg=NONE guifg=#9dbf60 guibg=#3d3d3d
hi ModeMsg cterm=BOLD ctermfg=darkblue ctermbg=NONE gui=BOLD guifg=#2187F6 guibg=#3d3d3d
hi LineNr cterm=NONE ctermfg=darkgrey ctermbg=NONE gui=NONE guifg=#6C6C6C guibg=#3d3d3d
hi Question ctermfg=darkgreen ctermbg=NONE guifg=#bcda55 guibg=#3d3d3d

hi StatusLine cterm=BOLD ctermfg=white ctermbg=darkcyan gui=BOLD guifg=#ffffff guibg=#4390B1
hi StatusLineNC cterm=BOLD ctermfg=grey ctermbg=black gui=BOLD guifg=#d2d2d2 guibg=#3d3d3d

hi VertSplit ctermfg=darkgrey ctermbg=grey guifg=#6C6C6C guibg=#d2d2d2
hi Title ctermfg=blue ctermbg=NONE guifg=#5494DC guibg=#3d3d3d

hi Visual cterm=NONE ctermfg=white ctermbg=green guifg=#FFFFFF guibg=#9dbf60
hi WarningMsg cterm=BOLD ctermfg=darkyellow ctermbg=NONE gui=BOLD guifg=#E2A564 guibg=#3d3d3d

hi Folded ctermfg=lightgrey ctermbg=NONE guifg=#d2d2d2 guibg=NONE
hi FoldColumn cterm=NONE ctermfg=green ctermbg=NONE gui=NONE guifg=#9dbf60 guibg=#3d3d3d

hi DiffAdd ctermfg=white ctermbg=blue guifg=#FFFFFF guibg=#5495DC
hi DiffChange ctermfg=white ctermbg=magenta guifg=#FFFFFF guibg=#E41F66
hi DiffDelete ctermfg=white ctermbg=yellow guifg=#FFFFFF guibg=#EC8A25
hi DiffText ctermfg=white ctermbg=red guifg=#FFFFFF guibg=#c56a47

hi SignColumn cterm=NONE ctermfg=red  ctermbg=NONE gui=NONE guifg=#c56a47 guibg=#3d3d3d

hi SpellBad ctermfg=white ctermbg=red guifg=#FFFFFF guibg=#c56a47
hi SpellCap ctermfg=white ctermbg=blue guifg=#FFFFFF guibg=#5495dc
hi SpellRare ctermfg=white ctermbg=magenta guifg=#FFFFFF guibg=#E41F66
hi SpellLocal ctermfg=white ctermbg=cyan guifg=#FFFFFF guibg=#276CC2

" Vim 700 colors.
if version >= 700
    hi Pmenu ctermfg=darkgrey ctermbg=NONE guifg=#6C6C6C guibg=#3d3d3d
    hi PmenuSel ctermfg=white ctermbg=green guifg=#FFFFFF guibg=#9dbf60
    hi PmenuSbar ctermfg=NONE ctermbg=NONE guifg=#3d3d3d guibg=#3d3d3d
    hi PmenuThumb ctermfg=grey ctermbg=NONE guifg=#d2d2d2 guibg=#3d3d3d

    hi CursorColumn cterm=BOLD ctermfg=NONE ctermbg=NONE gui=BOLD
    hi CursorLine cterm=BOLD ctermfg=NONE ctermbg=NONE gui=BOLD
    hi ColorColumn ctermfg=NONE ctermbg=cyan guifg=NONE guibg=#276CC2
endif

hi TabLine cterm=NONE ctermfg=white ctermbg=grey gui=NONE guifg=#ffffff guibg=#d2d2d2
hi TabLineSel cterm=BOLD ctermfg=white ctermbg=NONE gui=BOLD guifg=#ffffff guibg=NONE
hi TabLineFill cterm=NONE ctermfg=NONE ctermbg=grey gui=NONE guibg=#d2d2d2

hi MatchParen cterm=NONE ctermfg=white ctermbg=darkcyan gui=NONE guifg=#ffffff guibg=#276CC2
hi Normal ctermfg=NONE ctermbg=NONE guifg=#d2d2d2 guibg=#3d3d3d
" }}}

" Syntax highlighting."{{{
hi Comment     cterm=NONE ctermfg=darkgrey   gui=italic   guifg=#6C6C6C
hi Constant    cterm=NONE ctermfg=cyan       ctermbg=NONE guifg=#276CC2
hi Special     cterm=NONE ctermfg=white      ctermbg=NONE guifg=#FFFFFF
hi Identifier  cterm=NONE ctermfg=cyan       ctermbg=NONE guifg=#276CC2
hi Statement   cterm=NONE ctermfg=lightblue  ctermbg=NONE guifg=#5FD5FC
hi PreProc     cterm=NONE ctermfg=blue       ctermbg=NONE guifg=#5495DC
hi Type        cterm=NONE ctermfg=yellow     ctermbg=NONE guifg=#EC8A25
hi String      cterm=NONE ctermfg=green      ctermbg=NONE guifg=#9dbf60
hi Number      cterm=NONE ctermfg=magenta    ctermbg=NONE guifg=#E41F66
hi Function    cterm=NONE ctermfg=darkyellow ctermbg=NONE guifg=#E2A564
hi Conditional cterm=NONE ctermfg=blue       ctermbg=NONE guifg=#5495DC
hi Operator    cterm=NONE ctermfg=white      ctermbg=NONE guifg=#FFFFFF
hi Keyword     cterm=NONE ctermfg=blue       ctermbg=NONE guifg=#5495DC
hi Delimiter   cterm=NONE ctermfg=cyan       ctermbg=NONE guifg=#276CC2
" }}}

" Plugin colors."{{{
hi EasyMotionTarget ctermfg=green ctermbg=none guifg=#9dbf60 guibg=#3d3d3d
hi EasyMotionShade ctermfg=darkgrey ctermbg=none guifg=#6c6c6c guibg=#3d3d3d

hi IndentGuidesOdd ctermbg=yellow guifg=#EC8A25
hi IndentGuidesEven ctermbg=green guifg=#9dbf60
" }}}
