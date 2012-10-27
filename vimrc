" Vundle setup
set nocompatible
filetype off

" make vundle use git:// instead of http{,s}://
" makes things a lot faster
let g:vundle_default_git_proto = 'git'
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Bundles to install
" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" Plugins
" The ones that I currently don't use are commented out
Bundle 'altercation/vim-colors-solarized'
Bundle 'ap/vim-css-color'
Bundle 'avakhov/vim-yaml'
Bundle 'eagletmt/ghcmod-vim'
Bundle 'fmoralesc/vim-pad'
Bundle 'fs111/pydoc.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'leshill/vim-json'
Bundle 'Lokaltog/vim-powerline'
Bundle 'majutsushi/tagbar'
Bundle 'mileszs/ack.vim'
Bundle 'Nemo157/glsl.vim'
Bundle 'nsf/gocode', {'rtp': 'vim/'}
Bundle 'nvie/vim-flake8'
Bundle 'othree/html5.vim'
"Bundle 'pangloss/vim-javascript'
Bundle 'Raimondi/delimitMate'
Bundle 'Rip-Rip/clang_complete'
Bundle 'scrooloose/nerdcommenter'
Bundle 'Shougo/vimproc'
Bundle 'sjl/gundo.vim'
Bundle 'thinca/vim-localrc'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround.git'
Bundle 'Twinside/vim-hoogle'
Bundle 'ujihisa/neco-ghc'
Bundle 'matchit.zip'
Bundle 'slimv.vim'

" set leader <Leader>
let mapleader = ","

" Always show the statusline
set laststatus=2

" powerline settings
let g:Powerline_symbols = 'unicode'
" Sadly I can't get this costum font to work
"let g:Powerline_symbols = 'fancy' 

" Delimate settings
" expand newline and spaces
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

" set lines horizontal and vertical line for the cursor
set cursorcolumn
set cursorline

" turn on filetype specific stuff
filetype plugin indent on

" colors
" solarized.vim exists
let g:solarized_termcolors=256
colorscheme solarized
set background=dark

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

" folding
set foldmethod=syntax

" tab settings
set expandtab
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" gui options
if has('gui_running')
    set guioptions=aAceif
endif

" Bindings
nnoremap <leader>c :set relativenumber<CR>
nnoremap <Space> :
nnoremap <F7> :GundoToggle<CR>
nnoremap  <F8> :TagbarToggle<CR>

inoremap jj <Esc>

" user defined commands
command Vr tabedit ~/.vim/vimrc

" local vimrc
call localrc#load('.local.vimrc', getcwd())

" ctrlp should change working directory
let g:ctrlp_working_path_mode = 0
