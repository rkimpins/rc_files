set tabstop=4
set shiftwidth=4
set textwidth=80
set autoindent
set expandtab
set fileformat=unix

nnoremap \o 0f#i<tab><esc>
nnoremap \i 0f#i<bs><bs><bs><bs><esc>

nnoremap \gc :Git commit -a -m "
nnoremap \gp :Git push origin master
