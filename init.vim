filetype plugin indent on

set nobackup
set cc=120
set cursorline
set directory=~/.config/nvim/private/dir//
set expandtab
set fileencoding=utf-8
set foldlevelstart=1
set gdefault
set hidden
set ignorecase
set inccommand=nosplit
set list listchars=tab:>-,trail:·
set noequalalways
set notagrelative
set number
set ofu=syntaxcomplete#Complete
set scrolloff=5
set shiftwidth=2
set showcmd
set showmatch
set sidescrolloff=3
set smartcase
set softtabstop=2
set splitbelow
set splitright
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\
set tagcase=smart
set tags=.git/tags
  au FileType scala set tags=.git/scala-tags
  au FileType javascript set tags=.git/javascript-tags
  au FileType css set tags =.git/css-tags
set termguicolors
set undodir=~/.config/nvim/private/undo//
set undofile
set updatetime=100
set wildmode=list:longest
set wrapscan

au FocusGained * :checktime

let mapleader = "\<Space>"

nnoremap <C-]> <C-]>zz
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
nnoremap <leader>f :let @+=expand('%:t')<CR>
nnoremap <leader>q :ptjump <C-r><C-w><CR>
nnoremap <leader>Q :pclose<CR>
nnoremap <silent><C-n> :noh<CR>
nnoremap @ :x<CR>
nnoremap N Nzzzv
nnoremap Q @
nnoremap Y y$
nnoremap ]l :try<bar>lnext<bar>catch /^Vim\%((\a\+)\)\=:E\%(553\<bar>42\):/<bar>lfirst<bar>endtry<cr>
nnoremap ]h :try<bar>lprev<bar>catch /^Vim\%((\a\+)\)\=:E\%(553\<bar>42\):/<bar>llast<bar>endtry<cr>
nnoremap gb :Buffers<CR>
nnoremap j gj
nnoremap k gk
nnoremap n nzzzv
nnoremap <leader>bf :exe ':silent !firefox %'<CR>
nnoremap <leader>bc :exe ':silent !google-chrome %'<CR>
nnoremap <leader>bC :exe ':silent !chromium-browser %'<CR>
nnoremap <leader>bo :exe ':silent !opera %'<CR>

cnoremap <C-o> <CR>
cnoremap <C-a> <Home>
cnoremap <C-b> <Left>
cnoremap <C-d> <Del>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>
cnoremap <C-y> <C-r>*
cnoremap <C-g> <C-c>
cnoremap sudow w !sudo tee % >/dev/null

tnoremap <Esc> <C-\><C-n>

nnoremap <leader>+ :!ctags -R -f ./.git/tags .<CR>
  au FileType scala map <leader>+ :!ctags -R -f ./.git/scala-tags --languages=scala .<CR>
  au FileType javascript map <leader>+ :!ctags -R -f ./.git/javascript-tags --languages=javascript .<CR>
  au FileType css map <leader>+ :!ctags -R -f ./.git/css-tags --languages=css .<CR>

command! PrettifyJson %!python -m json.tool

call plug#begin('~/.local/share/nvim/plugged')
Plug 'neomake/neomake'
Plug 'vim-airline/vim-airline'
Plug 'yuttie/comfortable-motion.vim'
Plug 'airblade/vim-gitgutter'
Plug 'mhartington/oceanic-next'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'jvican/vim-scala', { 'for': 'scala' }
Plug 'gre/play2vim'
Plug 'ensime/ensime-vim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-speeddating'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ap/vim-css-color', { 'for': 'css' }
Plug 'groenewege/vim-less', { 'for': [ 'sass', 'less' ] }
Plug 'tommcdo/vim-lion'
Plug 'romainl/vim-cool'
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'Valloric/MatchTagAlways'
Plug 'mboughaba/i3config.vim' "set ft=i3config
Plug 'qpkorr/vim-bufkill'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources={}
let g:deoplete#sources._=['buffer', 'member', 'tag', 'file', 'omni', 'ultisnips']
let g:deoplete#omni#input_patterns={}
let g:deoplete#omni#input_patterns.scala = ['[^. *\t0-9]\.\w*',': [A-Z]\w', '[\[\t\( ][A-Za-z]\w*']
let g:deoplete#auto_complete_start_length = 1
"let g:deoplete#omni#input_patterns.scala='[^. *\t]\.\w*'
" Initialize plugin system
call plug#end()

" Use deoplete
let g:deoplete#enable_at_startup = 1

let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_winsize = 25
let g:netrw_liststyle = 3
let g:netrw_altv = 1
let g:netrw_list_hide= '\(^\|\s\s\)\zs\.\S\+'

let g:airline#extensions#tabline#enabled = 1
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
  \ ' '  : 'S',
  \ 't'  : 'T',
  \ 'v'  : 'V',
  \ 'V'  : 'V',
  \ ''   : 'V',
  \ }
let g:airline#extensions#tabline#buffers_label = 'b'
let g:airline#extensions#tabline#tabs_label = 't'
set noshowmode
function! AirlineInit()
  let g:airline_section_x = airline#section#create(['%{SpinnerText()}', 'filetype'])
endfunction
autocmd VimEnter * call AirlineInit()
let g:airline_extensions = ['whitespace', 'neomake']

set runtimepath^=~/.local/share/nvim/plugged

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let g:airline_theme='oceanicnext'
colorscheme OceanicNext
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1

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

let g:neomake_sbt_maker = {
  \ 'exe': 'sbt',
  \ 'args': ['-Dsbt.log.noformat=true', 'compile'],
  \ 'append_file': 0,
  \ 'auto_enabled': 1,
  \ 'output_stream': 'stdout',
  \ 'errorformat':
    \ '%E[error]\ %f:%l:\ %m,' .
      \ '%-Z[error]\ %p^,' .
      \ '%-C[error]   %.%#,' .
      \ '%C[error]%m,' .
      \ '%-G%.%#'
\ }

"let g:neomake_scala_enabled_makers = ['fsc']
"let g:neomake_scala_enabled_makers = ['sbt']
let g:neomake_javascript_enabled_makers = ['eslint']
let s:eslint_path = system('PATH=$(npm bin):$PATH && which eslint')
let g:neomake_javascript_eslint_exe = substitute(s:eslint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
"au BufWritePost *.scala, *.scala.html * Neomake! sbt
autocmd InsertLeave,TextChanged * update | Neomake


let s:spinner_index = 0
let s:active_spinners = 0
let s:spinner_states = ['■', '□', '▪', '▫', '▪', '□', '■']

function! StartSpinner()
    let b:show_spinner = 1
    let s:active_spinners += 1
    if s:active_spinners == 1
        let s:spinner_timer = timer_start(1000 / len(s:spinner_states), 'SpinSpinner', {'repeat': -1})
    endif
endfunction

function! StopSpinner()
    let b:show_spinner = 0
    let s:active_spinners -= 1
    if s:active_spinners == 0
        :call timer_stop(s:spinner_timer)
    endif
endfunction

function! SpinSpinner(timer)
    let s:spinner_index = float2nr(fmod(s:spinner_index + 1, len(s:spinner_states)))
    redraw
endfunction

function! SpinnerText()
    if get(b:, 'show_spinner', 0) == 0
        return " "
    endif

    return s:spinner_states[s:spinner_index]
endfunction

augroup neomake_hooks
    au!
    autocmd User NeomakeJobInit :call StartSpinner()
    autocmd User NeomakeJobInit :echom "Build started"
    autocmd User NeomakeFinished :call StopSpinner()
    " autocmd User NeomakeFinished :echom "Build complete"
augroup END

let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

let g:scala_scaladoc_indent = 1
au BufRead,BufNewFile *.sbt set filetype=scala

let $FZF_DEFAULT_COMMAND = 'ag -g ""'
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

augroup clipboard
  autocmd!
  autocmd TextYankPost *
    \  if v:event.regname==''&&v:event.operator=='y'
    \|   let @+=join(v:event.regcontents, "\n")
    \| endif
augroup END

let g:gina#command#blame#formatter#format="%au %su%=on %ti %ma%in"

"autocmd FileType javascript setlocal ts=4 sts=4 sw=4
autocmd FileType scala setlocal foldmethod=indent include=^\\s*\\(from\\\|import\\) includeexpr=substitute(v:fname,'\\.','/','g')

" Ensime
let g:ensime_server_v2=1

nnoremap <leader>t :EnType<CR>
nnoremap <leader>gd :EnDeclaration<CR>

"source https://github.com/neomake/neomake/commit/972cc885d39c6c36084220cf628692ac2053284e#diff-0e9135380aa33290cc5014283dae898aR313
let g:ensime_maker = {'name': 'Ensime'}
function! g:ensime_maker.get_list_entries(jobinfo) abort
  return b:ensime_notes
endfunction
"https://github.com/ensime/ensime-vim/blob/ee9519335feced0df213da0a929e96329cf08958/ensime_shared/editor.py#L358
"ensime only populates b:ensime_notes if it detects Syntastic
command! -nargs=1 SyntasticCheck execute "call neomake#Make(1, [g:ensime_maker])"
function! Ensime_retypecheck() abort
  let b:ensime_notes=[]
  exe "SyntasticCheck ensime"
  exe "EnTypeCheck"
endfunction
autocmd BufWritePost *.scala call Ensime_retypecheck()
"let g:neomake_scala_enabled_makers = []

let g:CoolTotalMatches = 1

let g:deoplete#sources#ternjs#timeout = 1
let g:deoplete#sources#ternjs#types = 1
let g:deoplete#sources#ternjs#depths = 1
let g:deoplete#sources#ternjs#docs = 1
let g:deoplete#sources#ternjs#case_insensitive = 1
let g:deoplete#sources#ternjs#sort = 0
let g:deoplete#sources#ternjs#omit_object_prototype = 0
let g:deoplete#sources#ternjs#include_keywords = 1
let g:deoplete#sources#ternjs#filetypes = [
  \ 'jsx',
  \ 'javascript.jsx',
  \ 'vue',
  \ '...'
  \ ]
