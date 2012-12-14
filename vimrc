set nocompatible               " be iMproved
"-------------------
"  Global
"------------------ 
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set backspace=2
set viminfo='10,\"100,:5000,%,n~/.viminfo
set hlsearch
set foldmethod=marker
set errorformat+=\"%f\"\\,%l\\,%c\\,%t%*[a-zA-Z]\\,\"%m\"
syntax enable
syntax on
colorscheme desert


"-------------------
" vim plugin manage : vundle  
"------------------ 
filetype off                   " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle "gmarik/vundle"
Bundle "Xdebug"
Bundle "jsbeautify"

" Syntax highlight
Bundle "cucumber.zip"
Bundle "Markdown"

" Utility
Bundle "SuperTab"
Bundle "file-line"
Bundle "Align"
Bundle "Mark"
"Bundle "project.vim"
"Bundle "ProjectTag"
Bundle "https://github.com/Lokaltog/vim-powerline.git"
Bundle "php-doc"

" Command-T
Bundle "git://git.wincent.com/command-t.git"
let g:CommandTMatchWindowAtTop=1 " show window at top

" Other
Bundle "vimwiki"
Bundle "The-NERD-tree"
Bundle "taglist.vim"
Bundle "Conque-Shell"
Bundle "CmdlineComplete"

"Bundle "qiushibaike"
Bundle "JSON.vim"
Bundle "AutoComplPop"
Bundle "vim-scripts/calendar.vim--Matsumoto"
"Bundle "git://github.com/vim-scripts/calendar.vim--Matsumoto.git"
Bundle "vktheming"
Bundle "minibufexplorerpp"

" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
"
filetype plugin indent on     " required!
"======================End vundle=========================

"-----------------
"vimwiki
"-----------------
let g:vimwiki_list = [ {"path": "~/vimwiki/", "path_html": "~/wiki/", "syntax":"markdown","ext": ".txt"}]
" 标记为完成的 checklist 项目会有特别的颜色
let g:vimwiki_hl_cb_checked = 1
" 是否开启按语法折叠  会让文件比较慢
let g:vimwiki_folding = 0
let g:vimwiki_fold_lists = 0

" 是否在计算字串长度时用特别考虑中文字符
let g:vimwiki_CJK_length = 1
" 支援html标记符
let g:vimwiki_valid_html_tags='b,i,s,u,sub,sup,kbd,del,br,hr,div,code,h1'

let g:vimwiki_menu = ''
let g:vimwiki_use_calendar = 0
let g:vimwiki_hl_headers = 1

"======================End vimwiki=========================

"-----------------
" PHP
"-----------------
" php doc 插件
"source ~/.vim/plugin/php-doc.vim
inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-P> :call PhpDocSingle()<CR>
vnoremap <C-P> :call PhpDocRange()<CR>

"-----------------
" Power Line
"-----------------
set laststatus=2
set t_Co=256
let g:Powerline_symbols = 'unicode'
set encoding=utf8


"------------------
"" colorscheme solarized ...
"------------------
syntax enable
syntax on
"set background=light
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans = 1
colorscheme solarized
"colorscheme desert256
"colorscheme manuscript  "GUI only

"------------------
""GCC
"------------------
:nmap <C-c><C-c> :!gcc -Wall % -o %:r.out<CR>

"----------------
"custom 
"----------------
map <C-L> :!php -l %<CR>
map <C-I> :!echo %:p >> /tmp/er_ide<CR>
function! T0nyCopy()
    call setline(line("."),"/**")
    call append(line(".")," * @filename".expand("%"))
    call append(line(".")+1," * @author T0ny<er@zhangabc.com>")
    call append(line(".")+2," * @link http://www.zhangabc.com/" )
    call append(line(".")+3," * @license http://www.zend.com/license/3_0.txt   PHP License 3.0")
    call append(line(".")+4," * @date " . strftime("%Y-%m-%d %T"))
    call append(line(".")+5," * @version $Id$ ")
    call append(line(".")+6," */")
endfun
set tags=./tags,../tags,../../tags,../../../tags,../../../../tags,../../../../../tags,../../../../../../tags

