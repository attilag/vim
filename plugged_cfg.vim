"--- Plugins ---
call plug#begin('$HOME/.vim/plugged')
"-- general settgins
Plug 'tpope/vim-sensible'
"-- colors/themes
Plug 'altercation/vim-colors-solarized'
Plug 'bling/vim-airline'
"-- general tools
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'scrooloose/syntastic'
Plug 'airblade/vim-gitgutter' " git show
Plug 'tpope/vim-fugitive' " git support
Plug 'junegunn/vim-easy-align'
Plug 'kien/ctrlp.vim'
Plug 'airblade/vim-rooter'
"-- developer tools
Plug 'scrooloose/nerdcommenter' " commenter 
Plug 'majutsushi/tagbar' " local tagbar
" Javasrcipt
Plug 'pangloss/vim-javascript' " better syntax highlihght
Plug 'marijnh/tern_for_vim' " javasrcipt tag
Plug 'burnettk/vim-angular' " AngularJS
Plug 'maksimr/vim-jsbeautify' " reformat
Plug 'einars/js-beautify' " js-beauty app
" Java
Plug 'mikelue/vim-maven-plugin'
" C++
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'rhysd/vim-clang-format'
Plug 'vim-scripts/stlrefvim'
" Makdown
Plug 'vim-pandoc/vim-pandoc-syntax'
call plug#end()

