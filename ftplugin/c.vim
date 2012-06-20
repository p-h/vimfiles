" Make sure that clang_complete uses the clang library
" and not the executable
let g:clang_library_path="/usr/lib/llvm"
" open quickfix window on error
let g:clang_complete_copen=1
" automatically select the first entry in the popup menu, but
" without inserting it into the code.
let g:clang_auto_select=1
