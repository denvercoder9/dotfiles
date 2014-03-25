set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'vim-flake8'
"Bundle 'scrooloose/nerdcommenter'
"Bundle 'tpope/vim-surround'
"Bundle 'davidhalter/jedi-vim'

Bundle 'Lokaltog/vim-powerline' 
set laststatus=2   " Always show the statusline
set t_Co=256

Bundle 'kien/ctrlp.vim'
let g:ctrlp_custom_ignore = {
\ 'file': '.pyc$'
\ }

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
set timeoutlen=300
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
cmap w!! w !sudo tee %

" experimental stuff that I try out..
"au BufWinLeave * silent! mkview
"au BufWinEnter * silent! loadview

" pre-fill some buffers

let @d="import ipdb; ipdb.set_trace()"
