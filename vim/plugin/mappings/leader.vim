" Leader mappings

" Open last buffer
nnoremap <Leader><Leader> <C-^>

" Make only buffer
nnoremap <Leader>o :only<CR>

" Quit and save
nnoremap <Leader>q :quit<CR>
nnoremap <Leader>w :write<CR>

" show current file path
nnoremap <Leader>p :echo expand('%')<CR>

" Zap trailing whitespace
nnoremap <silent> <Leader>zz :call mappings#zap()<CR>

map <leader>n :NERDTreeToggle<CR>

nnoremap <silent> <LocalLeader>c :syntax sync fromstart<CR>
