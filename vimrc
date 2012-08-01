
"-------------------
"  Global
"------------------ 
set expandtab
set shiftwidth=4
set softtabstop=4
filetype plugin indent on
set viminfo='10,\"100,:5000,%,n~/.viminfo
set hlsearch
set foldmethod=marker
" foldopen=all,insert foldclose=all
"
set errorformat+=\"%f\"\\,%l\\,%c\\,%t%*[a-zA-Z]\\,\"%m\"
command! Phpcs execute RunPhpcs()
set nu
set fileencodings=ucs-bom,utf-8,chinese,cp936
set completeopt=longest,menu
set enc=utf8
set tabstop=4
set backspace=2
set dictionary-=~/.vim/funclist.txt dictionary+=~/.vim/funclist.txt
set complete-=k complete+=k
set tags=../tags,../../tags,../../../tags,../../../../tags,../../../../../tags,../../../../../../tags

 

" omnicomplete  http://vim.wikia.com/wiki/VimTip1386
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
 
"--------------------------
"         PHP             
"--------------------------
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
set complete+=kspell
 
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
endfun


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
 

let Tlist_Ctags_Cmd = "/usr/local/Cellar/ctags/5.8/bin/ctags"
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
"let g:winManagerWindowLayout='FileExplorer|TagList'
let g:winManagerWindowLayout='FileExplorer|BufExplorer'

"状态条
"仅当编译时加入 |+statusline| 特性才有效
source ~/.vim/plugin/XPstatusline.vim
set cursorline

function! T0nyCopy()
    call setline(line("."),"/**")
    call append(line(".")," * ".expand("%"))
    call append(line(".")+1," * @author T0ny<er@zhangabc.com>")
    call append(line(".")+2," * @link http://www.zhangabc.com/" )
    call append(line(".")+3," * @license http://www.zend.com/license/3_0.txt   PHP License 3.0")
    call append(line(".")+4," * @date " . strftime("%Y-%m-%d %T"))
    call append(line(".")+5," * @version $Id$ ")
    call append(line(".")+6," */")
endfun

"------------------
"solarized
"------------------
syntax enable
"set background=light
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

":set fencs=utf-8,gbk,big5,euc-jp,utf-16
":set fenc=utf-8 enc=utf-8 tenc=utf-8

"------------------
"GCC
"------------------
:nmap <C-c><C-c> :!gcc -Wall % -o %:r.out<CR>

"-----------------
"key mapping
" <leader>ff call g:Jsbeautify()
"-----------------
map <F2> :NERDTreeToggle<CR>
nmap wm :WMToggle<cr>
map <F4> :TlistToggle<CR>
map <C-I> :!echo %:p >> ~/Veditor<CR>
nmap <tab> v>
nmap <s-tab> v<
vmap <tab> >gv
vmap <s-tab> <gv
"imap <F12> :call T0nyCopy*()<CR>

