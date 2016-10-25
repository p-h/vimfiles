" Vundle setup
set nocompatible
filetype off

" make vundle use git:// instead of http{,s}://
" makes things a lot faster
let g:vundle_default_git_proto = 'git'
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" Bundles to install
" let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

" Plugins
" The ones that I currently don't use are commented out
Plugin 'ap/vim-css-color'
Plugin 'avakhov/vim-yaml'
Plugin 'bitterjug/vim-colors-bitterjug'
Plugin 'davidhalter/jedi-vim'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'eagletmt/neco-ghc'
Plugin 'honza/vim-snippets'
Plugin 'kien/ctrlp.vim'
Plugin 'leshill/vim-json'
Plugin 'luochen1990/rainbow'
Plugin 'majutsushi/tagbar'
Plugin 'matchit.zip'
Plugin 'nsf/gocode', {'rtp': 'vim/'}
Plugin 'othree/html5.vim'
Plugin 'paredit.vim'
Plugin 'pbrisbin/html-template-syntax'
Plugin 'Raimondi/delimitMate'
Plugin 'Rip-Rip/clang_complete'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Shougo/vimproc'
Plugin 'sirver/ultisnips'
Plugin 'tpope/vim-classpath'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround.git'

call vundle#end()

let g:rainbow_active = 1

" set leader and local leader
let mapleader = ","
let maplocalleader = "_"

" Always show the statusline
set laststatus=2

let delimitMate_expand_space = 1

" set lines horizontal and vertical line for the cursor
set cursorcolumn
set cursorline

" turn on filetype specific stuff
filetype plugin indent on

colorscheme bitterjug
set background=light

syntax on

" turn on those nice numbers on the left side
set number

" and make them relative
set relativenumber

"Incremental search
set incsearch

" smartsearch
set ignorecase
set smartcase

" tab settings
set expandtab
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4

set nobackup

" gui options
if has('gui_running')
    set guioptions=aAceif
endif

" Bindings
nnoremap  <F8> :TagbarToggle<CR>

" user defined commands
command Vr tabedit ~/.vim/vimrc
command Vt execute "tabedit ~/.vim/ftplugin/" . &filetype . ".vim"

" ctrlp should change working directory
let g:ctrlp_working_path_mode = 0
