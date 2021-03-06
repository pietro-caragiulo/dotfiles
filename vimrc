"remove vi compatibility (this should be first since it has side effects)
set nocompatible
" syntax highlighting on

" Set vim to use colorschemes with 256 colors
set t_Co=256
set background=dark
colorscheme monokai

syntax on


" Start of vundle configuration
" -----------------------------------------------------------------------------
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Vim enhancement plugins:
Plugin 'MarcWeber/vim-addon-mw-utils'  " Required for vim-snippets
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-sensible'
Plugin 'vim-scripts/Rename'

" UI enhancement plugins:
Plugin 'itchyny/lightline.vim'
Plugin 'nathanaelkane/vim-indent-guides'

" General editing plugins:
Plugin 'scrooloose/nerdcommenter'
Plugin 'the-isz/MinYankRing.vim'
Plugin 'tpope/vim-repeat'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'bronson/vim-trailing-whitespace'

" Search and navigation plugins:
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/LustyJuggler'
Plugin 'bronson/vim-visual-star-search'
Plugin 'kien/ctrlp.vim'
Plugin 'tmhedberg/matchit'

" Git plugins:
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" Language-specific plugins
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-ragtag'
Plugin 'mattn/emmet-vim'
Plugin 'mxw/vim-jsx'
Plugin 'jaxbot/syntastic-react'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" =============================================================================

set modelines=0                 " don't add configuration lines to files

" change the mapleader from \ to ,
let mapleader=","
let maplocalleader=","
" let semicolon start EX-mode (a.k.a. command mode)
"nnoremap ; :
set showmode                    " display mode in Insert, Replace or Visual
set cursorline                  " highlight current line
set wildmode=longest,list,full  " change tab-completion to be more like BASH

" Whitespace
" set list                        " show whitespace (negates linebreak)
set tabstop=4                   " tab is 4 spaces
set shiftwidth=4                " indentation in normal mode is 4 spaces
set softtabstop=4               " back space removes up-to 4 spaces
set expandtab                   " expand tabs to spaces

" Search
" Use case-insensitive search if all lowercase. Otherwise case sensitive.
set ignorecase
set smartcase

" line width and indenting
set wrap
set linebreak                   " set list and set linebreak conflict!
set textwidth=79
set formatoptions=qrn1

if v:version >= 703             " options only available in VIM 7.3
    set number                  " show line numbers
    set relativenumber          " number lines relative to current line
    set colorcolumn=80          " add line marking column
    set undofile                " allow undo across file sessions
    set undodir=~/.vimundo/
endif

" Search customization
" ====================

"set nohlsearch                  " don't highlight search words
set gdefault                    " make substitutions global by default
" toggle search matches when entering/leaving insert mode
"autocmd InsertEnter * :set nohlsearch
"autocmd InsertLeave * :set hlsearch
" turn off search with key command
"nnoremap <silent> <leader><space> :nohlsearch<CR>

" Change to directory of active buffer
"autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
"
" Filetype mappings
autocmd BufNewFile,BufRead,BufFilePost *.cir set filetype=spice
autocmd BufNewFile,BufRead,BufFilePost *.txt set filetype=rst
autocmd BufNewFile,BufRead,BufFilePost *.tex set filetype=tex
autocmd BufNewFile,BufRead,BufFilePost *.cls set filetype=tex
autocmd BufNewFile,BufRead,BufFilePost *.css_t set filetype=css
autocmd BufNewFile,BufRead,BufFilePost *.enaml set filetype=enaml
autocmd BufNewFile,BufRead,BufFilePost *.json set filetype=javascript
"autocmd FileType html setlocal shiftwidth=2 tabstop=2

autocmd BufLeave,FocusLost silent! wall " save when focus is lost
" Since I'm auto-saving (above), don't save backup and swap files.
set nobackup
set nowritebackup
set noswapfile

" Allow switching from modified buffers (i.e. hidden buffers)
set hidden
" Confirm before quitting if a modified buffer is hidden
set confirm

" Disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" Change j and k to move by screen line instead of file line (wrapped lines)
nnoremap j gj
nnoremap k gk
nnoremap $ g$
nnoremap ^ g^
vnoremap j gj
vnoremap k gk
vnoremap $ g$
vnoremap ^ g^

" Quick navigation up and down
nnoremap <leader>j 10j
nnoremap <leader>k 10k

" Navigate buffers
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Toggle between two, most-recent buffers
nnoremap <leader><leader> <c-^>

" Yank and paste from clipboard
nnoremap <leader>y "*y
vnoremap <leader>y "*y
nnoremap <leader>Y "*Y
nnoremap <leader>p "*p
vnoremap <leader>p "*p
nnoremap <leader>P "*P
nnoremap <leader>d "*d
vnoremap <leader>d "*d
nnoremap <leader>D "*D

" Insert lines without going insert mode (screws up quickfix)
"nnoremap <S-Enter> O<Esc>
"nnoremap <CR> o<Esc>
" Commands
" ========
" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" search and replace
nnoremap <leader>ss :%s/
vnoremap <leader>ss :s/

" add space around equals signs with no surrounding space
nnoremap <leader>s= :%s/\(\S\)=\(\S\)/\1 = \2/<CR>
vnoremap <leader>s= :s/\(\S\)=\(\S\)/\1 = \2/<CR>

" add space after comma with no surrounding space
nnoremap <leader>s, :%s/\(\S\),\(\S\)/\1, \2/<CR>
vnoremap <leader>s, :s/\(\S\),\(\S\)/\1, \2/<CR>

" add space around * with no surrounding space
nnoremap <leader>s* :%s/\(\S\)\*\(\S\)/\1 * \2/<CR>
vnoremap <leader>s* :s/\(\S\)\*\(\S\)/\1 * \2/<CR>

" add space around .* (Matlab) with no surrounding space
nnoremap <leader>s.* :%s/\(\S\)\.\*\(\S\)/\1 .* \2/<CR>
vnoremap <leader>s.* :s/\(\S\)\.\*\(\S\)/\1 .* \2/<CR>

" add space around + with no surrounding space
nnoremap <leader>s+ :%s/\(\S\)+\(\S\)/\1 + \2/<CR>
vnoremap <leader>s+ :s/\(\S\)+\(\S\)/\1 + \2/<CR>
"
" add space around - with no surrounding space
nnoremap <leader>s- :%s/\(\S\)-\(\S\)/\1 - \2/<CR>
vnoremap <leader>s- :s/\(\S\)-\(\S\)/\1 - \2/<CR>


" Close buffer window, preserving split if it exists
nnoremap <leader>w :bp\|bd #<CR>

" wrap both vimdiff windows
nmap <silent> <leader>dw <C-w>= :set wrap<CR> <C-w><C-w> :set wrap<CR>

" jj in insert mode will change to normal mode
inoremap jj <ESC>

" Shortcut for vim-ipython's completefunc mapping
imap <C-c> <C-x><C-u>

" reflow paragraph (i.e. remove end of lines)
nnoremap Q gqap
" reflow selected text
vnoremap Q gq

" Reparse syntax
noremap <leader>sy <Esc>:syntax sync fromstart<CR>
inoremap <leader>sy <C-o>:syntax sync fromstart<CR>

" FUNCTIONS
" =========

" delete current buffer without destroying split window
" (use function b/c I don't know how to string commands together)
function! s:DeleteCurrentBuffer()
    bn
    bd#
endfunction
command! BD call s:DeleteCurrentBuffer()

" Commands to edit syntax, ftplugin, and snippets based on current filetype
function! s:EditVimConfig(dir, ...)
    let extension =  a:0 >= 1  ?  a:1  :  '.vim'
    let cmd = 'edit ~/.vim/' . a:dir . '/' . &filetype . extension
    execute cmd
endfunction
command! EditSyntax call s:EditVimConfig('syntax')
command! EditPlugin call s:EditVimConfig('ftplugin')
command! EditSnippet call s:EditVimConfig('snippets', '.snippets')
command! EditColors edit ~/.vim/colors/zenburn.vim

" Show syntax highlighting groups for word under cursor (Ctrl-Shift-P)
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunction

function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>

" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

" fill rest of line with characters
function! FillLine( str )
    " set tw to the desired total length
    let tw = &textwidth
    if tw==0 | let tw = 80 | endif
    " strip trailing spaces first
    .s/[[:space:]]*$//
    " calculate total number of 'str's to insert
    let reps = (tw - col("$")) / len(a:str)
    " insert them, if there's room, removing trailing spaces (though forcing
    " there to be one)
    if reps > 0
        .s/$/\=(' '.repeat(a:str, reps))/
    endif
endfunction
nnoremap <Leader>- :call FillLine("-")<cr>

" Plugin Customization
" ====================

" Ignore files for Command-T
set wildignore+=*.o,*.so,*.bmp,*.gif,*.tif,*.jpg,*.png,*.pdf,*.mat,*.npz,*.aux,*.bbl,*.blg,*.log,*.key,*.pyc,*.fdb_latexmk,*.egg-info,*.png.map,*.egg
" IPython auto-generated files
set wildignore+=shadowhist,kernel*.json,__enamlcache__,build

" Syntastic
let g:syntastic_javascript_checkers = ['jsxhint']
let g:syntastic_javascript_jsxhint_exec = 'jsx-jshint-wrapper'

" YouCompleteMe
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string

let g:UltiSnipsExpandTrigger       = "<c-j>"
let g:UltiSnipsJumpForwardTrigger  = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-p>"
let g:UltiSnipsListSnippets        = "<c-k>" "List possible snippets based on current file

" Ctrl-P
:let g:ctrlp_map = '<leader>t'
:let g:ctrlp_match_window_bottom = 0
:let g:ctrlp_match_window_reversed = 0
:let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
:let g:ctrlp_working_path_mode = 0
:let g:ctrlp_dotfiles = 0
:let g:ctrlp_switch_buffer = 0

" Default VCS prefix is ',c' which conflicts with NERD commenter
let VCSCommandMapPrefix = ',v'

" Launch lusty juggler (which lists buffers, hence "b")
nmap <silent> <leader>b <leader>lj

" Quick Ack-vim usage (note that space at the end makes it use easier)
nmap <leader>a :Ack 

let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'

nmap <silent> <leader>nt :NERDTreeToggle<CR>

" When I use vim from the command line I get ruby-not-installed warnings
" even though ruby *is* installed; whatever, just ignore
let g:LustyExplorerSuppressRubyWarning = 1

" Shortcuts for fugitive.vim plugin
nnoremap <Leader>gs :Gstatus<cr>
nnoremap <Leader>gw :Gwrite<cr>
nnoremap <Leader>gc :Gcommit<cr>
nnoremap <Leader>gd :Gdiff<cr>
"switch back to current file and closes fugitive buffer
nnoremap <Leader>gf :diffoff!<cr><c-w>h:bd<cr>

let g:NERDCustomDelimiters = {
    \ 'python': { 'left': '# ' },
    \ 'enaml': { 'left': '# ' },
\ }
" syntax/python.vim gets run before ftplugin/python.vim, so we must set this
" highlight option in vimrc instead of ftplugin.
let g:python_highlight_all = 1
