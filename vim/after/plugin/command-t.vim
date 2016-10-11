" Mappings
nmap <unique> <Leader>h <Plug>(CommandTHelp)

" Buffer/split/tab reuse
function! s:BufHidden(buffer)
  let bufno = bufnr(a:buffer)
  let listed_buffers = ''
  redir => listed_buffers
  silent ls
  redir END

  for line in split(listed_buffers, "\n")
    let components = split(line)
    if components[0] == bufno
      return match(components[1], 'h') != -1
    endif
  endfor
  return 0
endfunction

function! s:GotoOrOpen(command_and_args)
  let l:command_and_args = split(a:command_and_args, '\v^\w+ \zs')
  let l:command = l:command_and_args[0]
  let l:file = l:command_and_args[1]

  if bufwinnr(l:file) != -1 || (bufexists(l:file) && !s:BufHidden(l:file))
    execute 'sbuffer ' . l:file
  else 
    execute l:command . l:file
  endif
endfunction

command! -nargs=+ GotoOrOpen call s:GotoOrOpen(<q-args>)


let g:CommandTAcceptSelectionCommand = 'GotoOrOpen e'
let g:CommandTAcceptSelectionTabCommand = 'GotoOrOpen tabe'
let g:CommandTAcceptSelectionSplitCommand = 'GotoOrOpen sp'
let g:CommandTAcceptSelectionVSplitCommand = 'GotoOrOpen vs'
