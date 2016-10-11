scriptencoding utf-8

let base16colorspace=256
color base16-tomorrow

set autoindent
set backspace=indent,start,eol

" Backups, swaps, etc
if exists('$SUDO_USER') " don't create root owned files
  set nobackup
  set nowritebackup
else " keep backup files out of the way
  set backupdir=~/local/.vim/tmp/backup
  set backupdir+=~/.vim/tmp/backup
  set backupdir+=.
endif

if exists('$SUDO_USER')
  set noswapfile " no swap files as root
else " keep swap files out of the away
  set directory=~/local.vim/tmp/swap//
  set directory+=~/.vim/tmp/swap//
  set directory+=.
endif

if has('persistent_undo')
  if exists('$SUDO_USER')
    set noundofile " no root owned files
  else
    set undodir=~/local/.vim/tmp/undo
    set undodir+=~/.vim/tmp/undo
    set undodir+=. " keep undo files out of the way
    set undofile
  endif
endif

if has('viminfo')
  if exists('$SUDO_USER')
    set viminfo= " don't create root-owned files
  else
    if isdirectory('~/local/.vim/tmp')
      set viminfo+=n~/local/.vim/tmp/viminfo
    else
      set viminfo+=n~/.vim/tmp/viminfo
    endif

    if !empty(glob('~/.vim/tmp/viminfo'))
      if !filereadable(expand('~/.vim/tmp/viminfo'))
        echoerr 'warning: ~/.vim/tmp/viminfo exists but is not readable'
      endif
    endif
  endif
endif

if has('mksession')
  if isdirectory('~/local/.vim/tmp')
    set viewdir=~/local/.vim/tmp/view
  else
    set viewdir=~/.vim/tmp/view
  endif
  set viewoptions=cursor,folds " saving current session
endif

"
" Actual settings
"

if exists('&belloff') " turn off stupid bell
  set belloff=all
endif
set visualbell t_vb=

if has('virtualedit')
  set virtualedit=block                  " vis-block highlights empty space
endif

set whichwrap=b,s,<,>,[,],~              " allow chars to cross line boundaries

set cursorline                           " highlight current line

set t_ZH=[3m
set t_ZR=[23m
highlight Comment cterm=italic


if has('linebreak')
  let &showbreak='↘'                     " u-2198
  set breakindent                        " indent wrapped lines to match start
  if exists('&breakindentopt')
    set breakindentopt=shift:2           " indent wrapped lines even more
  endif
endif

set highlight+=N:DiffText                " make current line number stand out
set highlight+=c:LineNr                  " blend vert separators with line numbers

" Formatting
set formatoptions+=n                     " smart indenting on numered lists
set hidden                               " hide buffers without saving changes
set laststatus=2                         " always show status line
set lazyredraw                           " don't update screen during macro playback

if has('folding')
  if has('windows')
    set fillchars=vert:┃                 " heavy vertical line (U+2503)
  endif
  set foldmethod=indent
  set foldlevelstart=99                  " start unfolded
endif

if v:version > 703 || v:version == 703 && has('patch541')
  set formatoptions+=j
endif

set list lcs=trail:-,nbsp:+,tab:▷┅,extends:»,precedes:«

set number
if exists('+relativenumber')
  set relativenumber
endif

if has('showcmd')
  set showcmd
endif

set scrolloff=3
set sidescrolloff=3
set smarttab

if has('syntax')
  set spellcapcheck=
endif

if has('windows')
  set splitright
endif
if has('vertsplit')
  set splitright
endif

set switchbuf=usetab
set expandtab
set shiftwidth=2
set shiftround
set tabstop=2

set textwidth=80

set confirm
