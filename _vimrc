z" Gotta be the first setting
set nocompatible
scriptencoding utf-8
set regexpengine=1

source $HOME/.vim/plugged_cfg.vim

"--- General Settings ---
let mapleader = ","
let maplocalleader = ","
set number
if has("mouse")
set mouse=a
endif
set showmode
set spelllang=hu
set fillchars=""

" improved command autocompletion
set wildmenu
set wildmode=list:longest

" smoother performance since we use modern terminals
set ttyfast " check

" see :help fo-table
set formatoptions=qrn1 " check

" file encoding
if has("multi_byte") " check
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "setglobal bomb
  "set fileencodings=ucs-bom,utf-8,latin1
endif

set wildignore+=*.o,*.obj,*.class,*.pyc,*.so,*.swp,*.zip,*.jpg,*.gif,*.png,*.pdf
set wildignore+=.git,.hg,.svn,DS_STORE,bower_components,node_modules,target

set t_Co=256 " check
set cc=81 " check

filetype plugin indent on

" Tabbing
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Searching -- override sensible
set wrapscan
set ignorecase
set smartcase
set hlsearch

" Wrapping
set textwidth=80
set nowrap

" Mapping
nmap <leader>v :tabedit $MYVIMRC<CR> " open vimrc file in a new tab

nnoremap <leader><space> :nohlsearch<CR> " clear search highlight

" highlight cursor position
nnoremap <leader>c :setlocal cursorline! cursorcolumn!<CR>

" spell check
nmap <silent><leader>s :setlocal spell! spell?<CR>

" [Shortcuts "navigation"]
nmap <silent> <leader>a :bp<CR>
nmap <silent> <leader>d :bn<CR>
" Close the current buffer and move to the previous one
nmap <silent> <leader>bq :bp <BAR> bd #<CR>
nmap <silent> <leader>p :CtrlP<CR>
nmap <silent> <leader>bb :CtrlPBuffer<cr>
nmap <silent> <leader>bm :CtrlPMixed<cr>
nmap <silent> <leader>bs :CtrlPMRU<cr>
nmap <silent> <leader>sn :lnext<cr>

" Look and Feel
colorscheme solarized
" removes modelines (best practices, they're apparently a security exploit)
set modelines=0
if has('gui_running')
  set guifont=Consolas:h11
  set guifontwide="Courier New":h10 " Windows mixed chracter sets
  set go=-T " no taskbar
endif
if !has('gui_running')
  set term=xterm
  let &t_AB="\e[48;5;%dm"
  let &t_AF="\e[38;5;%dm"
endif

highlight NonText guifg=#4a4a59 " check
highlight SpecialKey guifg=#4a4a59

" keeps a buffer above and below line when scrolling
set scrolloff=3 " check
" smarter indenting
set autoindent " check

" instead of dinging, flash cursor
set visualbell

" underline cursor line
set cursorline " check

" check all
set ruler
set number
set incsearch
set showmatch
set hlsearch

"--- Filetype settings

"--- Plugin settings ---
"-- solarized
set background=dark
if has('win32')
  let g:solarized_underline=0
endif
let g:solarized_termtrans=1
"-- airline
" Show PASTE if in paste mode
let g:airline_detect_paste=1

" Show airline for tabs too
let g:airline#extensions#tabline#enabled = 1

" Tabline shows just the filenames
let g:airline#extensions#tabline#fnamemod = ':t'
"-- ctrlp

let g:ctrlp_custom_ignore = {
      \ 'dir': '\v[\/](\.git|\.svn|target)$',
      \ 'file': '\v\.(exe|so|dll|class|jar|war|png|jpg|jpeg|bmp|gif)$'
      \}
"-- gitgutter
hi clear SignColumn
let g:airline#extensions#hunks#non_zero_only = 1
"-- Nerdtree
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_console_startup = 0
let NERDTreeIgnore=['\.vim$', '\.git$', 'target$', '\~$']
"-- NerdCommmenter
nmap <silent> <leader>ct <plug>NERDComToggleComment<CR>
"--- Syntastic
highlight SyntasticErrorSign guifg=white guibg=red
highlight SyntasticErrorLine guibg=red
let g:syntastic_debug = 0
let g:syntastic_echo_current_error=1
let g:syntastic_check_on_open = 0
let g:syntastic_enable_signs = 1
let g:syntastic_enable_ballons = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_error_symbol = 'E'
let g:syntastic_warning_symbol = "W"
" let g:syntastic_xml_xmllint_exec = "c:\\dev\\opt\\xsltproc-1.1.26\\xmllint.exe"
" let g:syntastic_xml_checkers = ['xmllint']

" let g:syntastic_html_tidy_exec = "c:\\dev\\opt\\tidy-5.1.14-64\\bin\\tidy.exe"
" let g:syntastic_html_checkrs = [ 'tidy' ]

" let g:syntastic_javascript_jshint_exec = "c:\\dev\\opt\\nodejs-5.0.0-64\\jshint.cmd"
" let g:syntastic_javascript_checkers = ['jshint']

" let g:syntastic_java_checkers = ['checkstyle']
" let g:syntastic_java_maven_executable = "c:\\dev\\bin\\mvn.cmd"
" let g:syntastic_java_checkstyle_classpath="c:\\dev\\opt\\checkstyle-6.11.2\\checkstyle-6.11.2-all.jar"

let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
let g:syntastic_mode_map = { 'mode': 'active',
      \ 'active_filetypes': [ 'html', 'ruby', 'java', 'javascript'],
      \ 'passive_filetypes': ['xml'] }

augroup syntastic_settings
  au!
  au FileType html let b:syntastic_mode = "passive"
augroup END
" -- rooter plugin
let g:rooter_patterns = ['pom.xml', '.git/']
"--- tagbar
nmap <silent> <leader>o :TagbarToggle<CR>

"--- vim-maven-pugin
" nmap <silent> <leader>mt :Mvn -q test -Dtest=%:t:r -DfailIfNoTests=true<CR>
" nmap <silent> <leader>mc :Mvn -q compile<CR>

"--- UtliSnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<leader>x"
let g:UltiSnipsJumpBackwardTrigger="<leader>z"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
