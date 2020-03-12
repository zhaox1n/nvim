let maplocalleader = ","
let mapleader = ","
"按Ctrl+l 向右移动一个buffer
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Right> <Nop>
nnoremap <Left> <Nop>

inoremap <Esc> <Nop>
inoremap jj <Esc>

nnoremap <silent> <LocalLeader>bn :bn<CR>
"按Ctrl+^ 关闭当前buffer
nnoremap <silent> <LocalLeader>bp :bp<CR>
" od: open file directory tree
nmap od :CocCommand explorer<CR>
" ot: open tag
nmap ot :TagbarToggle<CR>

let g:NERDSpaceDelims = 1

inoremap <leader>w <Esc>:w<cr>
nnoremap <leader>w :w<cr>  
