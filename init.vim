set runtimepath^=/usr/share/vim/vimfiles

call plug#begin('~/.local/share/nvim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-css-color'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
Plug 'avakhov/vim-yaml'
Plug 'bitterjug/vim-colors-bitterjug'
Plug 'dhruvasagar/vim-table-mode'
Plug 'honza/vim-snippets'
Plug 'junegunn/vim-easy-align'
Plug 'kien/ctrlp.vim'
Plug 'lervag/vimtex'
Plug 'leshill/vim-json'
Plug 'luochen1990/rainbow'
Plug 'majutsushi/tagbar'
Plug 'mileszs/ack.vim'
Plug 'OmniSharp/omnisharp-vim'
Plug 'pbrisbin/html-template-syntax'
Plug 'Raimondi/delimitMate'
Plug 'rhysd/vim-clang-format'
Plug 'rust-lang-nursery/rls'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'sirver/ultisnips'
Plug 'tpope/vim-classpath'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/a.vim'
Plug 'vim-scripts/matchit.zip'
Plug 'vim-scripts/paredit.vim'
Plug 'w0rp/ale'

call plug#end()

let g:deoplete#enable_at_startup = 1

let g:OmniSharp_server_use_mono = 1

let g:ackprg = "ag --vimgrep"

let g:UltiSnipsListSnippets="<c-l>"

let g:rainbow_active = 1

let mapleader = ","
let maplocalleader = "_"

set laststatus=2

set hidden

let g:LanguageClient_serverCommands = {
    \ 'haskell': ['hie-wrapper'],
    \ 'python': ['pyls'],
    \ 'rust': ['rustup', 'run', 'stable', 'rls'],
    \}

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
nnoremap <silent> <M-CR> call LanguageClient#textDocument_codeAction()<CR>

let delimitMate_expand_space = 1

set cursorcolumn
set cursorline

colorscheme bitterjug

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
nnoremap <F8> :TagbarToggle<CR>
nnoremap <F3> :%s/\C\<<C-r><C-w>\>/

nmap ga <Plug>(EasyAlign)

command Vr tabedit ~/.config/nvim/init.vim
command Vt execute "tabedit ~/.config/nvim/ftplugin/" . &filetype . ".vim"

set colorcolumn=100
highlight ColorColumn ctermbg=red

let g:ctrlp_custom_ignore = 'node_modules\|git'
let g:ctrlp_working_path_mode = 0
