
" install Vundle    github.com/VundleVim/Vundle.vim
" install vimdoc@cn vimcdoc.sourceforge.net
" also need install ctags & cscope & astyle
set nocompatible            " nocp " turn off vi-compatible-mode
if(has("win32") || has("win95") || has("win64") || has("win16"))
    let g:iswindows=1
else
    let g:iswindows=0
endif
" clear autocmd, prevent from executing twice
autocmd!

" 1. Vundle related {
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" 1.1 theme
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'vim-scripts/phd'             " Only for gvim

" 1.2 buffer & window
Plugin 'vim-scripts/taglist.vim'     " 提供单个源代码文件的函数列表之类的功能
Plugin 'majutsushi/tagbar'           " 相对 TagList 能更好的支持面向对象
Plugin 'scrooloose/nerdtree'         " NERD_tree 提供展示文件/目录列表的功能
Plugin 'Xuyuanp/nerdtree-git-plugin' " 基于 NERDTree 的可以展示 git status 的插件
Plugin 'fholgado/minibufexpl.vim'    " 多 buffer 时, 在编辑器上方显示 buffer 的标签

" 1.3 display
Plugin 'Yggdroot/indentLine'         " 缩进线
"Plugin 'Lokaltog/vim-powerline'      " 状态栏增强插件,可以让你的 Vim 状态栏非常的美观
"Plugin 'vim-airline/vim-airline'     " 状态栏增强插件,可以让你的 Vim 状态栏非常的美观
"Plugin 'kshenoy/vim-signature'       " mark（书签）增强

" 1.4 develop
Plugin 'scrooloose/nerdcommenter'    " 提供快速注释/反注释代码块的功能
"Plugin 'vim-scripts/DrawIt'          " ASCII art 风格的注释
Plugin 'SirVer/ultisnips'            " 提供超强的快速生成代码段的功能(超越snipmate)
"Plugin 'honza/vim-snippets'
Plugin 'scrooloose/syntastic'

" 1.4.1 C/C++
Plugin 'octol/vim-cpp-enhanced-highlight'    " C++ 语法高亮
Plugin 'OmniCppComplete'             " 提供 C++ 代码的自动补全功能
"Plugin 'Valloric/YouCompleteMe'      " 更强大的自动补全, 基于语义分析
"Plugin 'Rip-Rip/clang_complete'      " 更强大的自动补全, 基于语义分析
"Plugin 'derekwyatt/vim-fswitch'      " 与 a.vim 功能一样, 要好一些
"Plugin 'a.vim'                       " 提供快速切换 .h 和 .cpp 文件的功能, 太老了

call vundle#end()
filetype plugin indent on   " 使插件能使用
"} // end of 1. Vundle related

" 2. utility setting {
" 2.1 Tab related
set expandtab               " et    " 用空格替换<tab>
set smarttab                " sta   " 插入<tab>时使用'shiftwidt'
set tabstop=4               " ts
set shiftwidth=4            " sw
set softtabstop=4           " sts

" 2.2 Indent related
set cindent                 " cin   " 实现C程序的缩进
set cino=:0,g0,t0,(s,us     " 设定 C/C++ 风格自动缩进的选项
set autoindent              " ai    " 使用自动对齐, 也就是把当前行的对齐格式应用到下一行
set smartindent             " si    " 设置 cindent 时无效
set copyindent              "####

" 2.3 Edit related
set mouse=a                 " 始终用鼠标
"set ttymouse=xterm2         "####
set selection=inclusive
set selectmode=mouse,key
set whichwrap=b,s,h,l,<,>,[,]
set backspace=2             " 允许在插入模式下可以使用<BS>删除任意字符  " 使退格键正常处理indent, eol, start等
set showmatch               " 设置匹配模式, 类似当输入一个左括号时会匹配相应的那个右括号
set matchtime=2             " 匹配括号高亮的时间（单位是0.2s）
set report=0                " 使用:commands时命令, 告诉我们文件的哪一行被改变过

" 2.4 Setting related
set autochdir               " 自动切换当前目录为当前文件所在的目录
set autoread                " 文件在外部改变时, 自动更新
set autowrite               " 自动写回
set nobackup                " 覆盖文件时不备份
"set noswapfile             " 不设置
set confirm                 " 在处理未保存或只读文件的时候, 弹出确认
set history=100             " 记录历史的行数
set clipboard+=unnamed      " 共享剪贴板
set viminfo+=!,<500         " 保存全局变量

" 2.5 Display related
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

" 2.6 Search related
set hlsearch                " hls   " 高亮搜索
set incsearch               " is    " 在输入要搜索的文字时, 实时匹配
set ignorecase              " 搜索时忽略大小写
set smartcase               " 但在有一个或以上大写字母时仍保持对大小写敏感
set nowrapscan              " 禁止在搜索到文件两端时重新搜索

" 2.7 Encoding related
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

" 2.8 Statusline related
set laststatus=2            " 显示状态栏 (默认值为 1, 无法一直显示状态栏)
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %0(%{&encoding}\ %c:%l/%L%)\ [%p%%]\    " 设置在状态行显示的信息
"set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %([%{Tlist_Get_Tagname_By_Line()}]%) %{tagbar#currenttag('[%s] ','')} %0(%{&encoding}\ %c:%l/%L%)\ [%p%%]\    " 设置在状态行显示的信息######
"set ruler                   " ru    " 在编辑过程中, 在右下角显示光标位置的状态行--比statusline优先级小

" 2.9 GUI related
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
    " 全屏开/关快捷键   "需要安装wmctl
    "map <silent> <F11> :call call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>
else
    colorscheme ron
    "colorscheme github
    "colorscheme solarized
    "let g:rehash256 = 1
    "colorscheme molokai
    set wrap
    set linebreak           " 不在单词中间断行
endif
"} // end of 2. utility setting

" 3. autocmd {
" remember the fold... :h mkview
au BufWinLeave * mkview
au BufReadPost * loadview
" remember the position of cursor latest
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif "######

au FileType make   setlocal noexpandtab
"au FileType python set omnifunc=pythoncomplete#Complete

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
"} // end of 3. autocmd

" 4. keyboard mapping { map: for all mode;  nmap: for normal mode;  imap: for insert mode;  `nore`: no re map
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
" Ctrl + a, x, c, v, z, y
map <C-a> ggVG$"+y
map <C-x> "+x
map <C-c> "+y
map <C-v> "+gP
imap <C-v> <Esc>l"+gPi
map <C-z> u
imap <C-z> <Esc>ui
map <C-y> <C-R>
imap <C-y> <Esc><C-R>i
" 上下移行
nnoremap <A-Up> ddkP
inoremap <A-Up> <Esc>ddkPi
nnoremap <A-Down> ddp
inoremap <A-Down> <Esc>ddpi
" replace tab to 4 space, depreciated by retab
"nmap tT :%s/\t/    /g<CR>
nmap tT :retab<CR>
" cS, cM, cL
nmap cS :%s/\s\+$//g<CR>:noh<CR>
nmap cM :%s/\r$//g<CR>:noh<CR>
nnoremap cL :g/^\s*$/d<CR>
" space to fold or unfold
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
func! FormartSrc()  " 需要 install astyle##########
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
"} // end of 4. keyboard mapping

" 5. Plugin setting {
map <F3> :TagbarClose<CR>:TlistToggle<CR>
imap <F3> <ESC>:TagbarClose<CR>:TlistToggle<CR>
map <F4> :TlistClose<CR>:TagbarToggle<CR>
imap <F4> <Esc>:TlistClose<CR>:TagbarToggle<CR>
" 按下 F6 重新生成 tag & cscope 文件, 并更新 taglist
map <F6> :!ctags -R --c++-kinds=+p+l+x --fields=+liaS --extra=+q .<CR><CR> :cs -Rbq<CR><CR> :cs add ./cscope.out .<CR><CR><CR> :cs reset<CR>:TlistUpdate<CR>
imap <F6> <ESC>:!ctags -R --c++-kinds=+p+l+x --fields=+liaS --extra=+q .<CR><CR> :cs -Rbq<CR><CR> :cs add ./cscope.out .<CR><CR><CR> :cs reset<CR>:TlistUpdate<CR>
"--c++-kinds=+p+l+x  : 为 C++ 文件增加函数原型的标签, p、l、x 默认不产生标签
"--fields=+liaS      : 在标签文件中加入继承信息(i), 类成员的访问控制信息(a), 以及函数的指纹(S), (l)是YCM插件要求的
"--extra=+q          : 为标签增加类修饰符, 如果没有此选项将不能对类成员补全
map <F9> :NERDTreeToggle<CR>
imap <F9> <ESC>:NERDTreeToggle<CR>
"nnoremap <c-f> :CtrlP<cr>

" 5.1 ctags setting
set tags=tags;      " 设置 tags
"set tags+=./tags    "表示在当前工作目录下搜索 tags 文件#####
set tags+=~/OpenSrc/linux-*/tags        " 表示在搜寻 tags 文件的时候, 也要搜寻 ~/OpenSrc/linux-*/ 文件夹下的tags文件
set tags+=~/OpenSrc/glibc-*/tags        " 表示在搜寻 tags 文件的时候, 也要搜寻 ~/OpenSrc/glibc-*/ 文件夹下的tags文件
set tags+=~/OpenSrc/libcxx-*/tags       " 表示在搜寻 tags 文件的时候, 也要搜寻 ~/OpenSrc/libcxx-*/ 文件夹下的tags文件
set tags+=~/OpenSrc/libcxxabi-*/tags    " 表示在搜寻 tags 文件的时候, 也要搜寻 ~/OpenSrc/libcxxabi-*/ 文件夹下的tags文件

" 5.2 TagList setting
let Tlist_Ctags_Cmd = 'ctags'       " 因为 ctags 已经加入 PATH
let Tlist_Auto_Open = 0             " 不默认打开 Taglist
let Tlist_Compart_Format = 1        " 压缩方式
let Tlist_Enable_Fold_Column = 1    " 显示折叠树
let Tlist_Exit_OnlyWindow = 1       " 如果 taglist 窗口是最后一个窗口, 则退出 vim
let Tlist_File_Fold_Auto_Close = 1  " 不自动折叠
"let Tlist_Process_File_Always = 1   " 实时更新 tags
let Tlist_Sort_Type = "order"       " sort by order(出现顺序排序) 在 Tlist buffer 按 s 切换 sort by order or name
let Tlist_Show_One_File = 1         " 不同时显示多个文件的 tag, 只显示当前文件的
let Tlist_Use_Right_Window = 1      " 在右侧显示窗口
let Tlist_WinWidth = 30             " 设置窗口宽度

" 5.3 Tagbar setting
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

" 5.4 NERDTree setting
" 当打开 vim 且没有文件时自动打开 NERDTree, 只剩 NERDTree 时自动关闭#####
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

" 5.5 NERDTree-git-plugin setting
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

" 5.6 minibufexpl setting
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
" 显示/隐藏 MiniBufExplorer 窗口
map <Leader>b :MBEToggle<CR>

" 5.7 indentLine setting
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

" 5.8 ultisnips setting

" 5.9 syntastic setting
"let g:syntastic_error_symbol = '✗'      "set error or warning signs
"let g:syntastic_warning_symbol = '⚠'
"let g:syntastic_check_on_open = 1
"let g:syntastic_enable_highlighting = 0
"let g:syntastic_python_checkers = ['pyflakes'] " 使用pyflakes,速度比pylint快
"let g:syntastic_javascript_checkers = ['jsl', 'jshint']
"let g:syntastic_html_checkers = ['tidy', 'jshint']
"let g:syntastic_cpp_include_dirs = ['/usr/include/']
"let g:syntastic_cpp_remove_include_errors = 1
"let g:syntastic_cpp_check_header = 1
"let g:syntastic_cpp_compiler = 'clang++'
"let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libstdc++'
"let g:syntastic_enable_balloons = 1 "whether to show balloons
"highlight SyntasticErrorSign guifg = white guibg=black

" 5.10 cscope setting
if has("cscope")
    set csto=0                              " 优先搜索cscope, 后tag
    set cscopetag                           " 同时搜索cscope数据库和标签文件, 使支持用 Ctrl+]  和 Ctrl+t 快捷键在代码间跳转
    set cscopequickfix=s-,c-,d-,i-,t-,e-    " 设定可以使用 quickfix 窗口来查看 cscope 结果
    set nocsverb
    if filereadable("cscope.out")           " 在当前目录中添加任何数据库
        cs add ./cscope.out .
    elseif $CSCOPE_DB != ""                 " 否则添加数据库环境中所指出的
        cs add $CSCOPE_DB
    endif
    set csverb
    set cspc=3
    " 将:cs find c|d|e|f|g|i|s|t name 等Cscope查找命令映射为<C-\>c等快捷键（按法是先按Ctrl+\, 然后很快再按下c）
    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-\>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
endif

" 5.11 NERDComComment setting
let g:NERDDefaultNesting = 0    " 不自动循环注释
let g:NERDLPlace = ""
let g:NERDRPlace = ""
" 行注释 & 注释状态转变
map <C-?> <plug>NERDCommenterToggle
imap <C-?> <ESC><plug>NERDCommenterToggle i
" 块注释 Sexy mode
map <S-c> <plug>NERDCommenterSexy
imap <S-c> <ESC><plug>NERDCommenterSexy i
" 部分注释
map <C-\> <plug>NERDCommenterComment
imap <C-\> <ESC><plug>NERDCommenterComment i

" 5.12 vim-cpp-enhanced-highlight setting
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1
"let c_no_curly_error = 1    " 出问题了就设

" 5.13 Omnicppcomplete setting
set wildmenu                " 命令行的自动补全, vim自己的功能
set wildignore+=*/tmp/*,*\\tmp\\*,*~,*.exe,*.dll,*.so,*.o,*.obj,*.swo,*.swp,*.zip,*.pyc,*.pyo,*.png,*.jpg,*.gif  " ignore some formats
set completeopt=longest,menu,preview    " 补全设置########## -preview?
"set completeopt=menu,menuone       " 关掉智能补全时的预览窗口
" 按下F3自动补全代码  按下F2根据头文件内关键字补全
"imap <F3> <C-X><C-O>
"imap <F2> <C-X><C-I>
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
"} // end of 5. Plugin setting

" TMP! {
"}

