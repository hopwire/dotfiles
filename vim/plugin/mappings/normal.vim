nnoremap Q <Nop>

nnoremap <silent> - :silent edit <C-R>=empty(expand('%')) ? '.' : expand('%:p:h')<CR><CR>
