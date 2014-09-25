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
Bundle 'moll/vim-bbye'
Bundle 'davidhalter/jedi-vim'

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

" jedi stuff

"let g:jedi#documentation_command="<leader>jd"
let g:jedi#rename_command="<leader>jr"
let g:jedi#usages_command="<leader>ju"
let g:jedi#popup_on_dot=0
let g:jedi#use_tabs_not_buffers = 0
autocmd FileType python setlocal completeopt-=preview   " get rid of stupid doc window



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

if &filetype =~ 'python'
    set textwidth=80
endif
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
" j = jedi prefix
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
nmap <Leader>r :registers<CR>

" buffers
nmap <C-J> :silent bnext<CR>
nmap <C-K> :silent bprev<CR>
"nmap <C-X> :silent bdelete<CR>
nmap <C-X> :silent Bdelete<CR>  " upper-case Bdelete works with Bbye

nmap ' "        " makes use of registers easiert
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
let @d="import pudb; pudb.set_trace()"

cd ~/Documents
