set number
set cursorline
set autoindent
set smartindent
" set ts=4
" test ssh for manjaro
set expandtab
set autoindent
set splitright
syntax enable

set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
filetype plugin indent on
set clipboard=unnamedplus

" set rtp+=/usr/lib/python3.8/site-packages/powerline/bindings/vim/
" let g:powerline_pycmd="py"
" set laststatus=2
" set t_Co=256

call plug#begin('~/.vim/plugged')

Plug 'mhinz/vim-startify'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }	
Plug 'sebdah/vim-delve'
Plug 'vim-airline/vim-airline'
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
" theme: no use
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'kristijanhusak/defx-icons'
Plug 'majutsushi/tagbar'

"Plug 'Valloric/YouCompleteMe'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'

"fzf install: Command Search
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
"key word search
Plug 'mileszs/ack.vim'

Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'

Plug 'godlygeek/tabular' 
Plug 'plasticboy/vim-markdown' 
Plug 'junegunn/vim-peekaboo'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Plug 'vim-scripts/Conque-GDB'

" if has('nvim')
  " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
  " Plug 'Shougo/deoplete.nvim'
  " Plug 'roxma/nvim-yarp'
  " Plug 'roxma/vim-hug-neovim-rpc'
" endif

" Plug 'zchee/deoplete-clang'
Plug 'rhysd/vim-clang-format'
Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh \| UpdateRemotePlugins' }
" rust 
" 
"Plug 'racer-rust/vim-racer'
Plug 'rust-lang/rust.vim'
"Plug 'rhysd/vim-goyacc'
call plug#end()

" let g:python_host_prog='/usr/bin/python2.7'
let g:python3_host_prog='/usr/bin/python3.8' 

colorscheme gruvbox

let g:vim_markdown_math = 1


" =================
" ==== airline ====
" =================
" set laststatus=2 "永远显示状态栏


let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
"set laststatus=2 "永远显示状态栏
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1




" ========================
" ==== keyword change ====
" ========================
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

" use ctrl+h/j/k/l switch window
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
" window control prefix
nnoremap  [Window]   <Nop>
nmap      s [Window]
" 使用 sv, sg 快速在 normal 模式下分割窗口
nnoremap <silent> [Window]v  :<C-u>split<CR>
nnoremap <silent> [Window]g  :<C-u>vsplit<CR>

" 使用 leader+b 快速关闭当前 buffer
noremap <leader>b :bd<cr>
" ================
" ==== tagbar ====
" ================

"安装tagbar插件  
""设置tagbar使用的ctags的插件,必须要设置对  
let g:tagbar_ctags_bin='ctags'  
"设置tagbar的窗口宽度  
"let g:tagbar_width=30  
""设置tagbar的窗口显示的位置,为左边  
let g:tagbar_right=1  
"打开文件自动 打开tagbar  
"autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()  
""映射tagbar的快捷键  
"map <F8> :TagbarToggle<CR> 


" ===================
" ==== ultiSnips ====
" ===================
let g:UltiSnipsExpandTrigger = "<C-k>"
let g:UltiSnipsJumpForwardTrigger = "<C-k>"
let g:UltiSnipsJumpBackwardTrigger = "<C-l>"

" ========================
" ==== deoplete.nvim  ====
" ========================
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
let g:deoplete#enable_at_startup = 1
" autocmd VimEnter * inoremap <expr> <cr> ((pumvisible()) ? (deoplete#close_popup()) : ("\<cr>"))

" ===============
" ==== clang ====
" ===============

let g:deoplete#source#clang#libclang_path = '/usr/local/lib/libclang.dylib'
" let g:deoplete#sources#clang#clang_header = '/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'


function! NvimGdbNoTKeymaps()
  tnoremap <silent> <buffer> <esc> <c-\><c-n>
endfunction

let g:nvimgdb_config_override = {
  \ 'key_next': 'n',
  \ 'key_step': 's',
  \ 'key_finish': 'f',
  \ 'key_continue': 'c',
  \ 'key_until': 'u',
  \ 'key_breakpoint': 'b',
  \ 'set_tkeymaps': "NvimGdbNoTKeymaps",
  \ }



" Rust 
let g:rustfmt_autosave=1
let g:rust_clip_command='pbcopy'

" coc.nvim
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gt <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


let g:dekve_backend="native"

" ack.nvim
let g:ackprg = 'ag --vimgrep'

autocmd FileType go nmap <Leader>c <Plug>(go-callers)
"autocmd BufNewFile,BufReadPost *.y setlocal filetype=goyacc
