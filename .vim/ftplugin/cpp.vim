" Compiler commands
nnoremap <c-c>g :w <CR> :!g++ % -std=c++11 -Wextra -Wall -Wconversion -O && ./a.out
nnoremap <c-c>c :w <CR> :!clang++ % -Wextra -Wall -Wconversion -O && ./a.out
nnoremap <c-c>a :w <CR> :!g++ % -Wextra -Wall -Wconversion -O -S && vim %<.s
nnoremap <c-c>d :w <CR> :!g++ % -g <CR> :ConqueGdb a.out <CR>

" Template Shortcuts
nnoremap <c-c>t :0r ~/.vim/skeleton/cpp.skeleton 
" inoremap #i #include
" inoremap #p printf("");<CR><ESC>kf"a
" inoremap #w while () {<CR><CR>}<ESC>kkf(a
" inoremap #f for (xxx; xxx; xxx;) {<CR>xxx<CR>}<ESC>kkI
inoremap <c-j> <Esc>/xxx<CR>3dla

" C Formatting
set tabstop=2
set shiftwidth=2
set textwidth=80
set expandtab
set autoindent
set fileformat=unix
