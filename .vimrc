" File: .vimrc
" Author: Josiah Gordon
" Last Modified: October 20, 2012
" License:  The MIT License {{{
" Permission is hereby granted, free of charge, to any person obtaining a copy
" of this software and associated documentation files (the "Software"), to deal
" in the Software without restriction, including without limitation the rights
" to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
" copies of the Software, and to permit persons to whom the Software is
" furnished to do so, subject to the following conditions:
"
" The above copyright notice and this permission notice shall be included in
" all copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
" IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
" FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
" LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
" OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
" THE SOFTWARE.
" }}}

" Initialize."{{{
" Macros and other options that need to go first."{{{
" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Load shell menu for shellscripts
runtime! macros/shellmenu.vim

" Load extended matching with '%'
runtime! macros/matchit.vim
"}}}

" Set global variables"{{{

" Set leader
let maplocalleader = ";"
let mapleader = ","

" Make vim more posix compliant.
let g:is_posix=1

" End global variables"}}}

" Initial settings."{{{
" Encoding settings."{{{
set encoding=utf-8
set fileencoding=utf-8

" Reference: https://github.com/Shougo/config/blob/master/vimrc
if $ENV_ACCESS ==# 'linux'
    set termencoding=euc-jp
elseif $ENV_ACCESS ==# 'colinux'
    set termencoding=utf-8
else  " fallback
    set termencoding=  " same as 'encoding'
endif
set fileencodings=utf-8,iso-2022-jp-3,eucjp-ms,ucs-bom,cp932,default,latin1,cp1253
" }}}

" Fileformat settings."{{{
set fileformat=unix
" Detect other fileformats.
set fileformats=unix,dos,mac
" }}}
" }}}
" }}}

" Load plugins."{{{

" Initialize the plugin manager."{{{

" Turn off filetype detection (for plugin manager)
filetype plugin indent off

if has('vim_starting')
    " Initialize vundle
    "set rtp+=~/.vim/bundle/vundle
    "call vundle#rc()
    set rtp+=~/.vim/bundle/neobundle.vim
    " call pathogen#runtime_append_all_bundles()
endif

call neobundle#rc(expand('~/.vim/bundle'))
" }}}

" Load vundle or neobundle"{{{
"NeoBundle 'gmarik/vundle'
NeoBundle 'Shougo/neobundle.vim'
"}}}

" Vim related plugins"{{{
NeoBundle 'kana/vim-submode'
NeoBundle 'kana/vim-arpeggio'
NeoBundle 'kana/vim-smartchr'
NeoBundle 'kana/vim-altercmd'
NeoBundle 'kana/vim-skeleton'
NeoBundle 'kana/vim-gf-user'
NeoBundle 'kana/vim-gf-diff'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/echodoc'
NeoBundle 'mattn/calendar-vim'
NeoBundle 'mattn/libcallex-vim'
NeoBundle 'mattn/codepad-vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/vimplenote-vim'
NeoBundle 'mattn/benchvimrc-vim'
NeoBundle 'ujihisa/repl.vim'
NeoBundle 'ujihisa/nclipper.vim'
NeoBundle 'vim-jp/vital.vim'
NeoBundle 'tyru/winmove.vim'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'tyru/urilib.vim'
NeoBundle 'tyru/DumbBuf.vim'
NeoBundle 'thinca/vim-openbuf'
NeoBundle 'thinca/vim-scouter'
NeoBundle 'thinca/vim-singleton'
NeoBundle 'pocket7878/curses-vim'
NeoBundle 'pocket7878/presen-vim'
NeoBundle 'tpope/vim-speeddating'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'rson/vim-conque'
" NeoBundle 'jpalardy/vim-slime'
NeoBundle 'pydave/AsyncCommand'
" NeoBundle 'roman/golden-ratio'
NeoBundle 'sickill/vim-pasta'
" NeoBundle 'mikewest/vimroom'
NeoBundle 'jceb/vim-orgmode'
" NeoBundle 'sgur/autodate.vim'
NeoBundle 'vim-scripts/autodate.vim'
" NeoBundle 'vim-scripts/YankRing.vim'
NeoBundle 'maxbrunsfeld/vim-yankstack'
NeoBundle 'godlygeek/tabular'
NeoBundle 'gregsexton/VimCalc'
NeoBundle 'kmnk/sonictemplate-vim'
NeoBundle 'yuratomo/w3m.vim'
" NeoBundle 'corntrace/bufexplorer'
" NeoBundle 'fholgado/minibufexpl.vim'
" NeoBundle 'Smooth-Scroll'
"}}}

" Unite plugins"{{{
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-ssh'
NeoBundle 'Shougo/unite-build'
NeoBundle 'ujihisa/unite-gem'
NeoBundle 'ujihisa/unite-haskellimport'
NeoBundle 'ujihisa/unite-launch'
NeoBundle 'ujihisa/unite-rake'
NeoBundle 'ujihisa/unite-locate'
NeoBundle 'ujihisa/phrase-t9md'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'ujihisa/quicklearn'
NeoBundle 'osyo-manga/unite-boost-online-doc', {'type': 'nosync'}
NeoBundle 'osyo-manga/unite-edit-global-variables', {'type': 'nosync'}
NeoBundle 'osyo-manga/unite-toggle-options', {'type': 'nosync'}
NeoBundle 'osyo-manga/unite-env'
NeoBundle 'mattn/unite-moukoneyo'
NeoBundle 'mattn/unite-advent_calendar'
NeoBundle 'mattn/unite-source-simplenote'
NeoBundle 'mattn/unite-remotefile'
NeoBundle 'kmnk/vim-unite-svn'
NeoBundle 'kmnk/vim-unite-giti'
NeoBundle 'basyura/unite-rails'
NeoBundle 'basyura/outline-cs'
NeoBundle 't9md/vim-phrase'
NeoBundle 't9md/vim-unite-ack'
NeoBundle 'sgur/unite-qf'
NeoBundle 'sgur/unite-git_grep'
NeoBundle 'h1mesuke/vim-alignta'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'tsukkee/unite-help'
NeoBundle 'tsukkee/unite-tag'
NeoBundle 'tacroe/unite-mark'
" NeoBundle 'tacroe/unite-alias'
NeoBundle 'thinca/vim-unite-history'
NeoBundle 'hakobe/unite-script'
NeoBundle 'choplin/unite-vim_hacks'
NeoBundle 'soh335/unite-qflist'
" NeoBundle 'tungd/unite-session'
NeoBundle 'eagletmt/unite-haddock'
NeoBundle 'mfumi/unite-compiler'
" NeoBundle 'rhysd/unite-opts'
" NeoBundle 'tyru/unite-cmdwin'
NeoBundle 'natsumesou/unite-flexmatcher'
NeoBundle "zepto/unite-tmux"
" }}}

" Vinarise plugins."{{{
NeoBundle 'Shougo/vinarise'
NeoBundle 's-yukikaze/vinarise-plugin-peanalysis'
" }}}

" Vim-ref plugins"{{{
NeoBundle 'mfumi/ref-dicts-en'
NeoBundle 'thinca/vim-ref'
NeoBundle 'ujihisa/ref-hoogle'
" }}}

" Operator plugins"{{{
NeoBundle 'tyru/operator-html-escape.vim'
NeoBundle 'tyru/operator-camelize.vim'
NeoBundle 'tyru/operator-star.vim'
NeoBundle 'kana/vim-operator-user'
NeoBundle 'kana/vim-operator-replace'
NeoBundle 'emonkak/vim-operator-comment'
NeoBundle 'emonkak/vim-operator-sort'
NeoBundle 'thinca/vim-operator-sequence'
" }}}

" Vim textobj plugins."{{{
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-textobj-indent'
NeoBundle 'kana/vim-textobj-line'
NeoBundle 'kana/vim-textobj-syntax'
NeoBundle 'kana/vim-textobj-lastpat'
NeoBundle 'kana/vim-textobj-function'
NeoBundle 'kana/vim-textobj-entire'
NeoBundle 'kana/vim-textobj-fold'
NeoBundle 'kana/vim-textobj-datetime'
NeoBundle 'thinca/vim-textobj-comment'
NeoBundle 'sgur/vim-textobj-parameter'
NeoBundle 'mattn/vim-textobj-url'
NeoBundle 't9md/vim-textobj-function-ruby'
NeoBundle 'nelstrom/vim-textobj-rubyblock'
" NeoBundle 'vim-scripts/argtextobj.vim'
" NeoBundle 'michaeljsmith/vim-indent-object'
" }}}

" Metarw plugins."{{{
NeoBundle 'kana/vim-metarw'
NeoBundle 'kana/vim-metarw-git'
NeoBundle 'mattn/vim-metarw-simplenote'
NeoBundle 'emonkak/vim-metarw-gist'
" }}}

" Vimshell plugins."{{{
NeoBundle 'Shougo/vimshell'
NeoBundle 'ujihisa/vimshell-ssh'
" }}}

" neocomplcache completion."{{{
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'ujihisa/neco-ghc'
NeoBundle 'ujihisa/neco-ruby'
NeoBundle 'ujihisa/neco-look'
NeoBundle 'ujihisa/neco-drikin'
NeoBundle 'ujihisa/neco-rake'
" NeoBundle 'Shougo/neocomplcache-snippets-complete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neocomplcache-clang'
" NeoBundle 'osyo-manga/neocomplcache-clang_complete'
NeoBundle 'Rip-Rip/clang_complete'
"}}}

" Surround and surround like plugins."{{{
NeoBundle 'tpope/vim-surround'
NeoBundle 't9md/vim-surround_custom_mapping'
" NeoBundle 'kana/vim-surround'
" }}}

" Language Related plugins."{{{
NeoBundle 'mattn/googletranslate-vim'
NeoBundle 'mattn/excitetranslate-vim'
NeoBundle 'mattn/bingtranslate-vim'
NeoBundle 'maksimr/vim-translator'
NeoBundle 'tyru/eskk.vim'
" NeoBundle 'tyru/skk.vim'
NeoBundle 'tyru/skkdict.vim'
" NeoBundle 'banyan/recognize_charcode.vim'
" NeoBundle 'koron/verifyenc-vim'
NeoBundle 'koron/dicwin-vim', {'type': 'nosync'}
" }}}

" Searching related plugins"{{{
NeoBundle 'https://bitbucket.org/ns9tks/vim-l9'
NeoBundle 'https://bitbucket.org/ns9tks/vim-fuzzyfinder'
" NeoBundle 'wincent/Command-T'
" NeoBundle 'mileszs/ack.vim'
" NeoBundle 'vim-scripts/EasyGrep'
" NeoBundle 'kien/ctrlp.vim'
" NeoBundle 'sjbach/lusty'
" NeoBundle 'pydave/vim-ack'
"}}}

" File related plugins"{{{
NeoBundle 'vim-scripts/pdftotext'
NeoBundle 'Shougo/vimfiler'
" NeoBundle 'scrooloose/nerdtree'
"}}}

" Editing related plugins"{{{
NeoBundle 'chrisbra/NrrwRgn'
NeoBundle 'chrisbra/unicode.vim'
NeoBundle 'kana/vim-smartword'
NeoBundle 'kana/vim-grex'
NeoBundle 'thinca/vim-qfreplace'
NeoBundle 'thinca/vim-visualstar'
" NeoBundle 'kana/vim-smartpunc'
" NeoBundle 'Raimondi/delimitMate'
" NeoBundle 'shanlalit/vim-autoclose'
" NeoBundle 'Townk/vim-autoclose'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 't9md/vim-textmanip'
NeoBundle 'Rykka/easydigraph.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'Phize/vim-rainbow_pairs'
" NeoBundle 'kien/rainbow_parentheses.vim'
" NeoBundle 'roman/rainbow'
NeoBundle 'yuroyoro/monday'
NeoBundle 'taku-o/vim-toggle'
NeoBundle 'vim-scripts/camelcasemotion'
NeoBundle 'tobyS/vmustache'
" NeoBundle 'ujihisa/shadow.vim'
"}}}

" Programming related plugins"{{{
" NeoBundle 'ervandew/supertab'
" NeoBundle 'ervandew/taglisttoo'
" NeoBundle 'int3/vim-taglist-plus'
" NeoBundle 'scrooloose/nerdcommenter'
" NeoBundle 'kana/vim-flymake'
" NeoBundle 'tomtom/tcomment_vim'
" NeoBundle 'ervandew/screen'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'othree/html5.vim'
NeoBundle 'mattn/zencoding-vim'
" NeoBundle 'SirVer/ultisnips'
NeoBundle 'hallettj/jslint.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tyru/caw.vim'
NeoBundle "honza/snipmate-snippets"
NeoBundle 'scrooloose/syntastic'
NeoBundle 'c9s/cascading.vim'
NeoBundle 'semmons99/vim-ruby-matchit'
" NeoBundle 'vim-scripts/Source-Explorer-srcexpl.vim'

" Perl plugins."{{{
NeoBundle 'c9s/perlomni.vim'
" }}}

" Snipmate plugin."{{{
" Install vim-snipmate dependencies.
"Bundle "MarcWeber/vim-addon-mw-utils"
"Bundle "tomtom/tlib_vim"
            
" Install snipmate
"Bundle 'garbas/vim-snipmate'

" Original snipmate
"Bundle 'msanders/snipmate.vim'
" }}}

" Textile plugins."{{{
NeoBundle 'timcharper/textile.vim'
NeoBundle 'greyblake/vim-preview'
" }}}

" Markdown plugins."{{{
NeoBundle 'hallison/vim-markdown'
NeoBundle 'mattn/mkdpreview-vim'
" }}}

" Erlang plugins."{{{
NeoBundle 'jimenezrick/vimerl'
" }}}

" Json plugins"{{{
NeoBundle 'rogerz/vim-json'
"}}}

" Bash plugins"{{{
" NeoBundle 'vim-scripts/bash-support.vim'
"}}}

" Python related plugins."{{{
" NeoBundle 'klen/python-mode'
" NeoBundle 'klen/rope-vim'
" NeoBundle 'rygwdn/rope-omni'
NeoBundle 'jmcantrell/vim-virtualenv'
NeoBundle 'jimf/vim-pep8-text-width'
NeoBundle 'nvie/vim-pep8', {'type': 'nosync'}
NeoBundle 'nvie/vim-pyflakes', {'type': 'nosync'}
NeoBundle 'nvie/vim-flake8'
" NeoBundle 'Bogdanp/pyrepl.vim'
" NeoBundle 'rkulla/pydiction'
" NeoBundle 'nvie/vim-pyunit'
"Bundle 'sashahart/pylint.vim'

" My modified pylint plugin.
NeoBundle 'vim-pylint', {'type': 'nosync'}
"}}}

" Coffee-script related plugins."{{{
" NeoBundle 'kchmck/vim-coffee-script'
" }}}

" Java-script related plugins."{{{
" NeoBundle 'pangloss/vim-javascript'
" NeoBundle 'othree/javascript-syntax.vim'
" }}}

" Java related plugins."{{{
NeoBundle 'vim-scripts/javacomplete'
" }}}

" Ruby related plugins."{{{
NeoBundle 'Bogdanp/rbrepl.vim'
" }}}
"}}}

" Git plugin"{{{
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'mattn/gist-vim'
"}}}

" Paste to paste.pocoo.org"{{{
"NeoBundle 'claytron/lodgeit-vim'
"}}}

" Encryption plugins"{{{
NeoBundle 'vim-scripts/openssl.vim', {'type': 'nosync'}
NeoBundle 'git://gitorious.org/vim-gnupg/vim-gnupg.git'
"}}}

" Visual related plugins"{{{
" NeoBundle 'godlygeek/csapprox'
NeoBundle 'godlygeek/colorchart'
NeoBundle 'vim-scripts/Color-Sampler-Pack'
NeoBundle 'chriskempson/vim-tomorrow-theme'
NeoBundle 'tomasr/molokai'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'noahfrederick/Hemisu'
NeoBundle 'altercation/vim-colors-solarized'
" NeoBundle 'mattn/mahjong-vim'
" NeoBundle 'mattn/hahhah-vim'
" NeoBundle 'mitsuhide/nyan-modoki.vim'
" NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'tpope/vim-afterimage'
NeoBundle 'Rykka/colorv.vim'
"}}}

" Load pathogen bundles"{{{
"call pathogen#infect()
"call pathogen#helptags()
"}}}

" End plugin loading"}}}

" Turn filtype settings and syntax back on."{{{
" Turn on filetype detection and other options.
filetype plugin indent on

" Turn on syntax before setting the colors otherwise they will be unset.
syntax on
" }}}

" Keybindings"{{{

" Misc."{{{
" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Toggle showing list chars
noremap <leader>l :set invlist<CR>

" Save file if it has changes.
noremap <leader>x :update<CR>

" Re-source vimrc
noremap <leader>sv :source $MYVIMRC<CR>

" Edit vimrc
noremap <leader>ev :tabe $MYVIMRC<CR>

" Tmux shortcuts."{{{
noremap <leader>tp :TmuxSelectPane<CR>
noremap <leader>tt :TmuxSendCommand<CR>
noremap <leader>cc :TmuxChangeCommand<CR>

nnoremap <leader>ts :TmuxSend<CR>
nnoremap <leader>tsa :1,$TmuxSend<CR>
xnoremap <leader>ts :TmuxSend<CR>
" }}}
"}}}

" Moving in insert mode."{{{
" Reference: https://github.com/kana/config/blob/master/vim/personal/dot.vimrc
" inoremap <Esc>h  <Left>
" inoremap <Esc>j  <Down>
" inoremap <Esc>k  <Up>
" inoremap <Esc>l  <Right>

inoremap <Esc>w  <C-Right>
inoremap <Esc>b  <C-Left>
inoremap <Esc>e  <C-o>e
inoremap <Esc>W  <C-o>W
inoremap <Esc>B  <C-o>B
inoremap <Esc>E  <C-o>E
" }}}

" Diff keybindings."{{{
vnoremap <leader>dp :diffput<CR>
vnoremap <leader>do :diffget<CR>
" }}}

" Encrypt the current file with vimcrypt."{{{
noremap <leader>cr :X<CR>
"}}}

" A shortcut to override supertabs"{{{
"inoremap <c-l> <c-x><c-n>
"}}}

" Toggle the colorcolumn shortcut."{{{
let s:l_cc = &cc
fun! s:ToggleColorColumn()
    if s:l_cc == 0
        setlocal colorcolumn=+1
        let s:l_cc = 1
    else
        setlocal colorcolumn=0
        let s:l_cc = 0
    endif
endfun
noremap <leader><leader>c :call <SID>ToggleColorColumn()<CR>
" }}}

" Turn off the highlighting (nohl) shortcut."{{{
nnoremap <leader>/ :nohl<CR>
" }}}

" Quick spell check toggle."{{{
noremap <leader>ss :setlocal spell!<CR>
"}}}

" Window and Tab movement keys."{{{
" Tab related shortcuts.
noremap <leader>tc :tabclose<CR>
noremap <leader>wt <C-W>T

" Switch windows quickly
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h
"}}}

" Close current window."{{{
noremap <leader>q :quit!<CR>
"}}}

" Open and close the list window."{{{
noremap <leader>lo :lopen<CR>
noremap <leader>lc :lclose<CR>
" }}}

" Visual star search keybindings."{{{
" Reference: https://github.com/ujihisa/config/blob/master/_vimrc#L1494
" vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v,'\/'),"\n",'\\n','g')<CR><CR>")
"}}}

" Vim command line keybindings."{{{
cmap <C-A> <Home>
cmap <C-E> <End>
cmap <C-D> <Del>
cmap <C-B> <Left>
cmap <C-F> <Right>
"}}}

" Golden Ratio resize."{{{
" Reference: https://github.com/ujihisa/config/blob/master/_vimrc#L1494
command! -nargs=0 GoldenRatioVirtical execute 'vertical resize' &columns * 5/8
command! -nargs=0 GoldenRatio execute 'resize' &lines * 5/8
nnoremap <leader>rv :<C-u> GoldenRatioVirtical<CR>
nnoremap <leader>rh :<C-u> GoldenRatio<CR>
"}}}

" Submodes and submode options."{{{
" Make sure submode is loaded.
if &rtp=~'vim-submode'
    " Textmanip submode"{{{
    " Reference: https://github.com/tsukkee/config/blob/master/vimrc
    call submode#enter_with('textmanip', 'v', 'r', '<C-t>h', '<Plug>(textmanip-move-left)')
    call submode#enter_with('textmanip', 'v', 'r', '<C-t>l', '<Plug>(textmanip-move-right)')
    call submode#enter_with('textmanip', 'v', 'r', '<C-t>j', '<Plug>(textmanip-move-down)')
    call submode#enter_with('textmanip', 'v', 'r', '<C-t>k', '<Plug>(textmanip-move-up)')
    call submode#leave_with('textmanip', 'v', '', '<Esc>')
    call submode#map('textmanip', 'v', 'r', 'h', '<Plug>(textmanip-move-left)')
    call submode#map('textmanip', 'v', 'r', 'l', '<Plug>(textmanip-move-right)')
    call submode#map('textmanip', 'v', 'r', 'j', '<Plug>(textmanip-move-down)')
    call submode#map('textmanip', 'v', 'r', 'k', '<Plug>(textmanip-move-up)')
    "}}}

    " Tab switching submode."{{{
    " Reference: http://www.github.com/choplin vimrc
    " call submode#enter_with('tabnext', 'n', '', '<Tab>', ':<C-u>tabnext<CR>')
    call submode#enter_with('tabnext', 'n', '', 'gt', ':<C-u>tabnext<CR>')
    " call submode#enter_with('tabnext', 'n', '', '<S-Tab>', ':<C-u>tabprevious<CR>')
    call submode#enter_with('tabnext', 'n', '', 'gT', ':<C-u>tabprevious<CR>')
    call submode#leave_with('tabnext', 'n', '', '<Esc>')
    call submode#map('tabnext', 'n', '', 'l', ':<C-u>tabnext<CR>')
    call submode#map('tabnext', 'n', '', 'h', ':<C-u>tabprevious<CR>')
    " }}}

    " Undo/Redo submode."{{{
    call submode#enter_with('undo/redo', 'n', '', 'g-', 'g-')
    call submode#enter_with('undo/redo', 'n', '', 'g+', 'g+')
    call submode#leave_with('undo/redo', 'n', '', '<Esc>')
    call submode#map('undo/redo', 'n', '', '-', 'g-')
    call submode#map('undo/redo', 'n', '', '+', 'g+')
    " }}}

    " Window resize submode."{{{
    " Reference: https://github.com/tsukkee/config/blob/master/vimrc
    call submode#enter_with('winsize', 'n', '', '<C-w>>', '<C-w>>')
    call submode#enter_with('winsize', 'n', '', '<C-w><', '<C-w><')
    call submode#enter_with('winsize', 'n', '', '<C-w>+', '<C-w>+')
    call submode#enter_with('winsize', 'n', '', '<C-w>-', '<C-w>-')
    call submode#map('winsize', 'n', '', '>', '<C-w>>')
    call submode#map('winsize', 'n', '', '<', '<C-w><')
    call submode#map('winsize', 'n', '', '+', '<C-w>+')
    call submode#map('winsize', 'n', '', '-', '<C-w>-')
    " }}}
endif
" }}}

" Plugin keybindings."{{{

" Neocomplcache keybindings"{{{
inoremap <expr><C-d>l neocomplcache#toggle_lock()."\<C-h>"
imap <silent><C-l>     <Plug>(neosnippet_expand_or_jump)
smap <silent><C-l>     <Plug>(neosnippet_expand_or_jump)
" smap <silent><C-l>     <Plug>(neocomplcache_snippets_jump)
"inoremap <silent>G     <Plug>(neocomplcache_snippets_force_expand)
"inoremap <expr><C-j> neocomplcache#sources#snippets_complete#expandable() ?
 "\ "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  pumvisible() ? neocomplcache#close_popup() : "\<CR>"
" <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" For cursor moving in insert mode(Not recommended)
inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
"}}}

" Unite keybindings."{{{
" The prefix key.
nnoremap    [unite]   <nop>
xnoremap    [unite]   <nop>
nmap    <leader>u [unite]
xmap    <leader>u [unite]

nnoremap <silent> [unite]f  :<C-u>UniteWithCurrentDir -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap <silent> [unite]fb  :<C-u>UniteWithBufferDir -buffer-name=files -prompt=%\  buffer file_mru bookmark file<CR>
nnoremap <silent> [unite]b  :<C-u>Unite -buffer-name=buffers buffer<CR>
nnoremap <silent> [unite]r  :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> [unite]o  :<C-u>Unite outline<CR>

nnoremap  [unite]s  :<C-u>Unite source<CR>

nnoremap <silent> [unite]h :<C-u>Unite help<CR>

nnoremap [unite]i :<C-u>Unite neobundle/install:

nnoremap [unite]a :<C-u>exe "Unite -buffer-name=ack ack:".expand("%:h")<CR>
nnoremap [unite]a* :<C-u>exe "Unite -buffer-name=ack ack:".expand("%:h").":".escape(expand('<cword>'),' :\')<CR>
xnoremap <space>a "vy :exe "Unite -buffer-name=ack ack:".expand("%:h").":".escape(@v,' :\')<CR>
nnoremap [unite]A :<C-u>UniteResume ack<CR>

nnoremap [unite]g :<C-u>exe "Unite -buffer-name=grep grep:".expand("%:h")<CR>
nnoremap [unite]G :<C-u>UniteResume grep<CR>

nnoremap [unite]rm :<C-u>exe "Unite -buffer-name=ref-man ref/man"<CR>

" nnoremap [unite]ts :<C-u>exe "Unite -buffer-name=tmux tmux"<CR>
" nnoremap [unite]tsa :<C-u>exe "Unite -buffer-name=tmux tmux::0:$"<CR>
" xnoremap [unite]ts :<C-u>exe "Unite -buffer-name=tmux tmux::'<:'>"<CR>
nnoremap [unite]ts :<C-u>exe "Unite -buffer-name=tmux -default-action=send tmux/panes"<CR>
nnoremap [unite]tsa :<C-u>exe "Unite -buffer-name=tmux -default-action=send tmux/panes::0:$"<CR>
xnoremap [unite]ts :<C-u>exe "Unite -buffer-name=tmux -default-action=send tmux/panes::'<:'>"<CR>
" }}}

" VimFiler keybindings."{{{
noremap <leader>vf :VimFiler -buffer-name=explorer -split -winwidth=35 -toggle<CR>
" }}}

" VimShell keybindings."{{{
noremap <leader>vs :VimShellPop<CR>
" }}}

" ConqueTerm keybindings."{{{
noremap <leader>cb :ConqueTermSplit /bin/bash<CR>
noremap <leader>cp :ConqueTermSplit /usr/bin/python<CR>
" }}}

" EchoDoc keybindings."{{{
nnoremap <leader>ee :EchoDocEnable<CR>
nnoremap <leader>ed :EchoDocDisable<CR>
" }}}

" Arpeggio keybindings."{{{
if &rtp=~'vim-arpeggio'
    call arpeggio#map('i', '', 0, 'jk', '<Esc>')
    call arpeggio#map('v', '', 0, 'jk', '<Esc>')
endif
" }}}

" Ref keybindings."{{{
noremap <leader>rm* :<C-u>exe "Ref man " . escape(expand('<cword>'), ' :\')<CR>
" }}}

" Smartword keybindings"{{{
map w  <Plug>(smartword-w)
map b  <Plug>(smartword-b)
map e  <Plug>(smartword-e)
map ge  <Plug>(smartword-ge)
noremap ,w  w
noremap ,b  b
noremap ,e  e
noremap ,ge  ge
" }}}

" Narrow Region keybindings."{{{
" The prefix key.
nnoremap    [nrrwgn]   <nop>
nmap    <leader>n [nrrwgn]

" Mappings
" xnoremap <silent> [nrrwgn]r  :<C-u>NarrowRegion<C-R>
" nnoremap <silent> [nrrwgn]w  :exe ":" . "NarrowWindow"<CR>
" nnoremap <silent> [nrrwgn]rv :exe ":" . "NRV"<CR>
" nnoremap <silent> [nrrwgn]rp :exe ":" . "NRPrepare"<CR>
" nnoremap <silent> [nrrwgn]rm :exe ":" . "NRMulti"<CR>
xnoremap <silent> [nrrwgn]r  :<C-u>NarrowRegion<CR>
nnoremap <silent> [nrrwgn]w  :<C-u>NarrowWindow<CR>
nnoremap <silent> [nrrwgn]rv :<C-u>NRV<CR>
nnoremap <silent> [nrrwgn]rp :<C-u>NRPrepare<CR>
nnoremap <silent> [nrrwgn]rm :<C-u>NRMulti<CR>
" }}}

" FuzzyFinder keybindings."{{{
nnoremap <silent> <leader>ff :FufFileWithCurrentBufferDir<CR>
nnoremap <silent> <leader>fb :FufBuffer<CR>
nnoremap <silent> <leader>ft :FufTag<CR>
nnoremap <silent> <leader>fh :FufHelp<CR>
nnoremap <silent> <leader>fl :FufLine<CR>
" }}}

" Gundo keybindings."{{{
noremap <leader>g :GundoToggle<CR>
" }}}

" TagBar keybindings."{{{
noremap <leader>tb :TagbarToggle<CR>
" }}}

" Yankstack keybindings."{{{
nmap <C-P> <Plug>yankstack_substitute_older_paste
nmap <C-N> <Plug>yankstack_substitute_newer_paste
" }}}

" Syntastic keybindings."{{{
noremap <leader>s :SyntasticCheck<CR>
" }}}

" Vundle keybindings."{{{
" noremap <leader>bs :BundleSearch 
" }}}

" CommandT keybindings."{{{
" noremap <silent> <Leader>tf :CommandTFlush<CR>
" }}}

" Ack keybindings."{{{
noremap <leader>a <Esc>:Ack! 
" }}}

" CTRL-P keybindings."{{{
" nnoremap <silent> <c-p>b :CtrlPBuffer<CR>
" }}}

" Nerdtree keybindings."{{{
" noremap <leader>nt  :NERDTreeToggle<CR> 
" }}}

" Taglist keybindings."{{{
" noremap <leader>tl :TlistToggle<CR>
" }}}

" Excite Translate keybindings."{{{
vnoremap <leader>et :ExciteTranslate<CR>
nnoremap <leader>eta :1,$call ExciteTranslateBuffer()<CR>
" }}}

" Google Translate keybindings."{{{
nnoremap <leader>gta :call GoogTransBlock()<CR>
" }}}

" GoldenRatio keybindings."{{{
map <leader><leader>r <Plug>(golden_ratio_toggle)
" }}}

" Post to paste.pocoo.org"{{{
"noremap <leader>li :LodgeIt<CR>
"}}}
" end plugin keybindings }}}
"}}}

" Autocommands and filetype settings."{{{

" all files.{{{
augroup all_filetypes
    autocmd!
    " Reference: http://stackoverflow.com/questions/2182427/right-margin-in-vim
    " autocmd BufWinEnter <buffer> if empty(&buftype) && &l:textwidth > 0 |
    "             \ call matchadd('ErrorMsg', '\%>'.&l:textwidth.'v.\+', -1) |
    "             \ endif
    autocmd FileType python if &l:textwidth > 0 |
                \ call matchadd('ErrorMsg', '\%>'.&l:textwidth.'v.\+', -1) |
                \ endif
    " autocmd BufWinEnter * if &filetype == 'unite' | setlocal nowrap | endif
    " Reference: http://vim.wikia.com/wiki/Keep_folds_closed_while_inserting_text
    " Don't screw up folds when inserting text that might affect them, until
    " leaving insert mode. Foldmethod is local to the window.
    autocmd InsertEnter * let w:last_fdm=&foldmethod | setlocal foldmethod=manual
    autocmd InsertLeave * let &l:foldmethod=w:last_fdm

    " Reference: vimrc_example.vim
    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    " Also don't do it when the mark is in the first line, that is the default
    " position when opening a file.
    autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif

    autocmd FileType * setlocal formatoptions-=t |
                \ setlocal formatoptions-=r |
                \ setlocal formatoptions-=o |
                \ setlocal formatoptions+=cmM

    " Statusline coloring."{{{
    " Reference: http://vim.wikia.com/wiki/Change_statusline_color_to_show_insert_or_normal_mode
    function! InsertStatuslineColor(mode)
        if  a:mode == 'r'
            hi statusline ctermbg=darkred guibg=#DE6951
        elseif a:mode == 'i'
            hi statusline ctermbg=darkblue guibg=#2187F6
        endif
    endfunction

    au InsertEnter * call InsertStatuslineColor(v:insertmode)
    au InsertLeave * hi statusline ctermbg=darkcyan guibg=#4390B1
    " }}}
augroup END
" }}}

" Vim Help."{{{
augroup vim_help_filetype
    autocmd!
    autocmd Filetype help noremap <buffer> q <C-W>q
augroup END
"}}}

" vim"{{{
augroup vim_filetype
    autocmd!
    autocmd FileType vim setlocal keywordprg=:help
augroup END
"}}}

" tmux.conf"{{{
augroup tmux_filetype
    autocmd!
    autocmd FileType tmux setlocal commentstring=#%s
augroup END
" }}}

" text."{{{
augroup text_filetype
    autocmd!
    " Set the vim dictionary
    au Filetype text setlocal dictionary+=/usr/share/dict/words

    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=78
augroup END
" }}}

" python"{{{
augroup python_filetype
    autocmd!

    let python_highlight_all=1

    au FileType python noremap <buffer> <localleader>f :call Pyflakes()<CR>
    au FileType python noremap <buffer> <localleader>8 :call Pep8()<CR>
    au FileType python noremap <buffer> <localleader>f8 :call Flake8()<CR>
    au FileType python noremap <buffer> <localleader>l :Pylint<CR>
    if has('python3')
        au FileType python setlocal omnifunc=python3complete#Complete
    elseif has('python')
        au FileType python setlocal omnifunc=pythoncomplete#Complete
    endif


    " Python Fold setup"{{{
    "autocmd FileType python setlocal foldopen=all
    " autocmd FileType python setlocal foldclose=all
    autocmd FileType python setlocal foldmethod=indent
    autocmd FileType python setlocal foldlevel=20000
    autocmd FileType python setlocal foldcolumn=3
    "}}}

    " Add python paths for completion."{{{
    autocmd FileType python setlocal path+=/usr/lib/python3.2
    autocmd FileType python setlocal path+=/usr/lib/python3.2/site-packages
    autocmd FileType python setlocal path+=/usr/lib/python2.7
    autocmd FileType python setlocal path+=/usr/lib/python2.7/site-packages
    "}}}

    " Python vim-rope-omni setup"{{{
    let $PYTHONPATH .= ':' . expand("~/.vim/ftplugin/python/")
    fun! s:ToggleOmniFunc()
        if !exists("s:old_omnifunc")
            let s:old_omnifunc = &omnifunc
        endif

        if s:old_omnifunc == &omnifunc
            " Use the ropevim completion.
            setlocal omnifunc=RopeCompleteFunc
        else
            let &omnifunc = s:old_omnifunc
        endif
    endfun

    autocmd FileType python noremap <buffer> <localleader>ro :call <SID>ToggleOmniFunc()<CR>
    " }}}

    " Python vim-rope setup"{{{
    fun! s:LoadRope()
        " Add ropevim to the runtimepath.
        setlocal rtp+=~/.vim/python_bundle/ropevim
        " Source the ropevim plugin.
        runtime ftplugin/python/ropevim.vim

        " Add keybindings for ropevim.
        noremap <buffer> <localleader>j :RopeGotoDefinition<CR>
        noremap <buffer> <localleader>r :RopeRename<CR>
        inoremap <c-f> <C-R>=RopeCodeAssistInsertMode()<CR>
    endfun

    autocmd FileType python noremap <buffer> <localleader>rv :call <SID>LoadRope()<CR>
"}}}
augroup END
"}}}

" PKBUILD"{{{
augroup PKBUILD_filetype
    autocmd!
    autocmd FileType PKGBUILD setlocal commentstring=#%s
augroup END
"}}}

" freebasic"{{{
augroup freebasic_filetype
    autocmd!
    autocmd FileType freebasic setlocal commentstring='%s
augroup END
"}}}

" golang"{{{
augroup go_filetype
    autocmd!
    set rtp+=/usr/share/go/misc/vim
    autocmd FileType go setlocal commentstring=//%s
augroup END
"}}}

" Java"{{{
augroup java_filetype
    autocmd!
    autocmd FileType java setlocal omnifunc=javacomplete#Complete
augroup END
"}}}

" html"{{{
augroup html_filetype
    autocmd!
    autocmd FileType html,html5 setlocal omnifunc=htmlcomplete#CompleteTags
    " au FileType html,html5 call SuperTabSetDefaultCompletionType("<c-x><c-o>")
augroup END

" Preview html."{{{
" Reference: http://vim.wikia.com/wiki/Preview_HTML_files_quickly
function! ViewHtmlText(url)
  if !empty(a:url)
    new
    setlocal buftype=nofile bufhidden=hide noswapfile
    " Using lynx.
    " execute 'r !lynx ' . a:url . ' -dump -nolist -underscore -width ' . winwidth(0)
    " Using elinks.
    execute 'r !elinks ' . a:url . ' -dump -dump-width ' . winwidth(0)
    0d
  endif
endfunction
" Save and view text for current html file.
nnoremap <Leader>H :update<Bar>:call ViewHtmlText(expand('%:p'))<CR>
" View text for visually selected url.
vnoremap <Leader>h "ey:call ViewHtmlText(@e)<CR>
" View text for url from Linux or Windows clipboard
" (on Linux, @* is the current selection; use @+ for text in clipboard).
nnoremap <Leader>h :call ViewHtmlText(@*)<CR>
"}}}
"}}}

" ruby"{{{
augroup ruby_filetype
    autocmd!
    " autocmd FileType ruby,eruby setlocal omnifunc=rubycomplete#Complete
    autocmd FileType ruby,eruby setlocal foldmethod=syntax
    autocmd FileType ruby,eruby setlocal foldlevel=20000
    "autocmd FileType ruby,eruby setlocal keywordprg=ri
    "let g:rubycomplete_buffer_loading = 1
    "let g:rubycomplete_rails = 1
    "let g:rubycomplete_classes_in_global = 1
augroup END
"}}}

" Vala"{{{
augroup vala_filetype
    autocmd!

    " Disable valadoc syntax highlight
    "let vala_ignore_valadoc = 1

    " Enable comment strings
    let vala_comment_strings = 1

    " Highlight space errors
    let vala_space_errors = 1

    " Disable trailing space errors
    let vala_no_trail_space_error = 1

    " Disable space-tab-space errors
    let vala_no_tab_space_error = 1

    " Minimum lines used for comment syncing (default 50)
    "let vala_minlines = 120
augroup END

" End vala stuff"}}}

" Markdown."{{{
augroup markdown_filetype
    autocmd!
    " Reference: http://learnvimscriptthehardway.stevelosh.com/chapters/16.html
    autocmd Filetype markdown onoremap <buffer> ih :<C-U>execute
                \ "normal! ?^==\\\|--\\+$\r:nohlsearch\rkvg_"<CR>
    autocmd Filetype markdown onoremap <buffer> ah :<C-U>execute
                \ "normal! ?^==\\\|--\\+$\r:nohlsearch\rg_vk0"<CR>
augroup END
"}}}

"}}}

" Options."{{{

" Plugin options"{{{

" Altercmd."{{{
" Load altercmd.
if &rtp=~'vim-altercmd'
    call altercmd#load()
endif
" }}}

" Singleton."{{{
if &rtp=~'vim-singleton'
    " Start singleton.
    call singleton#enable()
endif
" }}}

" NeoComplCache settings"{{{

" NeoComplCache options."{{{
" Use neocomplcache#
let g:neocomplcache_enable_at_startup = 1
" let g:neocomplcache_disable_auto_complete = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_enable_auto_delimiter = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
" Make it auto select the first item.
let g:neocomplcache_enable_auto_select = 1
let g:neocomplcache_ctags_program = 'anjuta-tags'
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
let g:snippets_dir = '~/.vim/snippets/,~/.vim/bundle/snipmate-snippets/snippets/'
let g:neocomplcache_force_overwrite_completefunc = 1
" }}}

" Define dictionary."{{{
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ }
" \ 'python'  : $HOME . '/.vim/bundle/pydiction/complete-dict',
if !exists('g:neocomplcache_dictionary_patterns')
  let g:neocomplcache_dictionary_patterns = {}
endif
" works well for the pydiction.vim dictionary file(complete-dict)
" let g:neocomplcache_dictionary_patterns.python = '\(\h\w*[.(]\?\)\+'
" }}}

" Define omni functions dictionary."{{{
let g:neocomplcache_omni_functions = {
            \ 'javascript' : 'javascriptcomplete#Complete',
            \ 'java'       : 'javacomplete#Complete',
            \ 'go'         : 'gocomplete#Complete',
            \ 'perl'       : 'PerlComplete',
            \ 'ada'        : 'adacomplete#Complete',
            \ }
"}}}

" Enable heavy omni completion."{{{
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.java = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.perl = '[^. *\t]->\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.go = '[^. *\t]\.\w*\|\h\w*::'
"}}}

" use neocomplcache & clang_complete."{{{

" add neocomplcache option

" add clang_complete option
let g:neocomplcache_clang_use_library = 1
let g:neocomplcache_clang_library_path='/usr/lib/llvm/'
" let g:neocomplcache_clang_user_options =
" \ '-I /usr/include '.
" \ '-fms-extensions -fgnu-runtime '.
" \ '-include malloc.h '

" let g:clang_complete_auto=1
" let g:clang_use_library = 1
" let g:clang_library_path='/usr/lib/llvm/'
" let g:clang_auto_select = 1
" }}}
"}}}

" Unite settings."{{{
" Start insert.
let g:unite_enable_start_insert = 0
let g:unite_split_rule = "botright"

" For ack."{{{
if executable('ack')
  let g:unite_source_grep_command = 'ack'
  let g:unite_source_grep_default_opts = '--noheading --nocolor -a'
  let g:unite_source_grep_recursive_opt = ''
endif
" }}}

" Custom filters."{{{
if &rtp=~'unite.vim'
    " call unite#custom_filters('file,buffer,file_rec', ['flexmatcher', 'sorter_default', 'converter_default'])
    call unite#custom_filters('file,buffer,file_rec', ['matcher_fuzzy', 'sorter_default', 'converter_default'])
endif
" }}}
" }}}

" Unite-launch settings"{{{
let g:unite_launch_apps = [
            \ 'rake',
            \ 'make',
            \ ]
" }}}

" Unite Ack settings."{{{
let g:unite_source_ack_command="ack --nocolor --nogroup"
" }}}

" VimFiler settings"{{{
let g:vimfiler_edit_action = "tabopen"
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_split_rule = 'botright'

" Like Textmate icons."{{{
let g:vimfiler_tree_leaf_icon = ' '
if &term !~ 'linux'
    let g:vimfiler_tree_opened_icon = '▾'
    let g:vimfiler_tree_closed_icon = '▸'
else
    let g:vimfiler_tree_opened_icon = '▼'
    let g:vimfiler_tree_closed_icon = '▶'
    " let g:vimfiler_tree_opened_icon = '▶'
    " let g:vimfiler_tree_closed_icon = '◆'
endif
let g:vimfiler_file_icon = '-'
let g:vimfiler_marked_file_icon = '*'
"}}}
"}}}

" Vinarise settings"{{{
let g:vinarise_enable_auto_detect = 0
"}}}

" VimShell settings"{{{
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_prompt = '% '
let g:vimshell_use_terminal_command = 'valaterm.pl -e'
let g:vimshell_execute_file_list = {}
let g:vimshell_execute_file_list['rb'] = 'ruby'
let g:vimshell_execute_file_list['pl'] = 'perl'
let g:vimshell_execute_file_list['py'] = 'python'
let g:vimshell_popup_height = 35
"}}}

" ConqueTerm Settings"{{{
let g:ConqueTerm_PyVersion = 3
let g:ConqueTerm_CWInsert = 1
"let g:ConqueTerm_TERM = 'xterm'
"}}}

" Caw commenter plugin settings."{{{
map <Plug>(caw:prefix)<Space> <Plug>(caw:i:toggle)
" }}}

" Zencoding plugin settings. "{{{
let g:user_zen_leader_key = '<leader>z'
"}}}

" Narrow Region settings."{{{
let g:nrrw_topbot_leftright = 'botright'
" }}}

" TagBar settings"{{{
" Set tagbar to use anjuta-tags instead of ctags
" let g:tagbar_ctags_bin = "anjuta-tags"
let g:tagbar_left = 1
let g:tagbar_width = 25
" Add New languages to tagbar.
" Freebasic {{{
let g:tagbar_type_freebasic = {
            \ 'ctagstype': 'basic',
            \ 'kinds': [
                \ 'c:constants',
                \ 'g:enumerations',
                \ 'f:functions',
                \ 'l:labels',
                \ 't:types',
                \ 'v:variables'
            \]
        \}
"}}}
" Vala {{{
" let g:tagbar_type_vala = {
"             \ 'ctagstype': 'vala',
"             \ 'kinds': [
"                 \ 'c:classes',
"                 \ 'd:delegates',
"                 \ 'e:enumerations',
"                 \ 'E:error domains',
"                 \ 'f:fields',
"                 \ 'i:interfaces',
"                 \ 'm:methods',
"                 \ 'p:properties',
"                 \ 'r:error codes',
"                 \ 's:structures',
"                 \ 'S:signals',
"                 \ 'v:enumeration values'
"             \ ],
"             \ 'sro': '.',
"             \ 'kind2scope': {
"                 \ 'i': 'interface',
"                 \ 'c': 'class',
"                 \ 's': 'structure',
"                 \ 'e': 'enum'
"             \ },
"             \ 'scope2kind': {
"                 \ 'interface': 'i',
"                 \ 'class': 'c',
"                 \ 'struct': 's',
"                 \ 'enum': 'e'
"             \ }
"         \ }
"}}}
"}}}

" Preview settings."{{{
let g:PreviewBrowsers = 'webbrowser,chromium,firefox'
let $PATH=$PATH . ':' . $HOME . '/.gem/ruby/1.9.1/bin/'
" }}}

" Mkdpreview settings."{{{
let g:mkdpreview_python_path='/usr/bin/python2'
" }}}

" Translate settings."{{{
let g:goog_user_conf = {
            \ 'langpair': 'ja|en',
            \ 'v_key': 'T',
            \ 'cmd': 'lua',
            \ 'charset': 'utf-8'
            \ }
" }}}

" DumbBuf settings."{{{
let g:dumbbuf_hotkey='<leader>db'
" }}}

" Indent Guides settings."{{{
let g:indent_guides_guide_size=1
let g:indent_guides_start_level=2
let g:indent_guides_auto_colors=0
" }}}

" Surrond custom mappings."{{{
let g:surround_custom_mapping = {}
let g:surround_custom_mapping._ = {
            \ 'p':  "<pre> \r </pre>",
            \ 'w':  "%w(\r)",
            \ }
let g:surround_custom_mapping.help = {
            \ 'p':  "> \r <",
            \ }
let g:surround_custom_mapping.ruby = {
            \ '-':  "<% \r %>",
            \ '=':  "<%= \r %>",
            \ '9':  "(\r)",
            \ '5':  "%(\r)",
            \ '%':  "%(\r)",
            \ 'w':  "%w(\r)",
            \ '#':  "#{\r}",
            \ '3':  "#{\r}",
            \ 'e':  "begin \r end",
            \ 'E':  "<<EOS \r EOS",
            \ 'i':  "if \1if\1 \r end",
            \ 'u':  "unless \1unless\1 \r end",
            \ 'c':  "class \1class\1 \r end",
            \ 'm':  "module \1module\1 \r end",
            \ 'd':  "def \1def\1\2args\r..*\r(&)\2 \r end",
            \ 'p':  "\1method\1 do \2args\r..*\r|&| \2\r end",
            \ 'P':  "\1method\1 {\2args\r..*\r|&|\2 \r }",
            \ }
let g:surround_custom_mapping.javascript = {
            \ 'f':  "function(){ \r }"
            \ }
let g:surround_custom_mapping.lua = {
            \ 'f':  "function(){ \r }"
            \ }
let g:surround_custom_mapping.python = {
            \ 'p':  "print(\r)",
            \ '[':  "[\r]",
            \ }
let g:surround_custom_mapping.vim= {
            \'f':  "function! \r endfunction"
            \ }
"}}}

" Yankring settings."{{{
let g:yankring_history_dir=expand('~/.vim')
" }}}

" Autodate settings."{{{
let g:autodate_format = '%B %d, %Y'
let g:autodate_keyword_pre = 'Last Modified:'
let g:autodate_keyword_post = '$'
" }}}

" Eskk settings."{{{
" let g:eskk#large_dictionary = {
"             \ 'path': expand('~/.vim/dict/SKK-JISYO.XL'),
"             \ 'sorted': 1,
"             \ 'encoding': 'euc-jp',
"             \ }
let g:eskk#large_dictionary = {
\	'path': "/usr/share/skk/SKK-JISYO.L",
\	'sorted': 1,
\	'encoding': 'euc-jp',
\}
" }}}

" Skk settings."{{{
let skk_jisyo = '~/vim-skk-jisyo.utf8'
let skk_large_jisyo = '/usr/share/skk/SKK-JISYO.L'

let skk_auto_save_jisyo = 1 " don't ask if save
let skk_keep_state = 0
let skk_kutouten_type = 'en'
let skk_egg_like_newline = 1
let skk_show_annotation = 1
let skk_use_face = 1
" }}}

" Vim-Slime settings."{{{
let g:slime_target='tmux'
" }}}

" Screen settings."{{{
let g:ScreenImpl="Tmux"
" }}}

" Syntastic settings."{{{
let g:syntastic_python_checker = 'pyflakes3k'       " pyflakes for python 3
" Don't check on save.
let g:syntastic_mode_map = { 'mode': 'passive',
                            \ 'active_filetypes': [],
                            \ 'passive_filetypes': ['ruby', 'php', 'puppet'] }
"}}}

" Set the pylint settings."{{{
let g:pylint_error_numbers = 1  " Show the python error numbers.
let g:pylint_onwrite = 0       " Do not check code on save.
let g:pylint_command = 'pylint3'
"}}}

" Rope-vim settings."{{{
let ropevim_guess_project = 1
let ropevim_vim_completion = 1
let ropevim_extended_complete = 1
" let g:ropevim_autoimport_modules = ["os.*","traceback","xml.etree"]
" }}}

" Rsense settings."{{{
let g:rsenseHome = expand("~/.vim/rsense-0.3/")
let g:rsenseUseOmniFunc = 1
" }}}

" Set the bash-support plugins leader."{{{
let g:BASH_MapLeader='\'
"}}}

" Setup SuperTab"{{{
let g:SuperTabMappingTabLiteral = "<C-i>"
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabRetainCompletionDuration = "completion"
let g:SuperTabNoCompleteBefore = []
" Set no tab completion after 'spaces,' 'commas,' and 'quotes.'
let g:SuperTabNoCompleteAfter = ['\s', '[:blank:]', '[:space:]', "'", ",", '"']
let g:SuperTabLongestEnhanced = 1
let g:SuperTabLongestHighlight = 1      " Pre highlight the first item 
                                        " in the list.

" Close the preview window when <cr> is pressed.
let g:SuperTabCrClosePreview=1
"}}}

" Powerline customizations."{{{
"let g:Powerline_colorscheme='test'
"let g:Powerline_symbols='fancy'
"}}}

" UltiSnips settings"{{{
let g:UltiSnipsExpandTrigger="<c-d>"
let g:UltiSnipsJumpForwardTrigger="<c-d>"
let g:UltiSnipsJumpBackwardTrigger="<c-g>"
"}}}
" end plugin options"}}}

" Status line settings."{{{
" Mode function for status line."{{{
fun! l:GetMode()
    let l:mode_l = mode()
    if l:mode_l == 'n'
        let l:mode_l='NORMAL'
    elseif l:mode_l == 'no'
        let l:mode_l='OPERATOR-PENDING'
    elseif l:mode_l == 'i'
        let l:mode_l='INSERT'
    elseif l:mode_l == 'v'
        let l:mode_l='VISUAL (character)'
    elseif l:mode_l == 'V'
        let l:mode_l='VISUAL (line)'
    elseif l:mode_l == ''
        let l:mode_l='VISUAL (block)'
    elseif l:mode_l == 's'
        let l:mode_l='SELECT (character)'
    elseif l:mode_l == 'S'
        let l:mode_l='SELECT (line)'
    elseif l:mode_l == '<C-S>'
        let l:mode_l='SELECT (block)'
    elseif l:mode_l == 'R'
        let l:mode_l='REPLACE'
    elseif l:mode_l == 'Rv'
        let l:mode_l='REPLACE (virtual)'
    elseif l:mode_l == 'c'
        let l:mode_l='COMMAND-LINE'
    elseif l:mode_l == 'cv'
        let l:mode_l='EX (vim)'
    elseif l:mode_l == 'ce'
        let l:mode_l='EX (normal)'
    elseif l:mode_l == 'r'
        let l:mode_l='PROMPT (enter)'
    elseif l:mode_l == 'rm'
        let l:mode_l='PROMPT (more)'
    elseif l:mode_l == 'r?'
        let l:mode_l='PROMPT (confirm)'
    elseif l:mode_l == '!'
        let l:mode_l='SHELL'
    endif
    return l:mode_l
endfun
" }}}

" Reference: https://raw.github.com/niw/profiles/master/.vimrc
" Status line
let &statusline = ''
" let &statusline .= '  %{ l:GetMode() } |'     " Buffer number
let &statusline .= ' %3n '     " Buffer number
let &statusline .= '%m%r%h%w%q' " Modified flag, Readonly flag, Preview flag,
                                " and Quickfix flag
if &rtp=~'fugitive'
    let &statusline .= ' | %<%{fugitive#statusline()} '   " Git branch
endif
let &statusline .= ' | %<%f '   " Filename
let &statusline .= '%='         " Spaces
let &statusline .= '%{" | " . (&fileencoding != "" ? &fileencoding : &encoding) . " | " . &fileformat . " | " . &filetype }'
let &statusline .= ' |%4P'      " Percentage through file of displayed window.
let &statusline .= ' | LN%7l C%3c '  " Line number, Column number, Virtual
                                     " column number
" let &statusline = '%{g:HahHah()}' 

" Show the statusline
set laststatus=2

" Show the cursor position all the time
set ruler		

" Set the fill chars for the statusline
set fillchars+=stl:\ ,stlnc:\ 
" }}}

" Misc settings."{{{
" Set the cursor.
" Reference: http://vim.wikia.com/wiki/Non-blinking_block_cursor_in_a_Linux_console
" if &term =~ 'linux'
    " Make the cursor a solid white non-blinking block.
    " set t_ve+=[?81;0;112c
" endif

" Enable list and set the list chars.
set list
if &term !~ 'linux'
    set listchars=tab:»\ ,trail:⋅,extends:»,precedes:«
    set showbreak=↪\ 
else
    set listchars=tab:»\ ,trail:∙,extends:»,precedes:«
    set showbreak=└▶\ 
endif
" Make :help the default keywordprg
set keywordprg=:help

" Don't use input methods.
set iminsert=0
set imsearch=0

" Include the current directory and /usr/include for searching.
set path+=.,,/usr/include

" Only keep a backup when writing.
set nobackup
set writebackup

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Turn on autoindent
set autoindent

" Add extra keywords
set iskeyword+=.

" Show line numbers.
" set number
" Show line number relative to the current line.
set relativenumber

" Make tilde an operator so it can be used with movement (e.g. ~w)
set tildeop

" Set the escape timeout.
set timeout ttimeout timeoutlen=600 ttimeoutlen=0

" Make Visual Block mode able to select past the end of lines.
set virtualedit=block

" Try to keep the cursor on the same column.
set nostartofline

" Show as much of long lines as will fit on the screen not just @'s.
set display+=lastline

" Keep more command line history.
set history=1000

" Make buffers hidden instead of closing them.
set hidden

" Split new windows below for to the right the current one.
set splitbelow
set splitright
" Don't make windows the same size on split or unsplit.
set noequalalways

" Display incomplete commands
set showcmd		

" Enable mouse.
set mouse=a

" Allways show the tabline.
set showtabline=2

" Report all changes.
set report=0

" Don't redraw while performing non-typed actions.
set lazyredraw 

" Set the help window height.
set helpheight=10

" Set preview window height.
set previewheight=8

" Make the command line 2 lines height to avoid "hit enter" prompts.
set cmdheight=2

" }}}

" Showmatch."{{{
" Show matching braces etc.
set showmatch

" Highlight <>.
set matchpairs+=<:>

" Wait half a second for showmatch or until a key is pressed.
set cpoptions-=m
"}}}

" Search options."{{{
" Also switch on highlighting the last used search pattern.
set hlsearch
" Do incremental searching
set incsearch		
"}}}

" Set completion options"{{{
set complete=.,w,b,u,t,i,d,],k,kspell
set completeopt=menuone,preview
"}}}

" Set encryption options"{{{
set cryptmethod=blowfish
"}}}

" Set tab preferences."{{{
set expandtab
set tabstop=4
set shiftwidth=4
set shiftround
set softtabstop=4
"}}}

" wildmenu options."{{{
" Turn on wild menu and make its tab completion like the shells.
set nowildmenu
set wildmode=list:longest
" }}}

" Undo and backup settings."{{{
" Make vim keep an undo file.
set undofile
let &undodir=expand('~/.vim/tmp')
set undolevels=1000
au BufWritePre /tmp/* setlocal noundofile

" Don't create backups when editing a file.
set nobackup
" }}}

" Line (wrap, textwidth, context, etc...) settings."{{{
" Turn on line wrap.
set wrap

" Set the textwidth to 79 for terminals that are 80.
set textwidth=79

" Set the vertical scrolling context to three lines.
set scrolloff=3
" Set the horizontal scrolling context to three characters.
set sidescrolloff=3
" }}}

" Formatoptions."{{{
set formatexpr&
set formatoptions-=t
set formatoptions-=r
set formatoptions-=o
set formatoptions+=cmM
" }}}

" Set folding options"{{{
set foldmethod=marker
set foldcolumn=3
"}}}

" Conceal level."{{{
if has('conceal')
  set conceallevel=2 concealcursor=iv
endif
"}}}

" End vim options"}}}

" Setup vim colorscheme."{{{

" Set the colorscheme to ir_black.
" colorscheme ir_black
colorscheme zepto_dark

" Try to make the colorscheme look the same in all terminal instances
" including the console at 16 colors.
" CSApprox settings."{{{
if &term!="linux" && &term!="screen.linux"
    " We are in a xterm compatible terminal so we probably have 256 colors.
    set t_Co=256
    let g:CSApprox_ir_black_hook_post = 
                \ ['hi Normal ctermbg=NONE ctermfg=NONE',  
                \ 'hi NonText ctermbg=NONE ctermfg=NONE', 
                \ 'hi FoldColumn cterm=NONE ctermbg=NONE ctermfg=green', 
                \ 'hi LineNr cterm=NONE ctermbg=NONE',
                \ 'hi DiffDelete ctermfg=white',
                \ 'hi DiffChange ctermfg=grey',
                \ 'hi VertSplit ctermfg=darkgrey ctermbg=grey',
                \ 'hi ModeMsg cterm=BOLD ctermfg=darkgrey ctermbg=NONE',
                \ 'hi Comment ctermfg=darkgrey',
                \ 'hi LineNr cterm=NONE ctermfg=darkgrey ctermbg=NONE',
                \ 'hi MatchParen cterm=NONE ctermfg=white ctermbg=cyan',
                \ 'hi Normal ctermfg=NONE ctermbg=NONE',
                \ 'hi Visual ctermfg=white ctermbg=green',
                \ 'hi NonText ctermfg=NONE ctermbg=NONE',
                \ 'hi FoldColumn cterm=NONE ctermfg=green ctermbg=NONE',
                \ 'hi SignColumn cterm=NONE ctermfg=red  ctermbg=NONE',
                \ 'hi Pmenu ctermfg=black ctermbg=grey',
                \ 'hi PmenuSel ctermbg=darkyellow',
                \ 'hi EasyMotionTarget ctermfg=green ctermbg=none',
                \ 'hi EasyMotionShade ctermfg=darkgrey ctermbg=none',
                \ 'hi String ctermfg=green',
                \ 'hi Number ctermfg=magenta',
                \ 'hi Keyword ctermfg=blue',
                \ 'hi PreProc ctermfg=blue',
                \ 'hi Conditional ctermfg=blue',
                \ 'hi Constant ctermfg=cyan',
                \ 'hi Identifier ctermfg=cyan',
                \ 'hi Function ctermfg=darkyellow',
                \ 'hi Type ctermfg=yellow',
                \ 'hi Statement ctermfg=lightblue',
                \ 'hi Special ctermfg=white',
                \ 'hi Delimiter ctermfg=cyan',
                \ 'hi Operator  ctermfg=white',
                \ 'hi Folded ctermfg=lightgrey ctermbg=NONE',
                \ ]
    let g:CSApprox_loaded = 1
else
    " Don't load CSApprox plugin.
    let g:CSApprox_loaded = 1
endif
" }}}

" fbpad colorscheme setup."{{{
if &term=='fbpad-256'
    colorscheme fbpad
endif
"}}}

" End setting up colorscheme"}}}

" Set gui options"{{{

if has('gui_running')
    set guifont=Ricty\ 12
    " set guifont=Droid\ Sans\ Mono\ 10
    " set guifont=DejaVu\ Sans\ Mono\ 10

    " Hide menu and toolbar.
    set guioptions=cMg
    set ch=1		" Make command line one lines high

    set mousehide		" Hide the mouse when typing text

    " Make shift-insert work like in Xterm
    noremap <S-Insert> <MiddleMouse>
    noremap! <S-Insert> <MiddleMouse>
endif
"}}}

set secure
" vim: fdm=marker:fdl=0:fmr={{{,}}}
