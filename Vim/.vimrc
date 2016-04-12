
set nocompatible            "nocp "去掉vi兼容模式，避免以前版本的一些bug和局限，放最前面
if(has("win32") || has("win95") || has("win64") || has("win16")) "判定当前操作系统类型
    let g:iswindows=1
else
    let g:iswindows=0
endif
au!
"第一级
"Tab related
set expandtab               "et "用空格替换<tab>
set smarttab                "sta "插入<tab>时使用'shiftwidt'
set shiftwidth=4            "sw
set softtabstop=4           "sts
set tabstop=4               "ts

"Indent related
set cindent                 "cin "实现C程序的缩进
set cino=:0,g0,t0,(s,us     "设定 C/C++ 风格自动缩进的选项
set autoindent              "ai "使用自动对齐,也就是把当前行的对齐格式应用到下一行
set smartindent             "si "依据上面的对齐格式,智能的选择对齐方式,对于类似C语言编写上很有用

"Edit related
set mouse=a                 "始终用鼠标
set selection=inclusive
set selectmode=mouse,key
set whichwrap=b,s,h,l,<,>,[,]
set backspace=2             "指明在插入模式下可以使用<BS>删除光标前面的字符 "使退格键正常处理indent, eol, start等
set showmatch               "设置匹配模式，类似当输入一个左括号时会匹配相应的那个右括号
set matchtime=2             "匹配括号高亮的时间（单位是0.2s）
set report=0                "通过使用:commands命令，告诉我们文件的哪一行被改变过

"Setting related
set autochdir               "自动切换当前目录为当前文件所在的目录
set autoread                "文件在外部改变时，自动更新
set autowrite               "自动写回
set nobackup                "覆盖文件时不备份
"set noswapfile
set confirm                 "在处理未保存或只读文件的时候，弹出确认
set history=1000            "记录历史的行数
set clipboard+=unnamed      "共享剪贴板
set viminfo+=!,<500         "保存全局变量

"Display related
syntax enable               "设置高亮关键字显示（调用你自己的高亮文件）
set helplang=cn
set shortmess=atI           "启动的时候不显示那个援助乌干达儿童的提示
set number                  "nu "显示行号
set cursorline              "突出显示当前行
"set cursorcolumn           "高亮光标所在列
"set magic                  "设置魔术，缺省打开
set scrolloff=3             "光标移动到buffer的顶部和底部时保持3行距离
set fillchars=vert:\ ,stl:\ ,stlnc:\  "在被分割的窗口间显示空白，便于阅读
set showcmd                 "输入的命令显示，出来的清楚些
set foldmethod=syntax       "代码折叠
set foldcolumn=5            "左侧折叠栏列宽
set foldlevel=1             "启动vim时自动折叠代码的层数
autocmd BufWinLeave * mkview "记住上次的折叠
autocmd BufWinEnter * silent loadview

"Search related
set hlsearch                "hls "高亮搜索
set incsearch               "is "在输入要搜索的文字时，实时匹配
set ignorecase              "搜索时忽略大小写
set smartcase               "但在有一个或以上大写字母时仍保持对大小写敏感
set nowrapscan              "禁止在搜索到文件两端时重新搜索

"Encoding related
set fileformats=unix,dos,mac
set encoding=utf-8          "设置编码为中文
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gbk,gb18030,big5,euc-jp,euc-kr,latin1 "设置编码的自动识别。
set termencoding=utf-8
if(iswindows)
    set langmenu=zh_CN.UTF-8 "使用中文菜单及UTF-8编码,没有这句,在非UTF-8的系统,如Windows,用了UTF-8的encoding后菜单会乱码
    language messages zh_CN.utf-8 "使用中文提示信息及UTF-8编码,没有这句,在非UTF-8的系统,如Windows,用了UTF-8的encoding 后系统提示会乱码
endif
"set ambiwidth=double       "防止特殊符号无法正常显示--不要设置，设置了会出问题
"set iskeyword+=@,#,$,%,-,_,. "设置这些符号为单词

"Statusline related
set laststatus=2            "显示状态栏 (默认值为 1, 无法一直显示状态栏)
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %0(%{&encoding}\ %c:%l/%L%)\ [%p%%]\  "设置在状态行显示的信息
"set ruler                  "ru "在编辑过程中，在右下角显示光标位置的状态行--比statusline优先级小

"GUI related
if (has("gui_running"))
    set guioptions+=emgTbh  "见help
    set t_Co=256
    colorscheme desert
    set guifont=Bitstream\ Vera\ Sans\ Mono\ 12
    "set background=dark    "背景使用黑色
    set guitablabel=%M\ %t
    set mousemodel=popup    "当右键单击窗口的时候，弹出快捷菜单。
    set nowrap              "指定不折行。使用图形界面，指定不折行视觉效果会好得多
else
    colorscheme ron
    set wrap
    set linebreak           "不在单词中间断行
endif

filetype on                 "检测文件的类型
filetype plugin indent on   "使插件能使用

autocmd FileType make   set noexpandtab
autocmd FileType python set omnifunc=pythoncomplete#Complete

autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif "每次打开直接定位到上次的位置

"程序自动补全/联想
set wildmenu                "自动补全命令时候使用单行菜单式匹配列表

set completeopt=longest,menu,preview

:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {<CR>}<ESC>O
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunction

au FileType php setlocal dict+=~/.vim/dict/php_funclist.dict
au FileType css setlocal dict+=~/.vim/dict/css.dict
au FileType c setlocal dict+=~/.vim/dict/c.dict
au FileType cpp setlocal dict+=~/.vim/dict/cpp.dict
au FileType scale setlocal dict+=~/.vim/dict/scale.dict
au FileType javascript setlocal dict+=~/.vim/dict/javascript.dict
au FileType html setlocal dict+=~/.vim/dict/javascript.dict
au FileType html setlocal dict+=~/.vim/dict/css.dict

"键盘映射
let mapleader = "\\"
map <C-w> <C-w>w
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
imap <C-e> <ESC>
"Ctrl+a,x,c,v
map <C-a> ggVG$"+y
map <C-x> "+d
map <C-c> "+y
map <C-v> "*p
"上下移行
nnoremap <A-Up> ddkP
nnoremap <A-Down> ddp
inoremap <A-Up> <Esc> ddkPi
inoremap <A-Down> <Esc> ddpi
"常规模式下输入cS清除行尾空格
nmap cS :%s/\s\+$//g<CR>:noh<CR>
"常规模式下输入cM清除行尾^M符号
nmap cM :%s/\r$//g<CR>:noh<CR>
"去空行
nnoremap cL :g/^\s*$/d<CR>
"比较文件
nnoremap <F2> :vert diffsplit<CR>
"列出当前目录文件
map <F3> :NERDTreeToggle<CR>
imap <F3> <ESC> :NERDTreeToggle<CR>
"列出跳转表
map <F4> :Tlist<CR>
imap <F4> <ESC> :Tlist<CR>
nmap tl :Tlist<cr>
"C，C++按F5编译运行
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
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
        exec "!time python2.7 %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
        "exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
    endif
endfunc
"quickfix模式
autocmd FileType c,cpp map <buffer> <A-space> :w<cr>:make<cr>
"C,C++的调试
map <F7> :call Rungdb()<CR>
func! Rungdb()
    exec "w"
    exec "!g++ % -g -o %<"
    exec "!gdb ./%<"
endfunc
"代码格式化
map <F12> gg=G
map <C-F12> :call FormartSrc()<CR>
func FormartSrc()
    "有问题
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
endfunc

"新建文件，自动插入文件头
map <A-F12> :call SetTitle()<CR>
autocmd BufNewFile *.{cpp,[ch],cc,py,rb,sh} silent 0r ~/.vim/skel/Template.%:e | normal G "插入模板(事先放好)
autocmd BufNewFile *.{cpp,[ch],cc,java} call SetTitle()
func SetTitle()
    call append(0,"// > Last Update:   ".strftime("%Y-%m-%d %H:%M:%S"))
    call append(1,"// *****************************************")
    call append(2,"// > File Name:     ".expand("%"))
    call append(3,"// > Author:        will_lijiecheng")
    call append(4,"// > Mail:          ljclg_1516@foxmail.com")
    call append(5,"// > Created Time:  ".strftime("%Y-%m-%d %H:%M:%S"))
    call append(6,"// *****************************************")
    call append(7,"// > Description:   ")
endfunc

"自动更新最后修改时间
autocmd BufWritePre *.{cpp,cc,[ch],java} call setline(1,"// > Last Update:   ".strftime("%Y-%m-%d %H:%M:%S"))
