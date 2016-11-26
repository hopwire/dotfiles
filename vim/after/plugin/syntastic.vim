set statusline+=%#warningsmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

let g:syntastic_java_javac_classpath='~/uni/mancala-bot/Agent.jar'
