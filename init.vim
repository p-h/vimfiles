set runtimepath^=/usr/share/vim/vimfiles

autocmd BufRead,BufNewFile *.h set filetype=c

call plug#begin('~/.local/share/nvim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-css-color'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
Plug 'avakhov/vim-yaml'
Plug 'dhruvasagar/vim-table-mode'
Plug 'editorconfig/editorconfig-vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'jpalardy/vim-slime'
Plug 'junegunn/vim-easy-align'
Plug 'kien/ctrlp.vim'
Plug 'lervag/vimtex'
Plug 'leshill/vim-json'
Plug 'liuchengxu/vista.vim'
Plug 'LnL7/vim-nix'
Plug 'luochen1990/rainbow'
Plug 'mileszs/ack.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'pbrisbin/html-template-syntax'
Plug 'Raimondi/delimitMate'
Plug 'rhysd/vim-clang-format'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/neosnippet.vim'
Plug 'Snyssfx/goerr-nvim'
Plug 'tpope/vim-classpath'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-perl/vim-perl', { 'for': 'perl', 'do': 'make clean carp dancer highlight-all-pragmas moose test-more try-tiny' }
Plug 'vim-scripts/a.vim'
Plug 'vim-scripts/matchit.zip'
Plug 'vim-scripts/paredit.vim'
Plug 'vim-syntastic/syntastic'

call plug#end()

let g:deoplete#enable_at_startup = 1

let g:tex_flavor = 'latex'

let g:OmniSharp_server_use_mono = 1

let g:ackprg = "rg --vimgrep"

let g:rainbow_active = 1

let g:slime_target = "tmux"
let g:slime_paste_file = tempname()
let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.2"}

let mapleader = ","
let maplocalleader = "_"

set laststatus=2

set hidden

let g:LanguageClient_settingsPath = expand('~/.config/nvim/settings.json')
let g:LanguageClient_serverCommands = {
    \ 'c': ['ccls', '--log-file=/tmp/ccls.log'],
    \ 'cpp': ['ccls', '--log-file=/tmp/ccls.log'],
    \ 'java': ['jdtls'],
    \ 'go': ['gopls'],
    \ 'haskell': ['hie-wrapper', '-d', '-l', '/tmp/hie.log'],
    \ 'perl': ['perl', '-MPerl::LanguageServer', '-e', 'Perl::LanguageServer::run'],
    \ 'python': ['pyls', '-v', '--log-file','/tmp/pyls.log'],
    \ 'rust': ['rust-analyzer'],
    \}

function LC_maps()
    if has_key(g:LanguageClient_serverCommands, &filetype)
        nmap <buffer> <silent> <F5> <Plug>(lcn-menu)
        nmap <buffer> <silent> K <Plug>(lcn-hover)
        nmap <buffer> <silent> gd <Plug>(lcn-definition)
        nmap <buffer> <silent> <F2> <Plug>(lcn-rename)
        nmap <buffer> <silent> gD <Plug>(lcn-type-definition)
        nmap <buffer> <silent><Leader>la <Plug>(lcn-code-action)
        vmap <buffer> <silent><Leader>la <Plug>(lcn-code-action)
        nmap <buffer> <silent><Leader>lr <Plug>(lcn-references)
        nmap <buffer> <silent><Leader>lf <Plug>(lcn-format)
        nmap <buffer> <silent><Leader>ls <Plug>(lcn-symbols)
        nmap <buffer> <silent><Leader>lh <Plug>(lcn-highlight)
    endif
endfunction

autocmd FileType * call LC_maps()

imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

let delimitMate_expand_space = 1

set cursorcolumn
set cursorline

colorscheme jellybeans

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
set nofixendofline

set hlsearch

nnoremap <C-S-N> :NERDTreeToggle<CR>

let g:vista_default_executive = "lcn"
nnoremap <F8> :Vista!!<CR>

nnoremap <F3> :%s/\C\<<C-r><C-w>\>/

nmap ga <Plug>(EasyAlign)

command Vr tabedit ~/.config/nvim/init.vim
command Vt execute "tabedit ~/.config/nvim/ftplugin/" . &filetype . ".vim"

set colorcolumn=80
highlight ColorColumn ctermbg=red

let g:ctrlp_custom_ignore = 'node_modules\|git'
let g:ctrlp_working_path_mode = 0

let g:EditorConfig_exclude_patterns = ['fugitive://.*']
