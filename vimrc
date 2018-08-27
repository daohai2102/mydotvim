set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"call plug#begin('~/.vim/plugged')

" Brace auto closing
"Plugin 'Townk/vim-autoclose'
Plugin 'Raimondi/delimitMate'

"theme
Plugin 'morhetz/gruvbox'

"auto completion
Plugin 'Valloric/YouCompleteMe'
"Plug 'Shougo/neocomplete.vim'

Plugin 'majutsushi/tagbar'

" lean & mean status/tabline for vim that's light as air
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Directory explorer
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-vinegar'

"track changes
Plugin 'airblade/vim-gitgutter'

"Run interactive program (eg: bash) inside vim
"Plugin 'vim-scripts/Conque-Shell'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"vim-airline config
"Automatically displays all buffers when there's only one tab open.
let g:airline#extensions#tabline#enabled = 1

"tagbar config
nmap <F8> :TagbarToggle<CR>
"switch to tagbar automatically on opening
let g:tagbar_autofocus=1
"auto close tagbar when <enter> a tag
let g:tagbar_autoclose=1

"youcomleteme config
"set interpreter to python2
let g:ycm_server_python_interpreter = '/usr/bin/python'
"close the preview window after leaving insert mode.
let g:ycm_autoclose_preview_window_after_insertion=1
"confirm extra_conf just once
let g:ycm_confirm_extra_conf=1

"nerdtree config
map <C-n> :NERDTreeToggle<CR>

" indent folding with manual folds
augroup vimrc
  au BufReadPre * setlocal foldmethod=indent
  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END

set foldcolumn=3

" search ctags file up to the root directory
set tags=tags;/

" " Set colorscheme
 colorscheme gruvbox

" " Set dark background
 set background=dark

"using system clipboard
set clipboard=unnamedplus

set encoding=utf-8

"display absolute line number
set nu
"display relative line number (relative to the current cursor position
set relativenumber

"Auto-reloading a file in VIM as soon as it changes on disk
set autoread
"Auto save file when losing focus on vim
"set autowrite

"using vimrc file in the current directory
"set exrc
"set secure

"number of space characters that will be inserted when the tab key is pressed
set tabstop=4
"keep the default tab stop size of 8, 
"but edit a file as if the tab stop size was some other value
set softtabstop=4
"the number of space characters inserted for indentation
set shiftwidth=4
"do not change tab to space
set noexpandtab

set colorcolumn=80
highlight ColorColumn ctermbg=darkgray

augroup project
    autocmd!
    autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
augroup END

let &path.="src/include,/usr/include/AL,"

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  set undofile		" keep an undo file (undo changes after closing)
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>
inoremap <c-w> <c-g>u<c-w>



" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.

  " For all text files set 'textwidth' to 78 characters.

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).



  set autoindent		" always set autoindenting on


" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langnoremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If unset (default), this may break plugins (but it's backward
  " compatible).
  set langnoremap
endif



"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
packadd matchit
"let g:tagbar_ctags_bin = '/home/sea/.vim/plugged/tagbar/ctags-5.8/ctags'
filetype on
let g:ycm_python_binary_path = 'python'


" Set tabstop, softtabstop and shiftwidth to the same value
command! -nargs=* Stab call Stab()
function! Stab()
  let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
  if l:tabstop > 0
    let &l:sts = l:tabstop
    let &l:ts = l:tabstop
    let &l:sw = l:tabstop
  endif
  call SummarizeTabs()
endfunction

function! SummarizeTabs()
  try
    echohl ModeMsg
    echon 'tabstop='.&l:ts
    echon ' shiftwidth='.&l:sw
    echon ' softtabstop='.&l:sts
    if &l:et
      echon ' expandtab'
    else
      echon ' noexpandtab'
    endif
  finally
    echohl None
  endtry
endfunction





