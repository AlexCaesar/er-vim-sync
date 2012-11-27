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

"-----------------
"vimwiki
"-----------------
let g:vimwiki_list = [ {"path": "~/vimwiki/", "path_html": "~/wiki/",  "syntax": "markdown",  "ext": ".md"}]
"======================End vimwiki=========================

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
let g:vimwiki_list = [ {"path": "~/vimwiki/", "path_html": "~/wiki/",  "syntax": "markdown",  "ext": ".md"}]

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

