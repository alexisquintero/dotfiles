set hlsearch
set ignorecase
set smartcase
set showmatch
set incsearch
set number
set relativenumber
set ruler
set splitbelow
set splitright
set scrollbind
set nocompatible
set encoding=utf-8
set fileencoding=utf-8
set cursorline
set scrolloff=5
set lazyredraw
set showcmd
set showmode
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

syntax on

nnoremap <SPACE> <Nop>
let mapleader = "\<Space>"
nnoremap Q @
nnoremap @ :x<CR>
nnoremap <C-j> i<CR><ESC>
nnoremap <leader>p cw<C-r>0<ESC>
nnoremap <silent><C-n> :noh<CR>
nnoremap Y y$
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <leader>f :let @+=expand('%:t')<CR>
nnoremap <leader>F :let @+=@%<CR>
nnoremap j gj
nnoremap k gk
nnoremap n nzzzv
nnoremap N Nzzzv

cnoremap <C-o> <CR>

let g:netrw_banner = 0
let g:netrw_browse_split = 3
let g:netrw_winsize = 25
let g:netrw_liststyle = 3
let g:netrw_altv = 1
let g:netrw_list_hide= '\(^\|\s\s\)\zs\.\S\+'

" Run Ctags and save file on .git folder
nnoremap <F12> :!ctags -R -f ./.git/tags .

call plug#begin('~/.vim/plugged')
Plug 'https://github.com/ajh17/Spacegray.vim.git'
Plug 'https://github.com/yuttie/comfortable-motion.vim.git'
Plug 'vim-airline/vim-airline'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'derekwyatt/vim-scala'
call plug#end()

colorscheme spacegray
