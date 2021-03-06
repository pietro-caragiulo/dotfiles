"
" Auto completion via ctrl-shift-n (instead of ctrl-x ctrl-o)
set omnifunc=pythoncomplete#Complete
inoremap <C-b> <C-x><C-o>
" blocks are denoted by indent
set foldmethod=indent
set foldlevel=99
" pyflakes quickfix window will override other quickfix windows
let g:pyflakes_use_quickfix = 0

" Turn off rope completion which is really slow.
let g:pymode_syntax_slow_sync = 0
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0


" Disable pdb break point key
let g:pymode_breakpoint = 0
" Disable lint messages.
let g:pymode_lint_cwindow = 0
let g:pymode_lint_message = 0
" Turn off python-mode's run script which is giving uninformative RuntimeError.
let g:pymode_run = 0
let g:pymode_rope = 0

" Save script, run script in it's directory, and return to working directory
function! RunPython()
    write
    let current = getcwd()
    cd %:p:h
    !python %
    cd `=current`
endfunction
nnoremap <buffer> <silent> <leader>r :call RunPython()<CR>

" Run nosetests on current file.
function! RunNosetests()
    write
    let current = getcwd()
    cd %:p:h
    !nosetests --logging-level=INFO --with-doctest %
    cd `=current`
endfunction
nnoremap <buffer> <silent> <leader>n :call RunNosetests()<CR>


function! GetCurrentPythonClass()
    call search('^\s*class ', 'sbe')
    let class = expand('<cword>')
    normal ''
    return class
endfunction

function! GetCurrentPythonMethod()
    call search('^\s*def ', 'sbe')
    let method = expand('<cword>')
    normal ''
    return method
endfunction


" Section headings for reStructuredText
" Parts
noremap  <C-h>0 yyPVr#yyjp
inoremap <C-h>0 <esc>yyPVr#yyjpA
" Chapters
noremap  <C-h>1 yyPVr=yyjp
inoremap <C-h>1 <esc>yyPVr=yyjpA
" Section Level 1
noremap  <C-h>2 yypVr=
inoremap <C-h>2 <esc>yypVr=A
" Section Level 2
noremap  <C-h>3 yypVr-
inoremap <C-h>3 <esc>yypVr-A
" Section Level 3
noremap  <C-h>4 yypVr.
inoremap <C-h>4 <esc>yypVr.A
