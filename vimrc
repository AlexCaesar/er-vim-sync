"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ~/.vimrc                                                      "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                               "
" Version: 0.2                                                  "
"                                                               "
"                                                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 
" 代码高亮
syntax on
 
" 允许vim加载文件类型插件
filetype plugin indent on
 
" Don't remember source of this, i think it was already in my .vimrc
" Tell vim to remember certain things when we exit
"  '10 : marks will be remembered for up to 10 previously edited files
"  "100 : will save up to 100 lines for each register
"  :5000 : up to 5000 lines of command-line history will be remembered
"  % : saves and restores the buffer list
"  n... : where to save the viminfo files
set viminfo='10,\"100,:5000,%,n~/.viminfo
 
" omnicomplete 插件: http://vim.wikia.com/wiki/VimTip1386
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
 
"###########################
"##       PHP             ##
"###########################
" php doc 插件
source ~/.vim/plugin/php-doc.vim
inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-P> :call PhpDocSingle()<CR>
vnoremap <C-P> :call PhpDocRange()<CR>
 
" run file with PHP CLI (CTRL-M)
:autocmd FileType php noremap <C-M> :w!<CR>:!php %<CR>
 
" PHP parser check (CTRL-L)
:autocmd FileType php noremap <C-L> :!php -l %<CR>
 
" Do use the currently active spell checking for completion though!
" (I love this feature :-)
set complete+=kspell
 
" 禁用\t
set expandtab
set shiftwidth=4
set softtabstop=4
 
" 高亮搜索结果
set hlsearch
 
" Taken from http://peterodding.com/code/vim/profile/vimrc
" Make Vim open and close folded text as needed because I can't be bothered to
" do so myself and wouldn't use text folding at all if it wasn't automatic.
set foldmethod=marker
" foldopen=all,insert foldclose=all
 
" Enable enhanced command line completion.
set wildmenu wildmode=list:full
 
" Ignore these filenames during enhanced command line completion.
set wildignore+=*.aux,*.out,*.toc " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif " binary images
set wildignore+=*.luac " Lua byte code
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.pyc " Python byte code
set wildignore+=*.spl " compiled spelling word lists
set wildignore+=*.sw? " Vim swap files
 
" Enable completion dictionaries for PHP buffers.
autocmd FileType php set complete+=k~/.vim/dict/PHP.dict
 
" PHP Autocomplete
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
set ofu=syntaxcomplete#Complete
 
" You might also find this useful
" PHP Generated Code Highlights (HTML & SQL)
let php_sql_query=1
let php_htmlInStrings=1
let g:php_folding=2
" set foldmethod=syntax
 
" --------------------
" Project
" --------------------
map <A-S-p> :Project<CR>
map <A-S-o> :Project<CR>:redraw<CR>/
nmap <silent> <F3> <Plug>ToggleProject
"let g:proj_window_width = 30
"let g:proj_window_increment = 150
 
nnoremap <silent> <F8> :TlistToggle<CR>
let Tlist_Exit_OnlyWindow = 1     " exit if taglist is last window open
let Tlist_Show_One_File = 1       " Only show tags for current buffer
let Tlist_Enable_Fold_Column = 0  " no fold column (only showing one file)
let tlist_sql_settings = 'sql;P:package;t:table'
let tlist_ant_settings = 'ant;p:Project;r:Property;t:Target'
 
" auto change directory from: http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file
autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | lcd %:p:h | endif
 
" when we reload, tell vim to restore the cursor to the saved position
augroup JumpCursorOnEdit
 au!
 autocmd BufReadPost *
 \ if expand("<afile>:p:h") !=? $TEMP |
 \ if line("'\"") > 1 && line("'\"") <= line("$") |
 \ let JumpCursorOnEdit_foo = line("'\"") |
 \ let b:doopenfold = 1 |
 \ if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
 \ let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
 \ let b:doopenfold = 2 |
 \ endif |
 \ exe JumpCursorOnEdit_foo |
 \ endif |
 \ endif
 " Need to postpone using "zv" until after reading the modelines.
 autocmd BufWinEnter *
 \ if exists("b:doopenfold") |
 \ exe "normal zv" |
 \ if(b:doopenfold > 1) |
 \ exe "+".1 |
 \ endif |
 \ unlet b:doopenfold |
 \ endif
augroup END
 
" PHP code sniffer
" If code sniffer is installed you can run it on current php file by running
" :Phpcs
function! RunPhpcs()
    let l:filename=@%
    let l:phpcs_output=system('phpcs --report=csv --standard=YMC '.l:filename)
"    echo l:phpcs_output
    let l:phpcs_list=split(l:phpcs_output, "\n")
    unlet l:phpcs_list[0]
    cexpr l:phpcs_list
    cwindow
endfunction
 
set errorformat+=\"%f\"\\,%l\\,%c\\,%t%*[a-zA-Z]\\,\"%m\"
command! Phpcs execute RunPhpcs()
set nu
set fileencodings=ucs-bom,utf-8,chinese,cp936
set completeopt=longest,menu
set enc=utf8
set tabstop=4

map <F2> :NERDTreeToggle<CR>
set tabstop=4
set backspace=2

set dictionary-=~/.vim/funclist.txt dictionary+=~/.vim/funclist.txt
set complete-=k complete+=k
set tags=../tags,../../tags,../../../tags,../../../../tags,../../../../../tags,../../../../../../tags

let Tlist_Ctags_Cmd = "/usr/local/Cellar/ctags/5.8/bin/ctags"
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
"let g:winManagerWindowLayout='FileExplorer|TagList'
let g:winManagerWindowLayout='FileExplorer|BufExplorer'
nmap wm :WMToggle<cr>
map <F4> :TlistToggle<CR>

"状态条
"仅当编译时加入 |+statusline| 特性才有效
source ~/.vim/plugin/XPstatusline.vim
"set laststatus=2
"set statusline=
"set statusline+=%2*%-3.3n%0*\ " buffer number
"set statusline+=%f\ " file name
"set statusline+=%h%1*%m%r%w%0* " flag
"set statusline+=[
"if v:version >= 600
"    set statusline+=%{strlen(&ft)?&ft:'none'}, " filetype
"    set statusline+=%{&encoding}, " encoding
"endif
"set statusline+=%{&fileformat}] " file format
"if filereadable(expand("$VIM/vimfiles/plugin/vimbuddy.vim"))
"    set statusline+=\ %{VimBuddy()} " vim buddy
"endif
"set statusline+=%= " right align
""set statusline+=%2*0x%-8B\ " current char
"set statusline+=0x%-8B\ " current char
"set statusline+=%-14.(%l,%c%V%)\ %<%P " offset 
