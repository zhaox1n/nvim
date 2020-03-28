" 使用 ge 切换显示文件浏览，使用 ga 查找到当前文件位置
let g:maplocalleader='g'
nnoremap <silent> <LocalLeader>e
\ :<C-u>Defx -resume -toggle -buffer-name=tab`tabpagenr()`<CR> 
nnoremap <silent> <LocalLeader>a
\ :<C-u>Defx -resume -buffer-name=tab`tabpagenr()` -search=`expand('%:p')`<CR>

function! s:defx_mappings() abort
	" Defx window keyboard mappings
	" IndentLinesDisable
	setlocal nospell
	setlocal signcolumn=no
	setlocal nonumber
	" 使用回车打开文件
	nnoremap <silent><buffer><expr> <CR> defx#do_action('multi', ['drop'])
	nnoremap <silent><buffer><expr> s defx#do_action('drop', 'split')
    nnoremap <silent><buffer><expr> v defx#do_action('drop', 'vsplit')
    nnoremap <silent><buffer><expr> t defx#do_action('drop', 'tabe')
    nnoremap <silent><buffer><expr> o defx#do_action('open_tree')
    nnoremap <silent><buffer><expr> O defx#do_action('open_tree_recursive')
    nnoremap <silent><buffer><expr> C defx#do_action('copy')
    nnoremap <silent><buffer><expr> P defx#do_action('paste')
    nnoremap <silent><buffer><expr> M defx#do_action('rename')
    nnoremap <silent><buffer><expr> D defx#do_action('remove_trash')
    nnoremap <silent><buffer><expr> A defx#do_action('new_multiple_files')
    nnoremap <silent><buffer><expr> U defx#do_action('cd', ['..'])
    nnoremap <silent><buffer><expr> . defx#do_action('toggle_ignored_files')
    nnoremap <silent><buffer><expr> <Space> defx#do_action('toggle_select')
    nnoremap <silent><buffer><expr> R defx#do_action('redraw')
endfunction

call defx#custom#option('_', {
	\ 'columns': 'git:icons:filename:type',
	\ 'winwidth': 25,
	\ 'split': 'vertical',
	\ 'direction': 'topleft',
	\ 'listed': 1,
	\ 'show_ignored_files': 0,
	\ 'root_marker': '≡ ',
	\ 'ignored_files':
	\     '.mypy_cache,.pytest_cache,.git,.hg,.svn,.stversions'
	\   . ',__pycache__,.sass-cache,*.egg-info,.DS_Store,*.pyc,*.swp'
    \   . ',.*'
	\ })

autocmd FileType defx call s:defx_mappings()

let g:defx_icons_enable_syntax_highlight = 0
let g:defx_icons_column_length = 2
hi link DefxIconsOpenedTreeIcon error
