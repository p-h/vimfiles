let g:syntastic_python_checker = 'flake8'

nnoremap <leader>r :!python2 ./manage.py runserver<CR>
nnoremap <leader>f :call Flake8()<CR>
