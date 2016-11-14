let g:clang_complete_copen=1
let g:clang_auto_select=1

function FormatFile()
    let l:lines="all"
    pyf /usr/share/clang/clang-format.py
endfunction

nnoremap <leader>f :call FormatFile()<cr>
