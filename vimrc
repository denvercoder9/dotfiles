set nocompatible
filetype off

call plug#begin('~/.vim/plugged')
Plug 'vim-flake8'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'moll/vim-bbye'
Plug 'vim-airline/vim-airline'
Plug 'kien/ctrlp.vim'
Plug 'jeetsukumaran/vim-buffergator'
call plug#end()

" always show airline
set laststatus=2   " Always show the statusline

" ctrlp.vim settings
let g:ctrlp_custom_ignore = {
\ 'file': '.pyc$'
\ }
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_cmd = 'CtrlP'

let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']

" vim-buffergator settings
let g:buffergator_suppress_keymaps = 1

" language awareness
syntax on
filetype plugin on
filetype indent on

set ruler               " display ruler at the bottom
set encoding=utf8       " default encoding utf-8
set vb t_vb=            " turn off the annoying bell and flash
set nu                  " set row numbering on
set ignorecase
set hidden              " hidde buffers instead of closing them
set confirm
set backspace=eol,start,indent
"set autochdir
set incsearch
set clipboard+=unnamed
set timeoutlen=200
set wildmenu
set lazyredraw

" colors

colorscheme desert
" no pink completion menu please!
highlight Pmenu ctermbg=238 gui=bold


" tabs and intendation

set expandtab
set autoindent

set tabstop=4
set shiftwidth=4
set softtabstop=4

"set cursorline

"  -------------
"
" Alphabetical list of <leader> mappings
"
" c = comment
" e = toggle nerdtree
" f = toggle buffergator
" h = toggle hlsearch
" i = toggle ignorecase
" j = jedi prefix
" k = split at 80 chars
" n = toggle number
" r = show register content
" s = windo toggle scrollbind
" t = toggle paste
" v = resource .vimrc
" w = trim trailing whitespace
"
" -------------

" key mappings

let mapleader = ","

" external commands
"vmap S :!sort -u<CR>
vmap S :!sort -f<CR>

" c = comment
nmap <Leader>c <Esc>:s/^/#/<CR>
vmap <Leader>c <Esc>: '<, '>s/^/#/<CR>

" x = erase comment
nmap <Leader>x <Esc>:s/^#//<CR>
vmap <Leader>x <Esc>: '<, '>s/^#//<CR>

" a couple of options mappings
nmap <Leader>i :set invignorecase<CR>
nmap <Leader>n :set invnumber<CR>
nmap <Leader>t :set invpaste<CR>
nmap <Leader>h :set invhlsearch<CR>

" registers
nmap <Leader>y "*y
nmap <Leader>d "*d
nmap <Leader>p "*p
nmap <Leader>r :registers<CR>

" buffers
nmap <C-J> :silent bnext<CR>
nmap <C-K> :silent bprev<CR>
"nmap <C-X> :silent bdelete<CR>
nmap <C-X> :silent Bdelete<CR>  " upper-case Bdelete works with Bbye

"nmap < <<       " makes dedenting easier
"nmap > >>       " makes indenting easier
nmap K <Nop>
imap jj <esc>
nmap <Leader>w :%s/\s\+$//g<CR>    " remove trailing whitespace
map <Leader>e :silent NERDTreeToggle<CR>
map <Leader>f :silent BuffergatorToggle<CR>
map <Leader>s :silent windo set scrollbind!<CR>
cmap w!! w !sudo tee %

map <Leader>v :source $MYVIMRC<CR>

" experimental stuff that I try out..
"au BufWinLeave * silent! mkview
"au BufWinEnter * silent! loadview

" pre-fill some buffers

let @i="import ipdb; ipdb.set_trace()"
let @d="import pdb; pdb.set_trace()"
let @u="import pudb; pudb.set_trace()"
let @b="require 'byebug'; byebug"

" the underline trick

let @u="yypVr-"      " underline line
let @k="080lbi\rjj"  " shorten line to 80 chars without breaking words



nmap <Leader>b :CtrlPBuffer<CR>
nmap <Leader>a :CtrlPMixed<CR>


" experimental...
"
abbr sessoin session
abbr magicmock MagicMock
abbr reversation reservation
iabbr soin sion
iabbr toin tion
inoremap soin sion
inoremap toin tion


autocmd FileType python set tabstop=4|set shiftwidth=4
autocmd FileType ruby set tabstop=2|set shiftwidth=2|set softtabstop=2
"au BufEnter *.py set ai sw=4 ts=4 sta et fo=croql

autocmd FileType javascript set tabstop=2|set shiftwidth=2|set softtabstop=2
