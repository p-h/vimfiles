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
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'honza/vim-snippets'
Plugin 'kien/ctrlp.vim'
Plugin 'leshill/vim-json'
Plugin 'luochen1990/rainbow'
Plugin 'majutsushi/tagbar'
Plugin 'matchit.zip'
Plugin 'mileszs/ack.vim'
Plugin 'paredit.vim'
Plugin 'pbrisbin/html-template-syntax'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'sirver/ultisnips'
Plugin 'tpope/vim-classpath'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround.git'
Plugin 'vim-scripts/a.vim'

call vundle#end()

let g:ackprg = "ag --vimgrep"

let g:UltiSnipsListSnippets="<c-l>"

let g:rainbow_active = 1

let mapleader = ","
let maplocalleader = "_"

" Always show the statusline
set laststatus=2

let delimitMate_expand_space = 1

" set lines horizontal and vertical line for the cursor
set cursorcolumn
set cursorline

filetype plugin indent on

colorscheme bitterjug

syntax on

set number
set relativenumber

set incsearch
set ignorecase
set smartcase
set hlsearch

set expandtab
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4

set nobackup

set hlsearch

if has('gui_running')
    set guioptions=aAceif
endif

if has("cscope")
    set csto=0
    set cst
    set nocsverb
    if filereadable("cscope.out")
        cs add cscope.out
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set csverb

    "s: Find this C symbol
    "g: Find this definition
    "d: Find functions called by this function
    "c: Find functions calling this function
    "a: Find places where this symbol is assigned a value
    nnoremap <leader>s :cscope find s <cword><CR>
    nnoremap <leader>g :cscope find g <cword><CR>
    nnoremap <leader>d :cscope find d <cword><CR>
    nnoremap <leader>c :cscope find c <cword><CR>
    nnoremap <leader>a :cscope find a <cword><CR>
endif

nnoremap <C-S-N> :NERDTreeToggle<CR>
nnoremap  <F8> :TagbarToggle<CR>
nnoremap <F3> :%s/\C\<<C-r><C-w>\>/

command Vr tabedit ~/.vim/vimrc
command Vt execute "tabedit ~/.vim/ftplugin/" . &filetype . ".vim"

set colorcolumn=100
highlight ColorColumn ctermbg=red

let g:ctrlp_custom_ignore = 'node_modules\|git'
let g:ctrlp_working_path_mode = 0
