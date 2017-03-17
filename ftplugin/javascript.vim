function! FormatFile()
    let l:lines="all"
    pyf /usr/share/clang/clang-format.py
endfunction

nnoremap <leader>f :call FormatFile()<cr>

