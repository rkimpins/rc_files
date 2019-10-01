set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'kien/ctrlp.vim'
let g:ctrlp_working_path_mode = '0'
nnoremap <c-z> :CtrlP ~/<CR>

" Plugin 'scrooloose/nerdtree'
" Plugin 'Valloric/YouCompleteMe'
" let g:ycm autoclose preview window after completion=1
" map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
" Plugin 'nvie/vim-flake8'

Plugin 'tpope/vim-fugitive'

" Plugin 'vim-syntastic/syntastic'
" let g:syntastic_cpp_checkers = ['clang_check', 'clang_tidy']
" let g:syntastic_c_checkers = ['clang_check', 'clang_tidy']
" let g:syntastic__python_checkers = ['flake8', 'pylint']
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 0
" let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [], 'passive_filetypes': [] }
" nnoremap \sc :SyntasticCheck<CR>
" nnoremap \sr :SyntasticReset<CR> 

Plugin 'tpope/vim-unimpaired'

Plugin 'vimwiki/vimwiki'
let g:vimwiki_folding='indent'

Plugin 'dhruvasagar/vim-table-mode'
let g:table_mode_corner_corner='+'
let g:table_mode_header_fillchar='='

Plugin 'ervandew/supertab'

Plugin 'tpope/vim-sensible'

Plugin 'surround.vim'

" Plugin 'vim-scripts/Conque-GDB'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on


" Put your non-Plugin stuff after this line


" Personal Settings
" Change tab size
:set tabstop=2
:set shiftwidth=2
:set expandtab
" Minimalize text folding
" Why doesn't this work
" remove displayed text for folded line
set foldtext='+' 
" Remove highlighting
hi Folded ctermbg=NONE
hi Folded ctermfg=15
" Replace fill characters with empty spaces
set fillchars=" "

" Escape insert
inoremap jk <ESC>

" Delete trailing spaces
nnoremap \ds :%s/\s'+$//e<CR>

" Edit vimrc in new tab
nnoremap rcc :tabedit ~/.vimrc<CR> 

" Pull up to do list
nnoremap \td :e ~/tt/todo<CR>
" Reload vimrc
nnoremap \s :source ~/.vimrc

" Bracket completion and jumping
" inoremap ( ()<Esc>:let leavechar=")"<CR>i
" inoremap { {}<Esc>:let leavechar="}"<CR>i
" inoremap [ []<Esc>:let leavechar="]"<CR>i
" inoremap /" /"/"<Esc>:let leavechar='"'<CR>i
" inoremap <c-l> <Esc>:exec /"normal f" . leavechar<CR>a

" Tab navigation
nnoremap th  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>
nnoremap tn  :tabnew<CR>

" Better Window Navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding with spacebar
nnoremap <space> za

" Settings
colo zellner
set ignorecase
set smartcase
set splitbelow
set splitright
set nohlsearch
nnoremap \<space> :noh<cr>:<backspace>

" Store backup files in one place
set backupdir=~/.vimtmp,.
set directory=~/.vimtmp,.
set undodir=~/.vimtmp,.

" Enable Folding
set foldmethod=indent
set foldlevel=99

" Set encoding
set encoding=utf-8

" Set line numbering
set nu

" Access external clipboard
set clipboard=unnamed

" Skeleton Templates
if has("autocmd")
  augroup templates
    autocmd BufNewFile makefile 0r ~/.vim/skeleton/makefile.skeleton
  augroup END
endif

" autocmd BufRead *.s set filetype=s
" autocmd BufNewFile *.s set filetype=s


" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

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

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

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

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
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
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langnoremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If unset (default), this may break plugins (but it's backward
  " compatible).
  set langnoremap
endif


" Add optional packages
packadd matchit
