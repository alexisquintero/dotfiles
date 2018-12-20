filetype plugin on

set autoread
set nobackup
set cursorline
set directory=~/.config/nvim/private/dir//
set expandtab
set fileencoding=utf-8
set foldlevelstart=1
set hidden
set ignorecase
set list listchars=tab:>-,trail:·
set notagrelative
set number
set omnifunc=syntaxcomplete#Complete
set relativenumber
set ruler
set scrolloff=5
set shiftwidth=2
set showcmd
set showmatch
set smartcase
set softtabstop=2
set splitright
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\
set termguicolors
set undodir=~/.config/nvim/private/undo//
set undofile
set updatetime=100
set wildmode=list:longest

au FocusGained * :checktime

let mapleader = "\<Space>"

nnoremap <C-]> <C-]>zz
nnoremap <C-b> i<CR><ESC>
nnoremap <C-e> 5<C-e>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-p> :Files<CR>
nnoremap <C-t> <C-t>zz
nnoremap <C-y> 5<C-y>
nnoremap <M-p> :Ag<CR>
nnoremap <Leader>* :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
nnoremap <SPACE> <Nop>
nnoremap <leader>F :let @+=@%<CR>
nnoremap <leader>T :CtrlPTag<CR>
nnoremap <leader>f :let @+=expand('%:t')<CR>
nnoremap <leader>h gT
nnoremap <leader>j <C-W>T
nnoremap <leader>j i<CR><ESC>
nnoremap <leader>l gt
nnoremap <leader>p cw<C-r>0<ESC>
nnoremap <silent><C-n> :noh<CR>
nnoremap @ :x<CR>
nnoremap N Nzzzv
nnoremap Q @
nnoremap Y y$
nnoremap / /\v
nnoremap ]l :try<bar>lnext<bar>catch /^Vim\%((\a\+)\)\=:E\%(553\<bar>42\):/<bar>lfirst<bar>endtry<cr>
nnoremap ]h :try<bar>lprev<bar>catch /^Vim\%((\a\+)\)\=:E\%(553\<bar>42\):/<bar>llast<bar>endtry<cr>
nnoremap gb :Buffers<CR>
nnoremap j gj
nnoremap k gk
nnoremap n nzzzv
nnoremap s :Vexplore
nnoremap :g/ :g/\v
nnoremap :g// :g//

inoremap <C-b> <CR>
inoremap <C-e> <ESC>%%a

cnoremap <C-o> <CR>
cnoremap %s/ %smagic/
cnoremap \>s/ \>smagic/

vnoremap / /\v

map <leader>+ :!ctags -R -f ./.git/tags .<CR>

" = VIM PLUG
call plug#begin('~/.local/share/nvim/plugged')
Plug 'roxma/nvim-yarp'
Plug 'neomake/neomake'
Plug 'vim-airline/vim-airline'
Plug 'https://github.com/yuttie/comfortable-motion.vim.git'
Plug 'francoiscabrol/ranger.vim'
Plug 'airblade/vim-gitgutter'
Plug 'joshdick/onedark.vim'
Plug 'airblade/vim-rooter'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
Plug 'gre/play2vim', { 'for': 'scala' }
Plug 'lambdalisue/gina.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'
Plug 'markonm/traces.vim'
Plug 'ap/vim-css-color'
Plug 'machakann/vim-sandwich'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources={}
let g:deoplete#sources._=['buffer', 'member', 'tag', 'file', 'omni', 'ultisnips']
let g:deoplete#omni#input_patterns={}
let g:deoplete#omni#input_patterns.scala='[^. *\t]\.\w*'
" Initialize plugin system
call plug#end()

" Use deoplete
let g:deoplete#enable_at_startup = 1

let g:netrw_banner = 0
let g:netrw_browse_split = 3
let g:netrw_winsize = 25
let g:netrw_liststyle = 3
let g:netrw_altv = 1
let g:netrw_list_hide= '\(^\|\s\s\)\zs\.\S\+'

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='dark'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_mode_map = {
  \ '__' : '-',
  \ 'c'  : 'C',
  \ 'i'  : 'I',
  \ 'ic' : 'I',
  \ 'ix' : 'I',
  \ 'n'  : 'N',
  \ 'ni' : 'N',
  \ 'no' : 'N',
  \ 'R'  : 'R',
  \ 'Rv' : 'R',
  \ 's'  : 'S',
  \ 'S'  : 'S',
  \ ' ' : 'S',
  \ 't'  : 'T',
  \ 'v'  : 'V',
  \ 'V'  : 'V',
  \ '' : 'V',
  \ }
let g:airline#extensions#tabline#buffers_label = 'b'
let g:airline#extensions#tabline#tabs_label = 't'
set noshowmode
let g:airline_extensions = ['whitespace', 'neomake']

let g:ranger_map_keys = 0
let g:ranger_replace_netrw = 1
map <Leader>s :Ranger<CR>

set runtimepath^=~/.local/share/nvim/plugged

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let g:airline_theme='onedark'
colorscheme onedark

let g:neomake_fsc_maker = {
  \ 'errorformat':
    \ '%E%f:%l: error: %m,' .
    \ '%Z%p^,' .
    \ '%E%f:%l: error: %m,' .
    \ '%-C  %.%#,' .
    \ '%C%m,' .
    \ '%Z%p^,' .
    \ '%W%f:%l: warning: %m,' .
    \ '%Z%p^,' .
    \ '%-G%.%#'
  \ }

let g:neomake_scala_enabled_makers = ['fsc']
let g:neomake_javascript_enabled_makers = ['eslint']
autocmd InsertLeave,TextChanged * update | Neomake

function! GetBufferList()
    return filter(range(1,bufnr('$')), 'buflisted(v:val)')
endfunction

function! GetMatchingBuffers(pattern)
    return filter(GetBufferList(), 'bufname(v:val) =~ a:pattern')
endfunction

function! WipeMatchingBuffers(pattern)
    let l:matchList = GetMatchingBuffers(a:pattern)

    let l:count = len(l:matchList)
    if l:count < 1
        echo 'No buffers found matching pattern ' . a:pattern
        return
    endif

    if l:count == 1
        let l:suffix = ''
    else
        let l:suffix = 's'
    endif
    exec 'bd ' . join(l:matchList, ' ')

    echo 'Wiped ' . l:count . ' buffer' . l:suffix . '.'
endfunction

command! -nargs=1 BW call WipeMatchingBuffers('<args>')

let g:rainbow_active = 1
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

let g:scala_scaladoc_indent = 1
au BufRead,BufNewFile *.sbt set filetype=scala

let $FZF_DEFAULT_COMMAND = 'ag -g ""'
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
