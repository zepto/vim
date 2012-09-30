" Exit quickly when:
" - this plugin was already loaded
if !exists("g:ropevim_loaded")
    if has('python3')
python3 << EOF
import sys, vim
sys.path.append(vim.eval("expand('<sfile>:p:h')")  + '/libs/')
import ropevim3 as ropevim
EOF
    elseif has('python')
python << EOF
import sys, vim
sys.path.append(vim.eval("expand('<sfile>:p:h')")  + '/libs/')
import ropevim
EOF
    endif
let g:ropevim_loaded = 1
endif
