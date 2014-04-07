set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'vim-flake8'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'Lokaltog/vim-powerline' 
Bundle 'kien/ctrlp.vim'
Bundle 'jeetsukumaran/vim-buffergator'

"Bundle 'davidhalter/jedi-vim'

" vim-powerline settings
set laststatus=2   " Always show the statusline
set t_Co=256

" ctrlp.vim settings
let g:ctrlp_custom_ignore = {
\ 'file': '.pyc$'
\ }
let g:ctrlp_working_path_mode = ''

" vim-buffergator settings
let g:buffergator_suppress_keymaps = 1

" jedi-vim settings
"let g:jedi#popup_on_dot = 0
"let g:jedi#popup_select_first = 0
"let g:jedi#use_tabs_not_buffers = 0
"autocmd FileType python setlocal completeopt-=preview

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

" tabs and intendation

set textwidth=80
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent

"  -------------
"
" Alphabetical list of <leader> mappings
"
" c = comment
" e = toggle nerdtree
" f = toggle buffergator
" h = toggle hlsearch
" i = toggle ignorecase
" n = toggle number
" t = toggle paste
" w = trim trailing whitespace
"
" -------------

" key mappings

let mapleader = ","

" external commands
vmap S :!sort -u<CR>

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

" buffers
nmap <C-J> :silent bnext<CR>
nmap <C-K> :silent bprev<CR>
nmap <C-X> :silent bdelete<CR>

nmap K <Nop>
imap jj <esc>
nmap <Leader>w :%s/\s\+$//g<CR>    " remove trailing whitespace
map <Leader>e :silent NERDTreeToggle<CR>
map <Leader>f :silent BuffergatorToggle<CR>
cmap w!! w !sudo tee %

" experimental stuff that I try out..
"au BufWinLeave * silent! mkview
"au BufWinEnter * silent! loadview

" pre-fill some buffers

let @d="import ipdb; ipdb.set_trace()"
