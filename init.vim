set runtimepath^=/usr/share/vim/vimfiles

autocmd BufRead,BufNewFile *.h set filetype=c

call plug#begin('~/.local/share/nvim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-css-color'
Plug 'avakhov/vim-yaml'
Plug 'dhruvasagar/vim-table-mode'
Plug 'editorconfig/editorconfig-vim'
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
Plug 'neovim/nvim-lspconfig'
Plug 'pbrisbin/html-template-syntax'
Plug 'Raimondi/delimitMate'
Plug 'rhysd/vim-clang-format'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/neosnippet.vim'
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

if has('macunix') " I'm at work
    Plug 'bazelbuild/vim-bazel'
    Plug 'google/vim-maktaba'
    Plug 'Snyssfx/goerr-nvim'
endif

call plug#end()

let g:deoplete#enable_at_startup = 1

let g:tex_flavor = 'latex'

let g:OmniSharp_server_use_mono = 1

let g:ackprg = "rg --vimgrep"

let g:rainbow_active = 1

let g:slime_target = "tmux"
let g:slime_paste_file = tempname()
let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.2"}
let g:slime_bracketed_paste = 1

let mapleader = ","
let maplocalleader = "_"

set laststatus=2

set hidden

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

nnoremap <C-S-N> :NERDTreeToggle<CR>

let g:vista_default_executive = "lcn"
nnoremap <F8> :Vista!!<CR>

nnoremap <F3> :%s/\C\<<C-r><C-w>\>/

nmap ga <Plug>(EasyAlign)

command Vr tabedit ~/.config/nvim/init.vim
command Vt execute "tabedit ~/.config/nvim/ftplugin/" . &filetype . ".vim"

let g:ctrlp_custom_ignore = 'node_modules\|git'
let g:ctrlp_working_path_mode = 0

let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" TODO: find replacement for this mapping
"nmap <buffer> <silent> <F5> <Plug>(lcn-menu)

lua << EOF
local opts = { buffer = bufnr, noremap = true, silent = true }
vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
vim.keymap.set('n', 'gD', vim.lsp.buf.type_definition, opts)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)
vim.keymap.set('n', '<Leader>la', vim.lsp.buf.code_action, opts)
vim.keymap.set('v', '<Leader>la', vim.lsp.buf.code_action, opts)
vim.keymap.set('n', '<Leader>lr', vim.lsp.buf.references)
vim.keymap.set('n', '<Leader>li', vim.lsp.buf.implementation, opts)
vim.keymap.set('n', '<Leader>lf', vim.lsp.buf.format, opts)
vim.keymap.set('n', '<Leader>ls', vim.lsp.buf.document_symbol, opts)
vim.keymap.set('n', '<Leader>lh', vim.lsp.buf.document_highlight, opts)

local util = require 'lspconfig.util'

require'lspconfig'.pylsp.setup{
    cmd = {'pylsp', '-v', '--log-file','/tmp/pyls.log'},
    plugins = {
      pyflakes = {
        enabled = true
      },
      pydocstyle = {
        enabled = true
      },
      black = {
        enabled = true
      },
      flake8 = {
        enabled = true
      }
    },
}
require'lspconfig'.perlpls.setup{cmd = {'nix-shell', '-p', 'perl538Packages.PLS', '--run', 'pls'}}
require'lspconfig'.jdtls.setup{}
require'lspconfig'.ccls.setup{}
require'lspconfig'.rust_analyzer.setup{}
EOF
