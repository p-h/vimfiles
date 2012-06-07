let g:syntastic_python_checker = 'flake8'
set colorcolumn=80
highlight ColorColumn ctermbg=red 

nnoremap <leader>r :!python2 ./manage.py runserver<CR>
nnoremap <leader>f :call Flake8()<CR>
