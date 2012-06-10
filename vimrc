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
"Bundle 'digitaltoad/vim-jade'
Bundle 'drmingdrmer/xptemplate'
Bundle 'ervandew/supertab'
Bundle 'fmoralesc/vim-pad'
Bundle 'fs111/pydoc.vim'
"Bundle 'guileen/vim-node'
"Bundle 'juvenn/mustache.vim'
Bundle 'kien/ctrlp.vim'
"Bundle 'klen/python-mode'
Bundle 'leshill/vim-json'
Bundle 'Lokaltog/vim-powerline'
Bundle 'majutsushi/tagbar'
Bundle 'mileszs/ack.vim'
Bundle 'nsf/gocode', {'rtp': 'vim/'}
Bundle 'nvie/vim-flake8'
Bundle 'othree/html5.vim'
"Bundle 'pangloss/vim-javascript'
Bundle 'Raimondi/delimitMate'
Bundle 'Rip-Rip/clang_complete'
Bundle 'scrooloose/nerdcommenter'
Bundle 'sjl/gundo.vim'
"Bundle 'sontek/rope-vim'
Bundle 'thinca/vim-localrc'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround.git'
Bundle 'matchit.zip'
Bundle 'slimv.vim'
"Bundle 'xolox/vim-lua-ftplugin'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set leader <Leader>
let mapleader = ","

" Always show the statusline
set laststatus=2

" avoid key conflict
let g:SuperTabMappingForward = '<Plug>supertabKey'

" xpt settings
let g:xptemplate_fallback = '<Plug>supertabKey'
let g:xptemplate_vars="$email=phihue@gmail.com&$author=Philippe Huerlimann"
set runtimepath+=~/.vim/xpt_personal

" xpt uses <Tab> as trigger key
let g:xptemplate_key = '<Tab>'

" use <tab>/<S-tab> to navigate through pum. Optional
let g:xptemplate_pum_tab_nav = 1

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
cnoremap vr<CR> tabedit ~/.vim<CR>
nnoremap <leader>c :set relativenumber<CR>
nnoremap <Space> :
nnoremap <F7> :GundoToggle<CR>
nnoremap  <F8> :TagbarToggle<CR>

" local vimrc
call localrc#load('.local.vimrc', getcwd())

" ctrlp should change working directory
let g:ctrlp_working_path_mode = 0
