setlocal omnifunc=necoghc#omnifunc

autocmd BufWritePost *.hs GhcModCheckAndLintAsync

nnoremap <leader>i :GhcModTypeInsert<CR>
