setlocal omnifunc=necoghc#omnifunc

let g:necoghc_enable_detailed_browse = 1

autocmd BufWritePost *.hs GhcModCheckAsync

nnoremap <localleader>i :GhcModTypeInsert<CR>
nnoremap <leader>t :GhcModType<CR>
nnoremap <leader>s :GhcModSplitFunCase<CR>
nnoremap <leader>i :GhcModInfo<CR>
