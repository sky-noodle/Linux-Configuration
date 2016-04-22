
" install Vundle    github.com/VundleVim/Vundle.vim
" install vimdoc@cn vimcdoc.sourceforge.net
set nocompatible            " nocp " turn off vi-compatible-mode
if(has("win32") || has("win95") || has("win64") || has("win16"))
    let g:iswindows=1
else
    let g:iswindows=0
endif
" clear autocmd, prevent from executing twice
autocmd!

" TMP! {
" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC
"}

" 1. Vundle related {
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" see more :h vundle
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
" "$ vim +PluginInstall +qall" to install plugins from command line

" 1.1 theme
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'vim-scripts/phd'             " Only for gvim

" 1.2 buffer
Plugin 'taglist.vim'                 " 提供单个源代码文件的函数列表之类的功能
Plugin 'majutsushi/tagbar'           " 相对 TagList 能更好的支持面向对象
Plugin 'scrooloose/nerdtree'         " NERD_tree 提供展示文件/目录列表的功能, 比自带的文件浏览器要好很多
Plugin 'Xuyuanp/nerdtree-git-plugin' " 基于 NERDTree 的可以展示 git status 的插件
Plugin 'fholgado/minibufexpl.vim'    " 提供多文件同时编辑功能, 并在编辑器上方显示文件的标签

" 1.3 display
Plugin 'Yggdroot/indentLine'         " 缩进线
"Plugin 'Lokaltog/vim-powerline'      " 状态栏增强插件,可以让你的 Vim 状态栏非常的美观
"Plugin 'vim-airline/vim-airline'     " 状态栏增强插件,可以让你的 Vim 状态栏非常的美观
"Plugin 'derekwyatt/vim-fswitch'      " 与 a.vim 功能一样, 要好一些
"Plugin 'a.vim'                       " 提供快速切换 .h 和 .cpp 文件的功能, 太老了
"Plugin 'kshenoy/vim-signature'       " mark（书签）增强

" 1.4 develop
" 1.4.1 C/C++
Plugin 'scrooloose/nerdcommenter'    " 提供快速注释/反注释代码块的功能
"Plugin 'vim-scripts/DrawIt'          " ASCII art 风格的注释

Plugin 'octol/vim-cpp-enhanced-highlight'    " C++ 语法高亮
Plugin 'OmniCppComplete'             " 提供 C++ 代码的自动补全功能

Plugin 'SirVer/ultisnips'            " 提供超强的快速生成代码段的功能(超越snipmate)
"Plugin 'honza/vim-snippets'

Plugin 'scrooloose/syntastic'

" 1.4.2 python:
"pyflakes 提供实时检查python代码语法的功能
"pydoc 在vim中查找python文档
"jedi-vim 提供很好的python代码提示, 以及shift+k 提供 __doc__ 展示功能
"Plugin 'Python-mode-klen'

" 1.4.3 Markdown
"Plugin 'suan/vim-instant-markdown'   " 很强, 调用firefox实时渲染, github.com/yangyangwithgnu/use_vim_as_ide#8.4
"Plugin 'hallison/vim-markdown'       " 提供markdown着色功能, 顺便也提供了snippet

" 1.4.4 js
"Plugin 'jsbeautify'                  " 优化js代码, 并不是简单的缩进, 而是整个优化
"Plugin 'Javascript-OmniCompletion-with-YUI-and-j'
"Plugin 'JavaScript-Indent'
"Plugin 'Better-Javascript-Indentation'
"Plugin 'jslint.vim'
"Plugin 'pangloss/vim-javascript'

" 1.4.5 html/xml
"matchit 使%不仅能够匹配简单的<>(), 还能匹配<html></html>之类标签的功能
"xml.vim 提供快速编写xml/html的能力, 如标签自动闭合等

"DoxygenToolkit.vim                  "添加doxygen注释

call vundle#end()
filetype plugin indent on   " 使插件能使用
"}

" 2.1 Tab related {
set expandtab               " et    " 用空格替换<tab>
set smarttab                " sta   " 插入<tab>时使用'shiftwidt'
set tabstop=4               " ts
set shiftwidth=4            " sw
set softtabstop=4           " sts
"}

" 2.2 Indent related {
set cindent                 " cin   " 实现C程序的缩进
set cino=:0,g0,t0,(s,us     " 设定 C/C++ 风格自动缩进的选项
set autoindent              " ai    " 使用自动对齐, 也就是把当前行的对齐格式应用到下一行
set smartindent             " si    " 设置 cindent 时无效
set copyindent              "####
"}

" 2.3 Edit related {
set mouse=a                 " 始终用鼠标
"set ttymouse=xterm2         "####
set selection=inclusive
set selectmode=mouse,key
set whichwrap=b,s,h,l,<,>,[,]
set backspace=2             " 允许在插入模式下可以使用<BS>删除任意字符  " 使退格键正常处理indent, eol, start等
set showmatch               " 设置匹配模式, 类似当输入一个左括号时会匹配相应的那个右括号
set matchtime=2             " 匹配括号高亮的时间（单位是0.2s）
set report=0                " 使用:commands时命令, 告诉我们文件的哪一行被改变过
"}

" 2.4 Setting related {
set autochdir               " 自动切换当前目录为当前文件所在的目录
set autoread                " 文件在外部改变时, 自动更新
set autowrite               " 自动写回
set nobackup                " 覆盖文件时不备份
"set noswapfile             " 不设置
set confirm                 " 在处理未保存或只读文件的时候, 弹出确认
set history=100             " 记录历史的行数
set clipboard+=unnamed      " 共享剪贴板
set viminfo+=!,<500         " 保存全局变量
"}

" 2.5 Display related {
syntax enable               " 开启语法高亮功能
syntax on                   " 允许用指定语法高亮配色方案替换默认方案
set t_Co=256
set shortmess=atI           " 启动的时候不显示那个援助乌干达儿童的提示
set helplang=cn
set number                  " nu " 显示行号
set cursorline              " 突出显示当前行
"set cursorcolumn            " 高亮光标所在列
"set magic                   " 设置魔术, 建议保持缺省值
set scrolloff=3             " 光标移动到buffer的顶部和底部时保持3行距离
set sidescrolloff=7         " 在 wrap 置位时, 光标与列边缘保持7列距离
set showcmd                 " 输入的命令显示, 出来的清楚些
set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅,extends:$,precedes:$
set foldmethod=syntax       " 代码折叠
set foldcolumn=4            " 左侧折叠栏列宽
set foldlevel=1             " 启动vim时自动折叠代码的层数
"}

" 2.6 Search related {
set hlsearch                " hls   " 高亮搜索
set incsearch               " is    " 在输入要搜索的文字时, 实时匹配
set ignorecase              " 搜索时忽略大小写
set smartcase               " 但在有一个或以上大写字母时仍保持对大小写敏感
set nowrapscan              " 禁止在搜索到文件两端时重新搜索
"}

" 2.7 Encoding related {
set fileformats=unix,dos,mac
set encoding=utf-8          " 设置编码为中文
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gbk,gb18030,big5,euc-jp,euc-kr,latin1 " 设置编码的自动识别。
set termencoding=utf-8
if(iswindows)
    set langmenu=zh_CN.UTF-8    " 使用中文菜单及UTF-8编码, 没有这句, 在非UTF-8的系统, 如Windows, 用了UTF-8的encoding后菜单会乱码
    language messages zh_CN.utf-8   " 使用中文提示信息及UTF-8编码, 没有这句, 在非UTF-8的系统, 如Windows, 用了UTF-8的encoding 后系统提示会乱码
endif
"set ambiwidth=double        " 防止特殊符号无法正常显示--不要设置, 设置了会出问题
"set iskeyword+=@,#,$,%,-,_,.    " 设置这些符号为单词
"}

" 2.8 Statusline related {
set laststatus=2            " 显示状态栏 (默认值为 1, 无法一直显示状态栏)
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %0(%{&encoding}\ %c:%l/%L%)\ [%p%%]\    " 设置在状态行显示的信息
"set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %([%{Tlist_Get_Tagname_By_Line()}]%) %{tagbar#currenttag('[%s] ','')} %0(%{&encoding}\ %c:%l/%L%)\ [%p%%]\    " 设置在状态行显示的信息
"set ruler                   " ru    " 在编辑过程中, 在右下角显示光标位置的状态行--比statusline优先级小
"}

" 2.9 GUI related {
if (has("gui_running"))
    set guioptions+=emgTbh  " 见help
    colorscheme desert
    "colorscheme phd
    "let g:rehash256 = 1
    "colorscheme molokai
    set guifont=Bitstream\ Vera\ Sans\ Mono\ 12
    "set guifont=YaHei\ Consolas\ Hybrid\ 12
    "set background=dark     " 背景使用黑色
    set guitablabel=%M\ %t
    set mousemodel=popup    " 当右键单击窗口的时候, 弹出快捷菜单。
    set nowrap              " 指定不折行。使用图形界面, 指定不折行视觉效果会好得多
    set sidescrolloff=5     " Keep 5 columns at the size
else
    colorscheme ron
    "colorscheme github
    "colorscheme solarized
    "let g:rehash256 = 1
    "colorscheme molokai
    set wrap
    set linebreak           " 不在单词中间断行
endif
"}

" 3. autocmd {
" remember the fold... :h mkview
au BufWinLeave * mkview
au BufReadPost * loadview
" remember the position of cursor latest
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif "######

"######
au FileType make   set noexpandtab
au FileType python set omnifunc=pythoncomplete#Complete
au FileType c setlocal dict+=~/.vim/dict/c.dict
au FileType cpp setlocal dict+=~/.vim/dict/cpp.dict
au FileType php setlocal dict+=~/.vim/dict/php_funclist.dict
au FileType css setlocal dict+=~/.vim/dict/css.dict
au FileType html setlocal dict+=~/.vim/dict/javascript.dict
au FileType html setlocal dict+=~/.vim/dict/css.dict
au FileType scale setlocal dict+=~/.vim/dict/scale.dict
au FileType javascript setlocal dict+=~/.vim/dict/javascript.dict

" quickfix mode#######
"au BufReadPost quickfix setlocal modifiable | silent exe 'g/^/s//\=line(".")." "/' | setlocal nomodifiable
"au FileType c,cpp map <buffer> <A-space> :w<cr>:make<cr>

" for new file, load the template of this filetype, auto insert edit info
au BufNewFile *.{cpp,[ch],cc,py,rb,sh} silent 0r ~/.vim/skel/Template.%:e | normal G
au BufNewFile *.{cpp,[ch],cc,java} call SetTitle()
map <A-F12> :call SetTitle()<CR>
func! SetTitle()
    call append(0,"// > Last Update:   ".strftime("%Y-%m-%d %H:%M:%S"))
    call append(1,"// *****************************************")
    call append(2,"// > File Name:     ".expand("%"))
    call append(3,"// > Author:        will_lijiecheng")
    call append(4,"// > Mail:          ljclg_1516@foxmail.com")
    call append(5,"// > Created Time:  ".strftime("%Y-%m-%d %H:%M:%S"))
    call append(6,"// *****************************************")
    call append(7,"// > Description:   ")
endf
" auto update last modified time
au BufWritePre *.{cpp,cc,[ch],java} call setline(1,"// > Last Update:   ".strftime("%Y-%m-%d %H:%M:%S"))
"}

" 4. 程序自动补全/联想 {
set wildmenu                " 命令行的自动补全
set wildignore+=*/tmp/*,*\\tmp\\*,*~,*.exe,*.dll,*.so,*.o,*.obj,*.swo,*.swp,*.zip,*.pyc,*.pyo,*.png,*.jpg,*.gif  " ignore some formats
set completeopt=longest,menu,preview    " 补全设置########## -preview?
"}

" 5. keyboard mapping { map: for all mode;  nmap: for normal mode;  imap: for insert mode;  `nore`: no re map
let mapleader = "\\"
" 常用键
imap <C-e> <ESC>
nmap lA    0
nmap lE    $
nmap qq    %
" 括号匹配
inoremap ( ()<left>
inoremap { {}<left>
inoremap [ []<left>
inoremap " ""<left>
inoremap ' ''<left>
"inoremap ) <c-r>=ClosePair(')')<CR>
"inoremap } <c-r>=ClosePair('}')<CR>
"inoremap ] <c-r>=ClosePair(']')<CR>
"func! ClosePair(char)
"    if getline('.')[col('.') - 1] == a:char
"        return "\<Right>"
"    else
"        return a:char
"    endif
"endf
" Ctrl + a, x, c, v, z, y
map <C-a> ggVG$"+y
map <C-x> "+x
"map <C-x> "+d "###
map <C-c> "+y
map <C-v> "+gP
"map <C-v> "+p "####
"map <C-v> "*p "####
map <C-z> u
"imap <C-z> <Esc>u "####
map <C-y> <C-R>
"imap <C-y> <Esc><C-R> "####
" 上下移行
nnoremap <A-Up> ddkP
inoremap <A-Up> <Esc>ddkPi
nnoremap <A-Down> ddp
inoremap <A-Down> <Esc>ddpi
" replace tab to 4 space, depreciated by retab
"nmap tT :%s/\t/    /g<CR>
" :retab
nmap tT :retab<CR>
" normal mode: cS to clear trailing spaces
nmap cS :%s/\s\+$//g<CR>:noh<CR>
" normal mode: cM to clear trailing symbol of ^M
nmap cM :%s/\r$//g<CR>:noh<CR>
" normal mode: cL to clear blank lines
nnoremap cL :g/^\s*$/d<CR>
" normal mode: space to fold or unfold
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
" diff
"nnoremap <F2> :vert diffsplit<CR>
" C/C++按F5编译运行###############
map <F5> :call Compile_Run()<CR>
func! Compile_Run()
    exec "w"
    if &filetype == 'c'
        exec "make"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!time java %<"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        exec "!time python %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'mkd' "########
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
    endif
endf
" C/C++的调试#########
map <F7> :w<CR>:make<CR>
" 代码格式化
"map <F12> gg=G
map <F12> :call FormartSrc()<CR>
func! FormartSrc()  " 需要 apt-get install astyle##########
    exec "w"
    if &filetype == 'c'
        exec "!astyle --style=ansi -a --suffix=none %"
    elseif &filetype == 'cpp' || &filetype == 'hpp'
        exec "r !astyle --style=ansi --one-line=keep-statements -a --suffix=none %> /dev/null 2>&1"
    elseif &filetype == 'perl'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'py'||&filetype == 'python'
        exec "r !autopep8 -i --aggressive %"
    elseif &filetype == 'java'
        exec "!astyle --style=java --suffix=none %"
    elseif &filetype == 'jsp'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'xml'
        exec "!astyle --style=gnu --suffix=none %"
    else
        exec "normal gg=G"
        return
    endif
    exec "e! %"
endf
"}

" 6. Plugin setting {
map <F3> :TagbarClose<CR>:TlistToggle<CR>
imap <F3> <ESC>:TagbarClose<CR>:TlistToggle<CR>
map <F4> :TlistClose<CR>:TagbarToggle<CR>
imap <F4> <Esc>:TlistClose<CR>:TagbarToggle<CR>
" 按下 F6 重新生成 tag 文件, 并更新 taglist
map <F6> :!ctags -R --c++-kinds=+p+l+x --fields=+liaS --extra=+q .<CR><CR> :TlistUpdate<CR>
imap <F6> <ESC>:!ctags -R --c++-kinds=+p+l+x --fields=+liaS --extra=+q .<CR><CR> :TlistUpdate<CR>
"--c++-kinds=+p+l+x  : 为C++文件增加函数原型的标签, p、l、x 默认不产生标签
"--fields=+liaS      : 在标签文件中加入继承信息(i), 类成员的访问控制信息(a), 以及函数的指纹(S), (l)是YCM插件要求的
"--extra=+q          : 为标签增加类修饰符, 如果没有此选项将不能对类成员补全
"nnoremap <f1> :BufExplorer<cr>
"nnoremap <c-f> :CtrlP<cr>
map <F9> :NERDTreeToggle<CR>
imap <F9> <ESC>:NERDTreeToggle<CR>

" 6.1 ctags setting
" useage: 为源码建立一个tag数据库, cd到项目根目录下 $ ctags -R *
set tags=tags;      " 设置tags
"set tags+=./tags    "表示在当前工作目录下搜索tags文件#####
set tags+=~/OpenSrc/linux-*/tags        " 表示在搜寻tags文件的时候，也要搜寻~/OpenSrc/linux-*/文件夹下的tags文件
set tags+=~/OpenSrc/glibc-*/tags        " 表示在搜寻tags文件的时候，也要搜寻~/OpenSrc/glibc-*/文件夹下的tags文件
set tags+=~/OpenSrc/libcxx-*/tags       " 表示在搜寻tags文件的时候，也要搜寻~/OpenSrc/libcxx-*/文件夹下的tags文件
set tags+=~/OpenSrc/libcxxabi-*/tags    " 表示在搜寻tags文件的时候，也要搜寻~/OpenSrc/libcxxabi-*/文件夹下的tags文件

" 6.2 TagList setting
" 更多的配置请参看 :h taglist.txt
let Tlist_Ctags_Cmd = 'ctags'       " 因为 ctags 已经加入 PATH
let Tlist_Auto_Open = 0             " 不默认打开Taglist
let Tlist_Compart_Format = 1        " 压缩方式
let Tlist_Enable_Fold_Column = 1    " 显示折叠树
let Tlist_Exit_OnlyWindow = 1       " 如果taglist窗口是最后一个窗口，则退出vim
let Tlist_File_Fold_Auto_Close = 1  " 不自动折叠
"let Tlist_Process_File_Always = 1   " 实时更新tags
let Tlist_Sort_Type = "order"       " sort by order(出现顺序排序) 在 Tlist buffer 按 s 切换 sort by order or name
let Tlist_Show_One_File = 1         " 不同时显示多个文件的tag，只显示当前文件的
let Tlist_Use_Right_Window = 1      " 在右侧显示窗口
let Tlist_WinWidth = 30             " 设置窗口宽度

" 6.3 Tagbar setting
" 更多的配置请参看 :help tagbar.txt
" 公有成员(+)、私有成员(-)、保护成员(#)
let g:tagbar_ctags_bin = 'ctags'    " ctags 程序的路径
let g:tagbar_width = 30             " 设置窗口宽度
let g:tagbar_sort = 0               " sort by order(出现顺序排序) 在 Tagbar buffer 按 s 切换 sort by order or name
let g:tagbar_compact = 1            " 不显示 help
let g:tagbar_foldlevel = 2          " 自动折叠 2 层以上
let g:tagbar_autoshowtag = 1        " 光标下的标签自动展开折叠
" 对 C++ 显示的标签进行定制
let g:tagbar_type_cpp = {
    \ 'kinds' : [
        \ 'd:macros:1:0',
        \ 'p:prototypes:0:1',
        \ 'c:classes:0:1',
        \ 's:structs:0:1',
        \ 'u:unions:0:1',
        \ 'g:enums:0:1',
        \ 'e:enumerators:0:0',
        \ 't:typedefs:0:0',
        \ 'n:namespaces:0:1',
        \ 'f:functions:0:1',
        \ 'm:members:0:0',
        \ 'v:global:0:1',
        \ 'l:local:1:1',
        \ 'x:external:0:1'
    \ ],
\ }

" 6.4 NERDTree setting
" 更多的配置请参看 :help NERD_tree.txt
" 当打开 vim 且没有文件时自动打开 NERDTree, 只剩 NERDTree 时自动关闭
au VimEnter * if !argc() | NERDTree | endif
au BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeChDirMode = 1
let g:NERDTreeMouseMode = 1
let g:NERDTreeMinimalUI = 1         " 不显示冗余帮助信息
let g:NERDTreeShowHidden = 1        " 显示隐藏文件
let g:NERDTreeSortHiddenFirst = 1
let g:NERDTreeWinSize = 24
let g:NERDTreeIgnore=['\~$', '\tmp', '\.git', '\.svn', '\.swo', '\.swp', '\.dsp', '\.opt', '\.exe', '\.dll', '\.so', '\.o', '\.obj', '\.pyc', '\.pyo']

" 6.5 NERDTree-git-plugin setting
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" 6.6 minibufexpl设置
" 关于 vim 缓冲区(buffer)和窗口的概念(详见:help windows)
" 缓冲区: 一个文件对应一个缓冲区
" 窗口: 用来查看缓冲区里的内容; 你可以用多个窗口观察同一个缓冲区, 也可以用多个窗口观察不同的缓冲区
" 屏幕: Vim 所用的整个工作区域, 可以是一个终端模拟窗口, 也被叫做 "Vim 窗口"。一个屏幕包含一个或多个窗口, 被状态行和屏幕底部的命令行分割。
" * 表示当前有 window 的 buffer，即有 * 的 buffer 是可见的; ! 表示当前正在编辑的 buffer/window
" <Enter> 在打开光标所在的buffer, d 删除光标所在的buffer
" 在某个 buffer 上键入 s 将该 buffer 对应 window 与先前 window 上下排列，键入 v 则左右排列
" 显示/隐藏 MiniBufExplorer 窗口
map <Leader>b :MBEToggle<CR>
" MBEbn下一个next; MBEbp前一个previous; MBEbf之前一个forward; MBEbb之后一个backward
" MBEbd[!] [N1] [N2] ... delete指定的buffer; 只输入:MBEbd, 关闭当前buffer; = MBEbw = MBEbun
let g:miniBufExplHideWhenDiff = 1   " diff模式下不自动打开
let g:miniBufExplCycleArround = 1   " buffer 跳转到头就循环开始
" 窗口 间跳转, <C-w>最常用
noremap <C-w> <C-w>w
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l
noremap <C-Down>  <C-W>j
noremap <C-Up>    <C-W>k
noremap <C-Left>  <C-W>h
noremap <C-Right> <C-W>l
" buffer 间跳转           #######设得不好
noremap <leader><Tab>   :MBEbn<CR>
noremap <leader><S-Tab> :MBEbp<CR>
" Or, in MRU fashion
"noremap <leader><TAB>   :MBEbf<CR>
"noremap <leader><S-TAB> :MBEbb<CR>

" 6.7 Yggdroot/indentLine setting
let g:indentLine_char = '¦'
"let g:indentLine_first_char = '¦'
"let g:indentLine_showFirstIndentLevel = 2
"let g:indentLine_fileType = []
"let g:indentLine_fileTypeExclude = ['text', 'sh']
let g:indentLine_bufNameExclude = ['_.*', 'NERD_tree.*']
let g:indentLine_color_term = 145
let g:indentLine_color_gui = '#A4E57E'
let g:indentLine_color_tty_light = 6
let g:indentLine_color_tty_dark = 1

" 6.8 cscope配置
" 帮助文档:help if_cscop
if has("cscope")
    set csto=0                              " 如果你想反向搜索顺序设置为1
    set cscopetag                           " 同时搜索cscope数据库和标签文件, 使支持用 Ctrl+]  和 Ctrl+t 快捷键在代码间跳转
    set cscopequickfix=s-,c-,d-,i-,t-,e-    " 设定可以使用 quickfix 窗口来查看 cscope 结果
    set nocsverb
    if filereadable("cscope.out")           " 在当前目录中添加任何数据库
        cs add ./cscope.out .
    elseif $CSCOPE_DB != ""                 " 否则添加数据库环境中所指出的
        cs add $CSCOPE_DB
    endif
    set cscopeverbose
    set cspc=3
    " 将:cs find c|d|e|f|g|i|s|t name 等Cscope查找命令映射为<C-\>c等快捷键（按法是先按Ctrl+\, 然后很快再按下c）
    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-\>i :cs find i <C-R>=expand("<cfile>")<CR><CR> :copen<CR><CR>
    map <F4> :cs add ./cscope.out .<CR><CR><CR> :cs reset<CR>
    imap <F4> <ESC>:cs add ./cscope.out .<CR><CR><CR> :cs reset<CR>
endif
" cscope的主要功能是通过其"find"子命令来实现的
" useage: cs find c|d|e|f|g|i|s|t name
" 0 或 s  查找这个 C 符号(可以跳过注释)
" 1 或 g  查找这个定义
" 2 或 d  查找这个函数调用的函数
" 3 或 c  查找调用过这个函数的函数
" 4 或 t  查找这个字符串
" 6 或 e  查找这个 egrep 模式
" 7 或 f  查找这个文件
" 8 或 i  查找包含这个文件的文件
" useage: 
" <1>、为源码建立一个cscope数据库, cd到项目根目录下
" $ cscope -Rbq
" $ ls cscope.*
" cscope.in.out  cscope.out  cscope.po.out
" <2>、用vim打开某个源码文件，末行模式下，输入“:cs add cscope.out"（该命令已被我们映射为快捷键F4），添加cscope数据库到vim。因为我们已将vim配置为启动时，自动添加当前目录下的cscope数据库，所以你再添加该cscope数据库时，vim会提示“重复cscope数据库 未被加入“
" <3>、完成前两步后，现在就可以用“cs find c”等Cscope查找命令查找关键字了。我们已在.vimrc中将“cs find c”等Cscope查找命令映射为<C-\>c等快捷键（按法是先按Ctrl+\, 然后很快按下c）
" 帮助文档#####
" :help if_cscop
" 注意：帮助文档if_cscop中，快捷键映射nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>是有误的！
" 比如光标在“header.h”上按下<C-\>i，也就是查找包含"header.h"的文件。但是按照这个映射规则，则是将<C-\>i映射为cs find i ^header.h$，也就是查找包含“^header.h$“的文件，这显然不是我们想要的结果。该映射规则应该改成nmap <C-\>i :cs find i <C-R>=expand("<cfile>")<CR><CR>

" 6.9 vim-cpp-enhanced-highlight setting
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1

" 6.10 Omnicppcomplete setting
" 更多见:help omnicppcomplete
" 按下F3自动补全代码
"imap <F3> <C-X><C-O>
" 按下F2根据头文件内关键字补全
"imap <F2> <C-X><C-I>
"set completeopt=menu,menuone       " 关掉智能补全时的预览窗口
let OmniCpp_MayCompleteDot = 1      " autocomplete with .
let OmniCpp_MayCompleteArrow = 1    " autocomplete with ->
let OmniCpp_MayCompleteScope = 1    " autocomplete with ::
let OmniCpp_SelectFirstItem = 2     " select first item (but don't insert)
let OmniCpp_NamespaceSearch = 2     " search namespaces in this and included files
let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype in popup window
let OmniCpp_GlobalScopeSearch=1     " enable the global scope search
let OmniCpp_DisplayMode=1           " Class scope completion mode: always show all members
"let OmniCpp_DefaultNamespaces=["std"]
let OmniCpp_ShowScopeInAbbr=1       " show scope in abbreviation and remove the last column
let OmniCpp_ShowAccess=1
"Ctrl+P	向前切换成员
"Ctrl+N	向后切换成员
"Ctrl+E	表示退出下拉窗口, 并退回到原来录入的文字
"Ctrl+Y	表示退出下拉窗口, 并接受当前选项
"Ctrl+X Ctrl+O
"Ctrl+X Ctrl+I	根据头文件内关键字补全
"Ctrl+X Ctrl+L	整行补全
"Ctrl+X Ctrl+N	根据当前文件里关键字补全

" 6.11 syntastic
let g:syntastic_error_symbol = '✗'      "set error or warning signs
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_check_on_open=1
let g:syntastic_enable_highlighting = 0
let g:syntastic_python_checkers=['pyflakes'] " 使用pyflakes,速度比pylint快
let g:syntastic_javascript_checkers = ['jsl', 'jshint']
let g:syntastic_html_checkers=['tidy', 'jshint']
let g:syntastic_cpp_include_dirs = ['/usr/include/']
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libstdc++'
let g:syntastic_enable_balloons = 1 "whether to show balloons
highlight SyntasticErrorSign guifg=white guibg=black
"}

