scriptencoding utf-8

if has('autocmd')
  augroup Autocmds
    autocmd!
    
    if exists('+colorcolumn')
      autocmd BufEnter * let &l:colorcolumn='+' . join(range(0,254), ',+')
    endif
  augroup END
endif
