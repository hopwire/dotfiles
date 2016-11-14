" self explanatory
let g:NERDTreeWinSize=40
let g:NERDTreeMinimalUI=1

" Let <leader><leader> return from nerdtree
let g:NERDTreeCreatePrefix='silent keepalt keepjumps'

if has('autocmd')
  augroup alexNERDTree
    autocmd!
    autocmd User NERDTreeInit call autocmds#attempt_select_last_file()
  augroup END
endif
