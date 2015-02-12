set nocompatible
set backspace=indent,eol,start
set backup " Enable backups
set backupdir=~/.vim/backup,~/tmp,/var/tmp " List of backup dirs
set history=100 " Don't really use it, yet
set ruler " Show the ruler
set showcmd " Show the command
set showmatch " show matching braces when cursor is over them
set hidden
set title " set window title
set visualbell " be quiet
set timeout timeoutlen=1000 ttimeoutlen=100 " fix slow O inserts

" smart case-sensitive search
set ignorecase
set smartcase
set incsearch " Incremental search


" I'm changing to 4 spaces, from tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Going with a dark background now
colorscheme desert

" My leader char. / is too awkward
let mapleader = ","

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " Disable auto commenting
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END
else
  set autoindent		" always set autoindenting on
endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif


" Show trailing whitespace
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR>

" Display dearch hightlight search
nmap <silent> <leader>n :silent :nohlsearch<CR>

" Set GUI initial window size
if has("gui_running")
  " GUI is running or is about to start.
  set lines=40 columns=100
else
  " This is console Vim.
  if exists("+lines")
    set lines=40
  endif
  if exists("+columns")
    set columns=80
  endif
endif

" Proper BASH syntax highlighting
augroup syntax
  au! BufNewFile,BufReadPost *.spec so ~/vim/spec.vim
  au BufNewFile,BufReadPost *.spec so ~/vim/spec.vim
augroup END

" local customizations in ~/.vimrc_local
let $LOCALFILE=expand("~/.vimrc_local")
if filereadable($LOCALFILE)
  source $LOCALFILE
endif

