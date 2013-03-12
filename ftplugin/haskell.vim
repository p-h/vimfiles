setlocal omnifunc=necoghc#omnifunc

autocmd BufWritePost *.hs GhcModCheckAndLintAsync

nnoremap <localleader>i :GhcModTypeInsert<CR>
