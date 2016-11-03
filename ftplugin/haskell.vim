set tabstop=8                   "A tab is 8 spaces
set expandtab                   "Always uses spaces instead of tabs
set softtabstop=4               "Insert 4 spaces when tab is pressed
set shiftwidth=4                "An indent is 4 spaces
set shiftround                  "Round indent to nearest shiftwidth multiple

setlocal omnifunc=necoghc#omnifunc

let g:necoghc_enable_detailed_browse = 1

autocmd BufWritePost *.hs GhcModCheckAsync

nnoremap <localleader>i :GhcModTypeInsert<CR>
nnoremap <leader>t :GhcModType<CR>
nnoremap <leader>s :GhcModSplitFunCase<CR>
nnoremap <leader>i :GhcModInfo<CR>
