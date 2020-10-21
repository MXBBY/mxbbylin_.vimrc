
" 作者：mxbbylin
" 创建时间：2020-04-01 01:25
" 最后修改时间：2020-08-10 16:40
" 文件名：.vimrc
" 说明： 我的个人vim配置。

" 以下是已经分配功能的按键和按键组合。
" Ctrl+C 对python代码进行语法和格式检查。
" Ctrl+Q 主动触发代码补全。
" Ctrl+M 快速打开和关闭目录树。
" Ctrl-j 切换到下方的分割窗口。
" Ctrl-k 切换到上方的分割窗口。
" Ctrl-l 切换到右侧的分割窗口。
" Ctrl-h 切换到左侧的分割窗口。
" space 代码折叠和解除代码折叠。
" Ctrl+R vim中执行python代码。
" Ctrl+A 添加和修改文件头。
" Ctrl+T 进行代码间函数跳转和转回。

" Vundle插件管理器的配置
" 开始
set nocompatible              " require,去除VIM一致性
filetype off                  " requireda

" 设置包括vundle和初始化相关的运行时路径
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" 开启vundle管理插件, required
Plugin 'gmarik/Vundle.vim'

" 自动缩进
Plugin 'vim-scripts/indentpython.vim'

" vim-flake8 python代码规范性检查
Plugin 'nvie/vim-flake8'

" vim-autopep8 python自动格式化
Plugin 'tell-k/vim-autopep8'

" YouCompleteMe 代码补全
Plugin 'Valloric/YouCompleteMe'

" 自动括号补齐插件
Plugin 'Raimondi/delimitMate'

" NERDTreeToggle 目录树插件
Plugin 'scrooloose/nerdtree'


"在此增加其他插件，安装的插件需要放在vundle#begin和vundle#end之间
"安装github上的插件格式为 Plugin '用户名/插件仓库名'
call vundle#end()            " required
" Vundle管理器配置结束

" 加载vim自带和插件相应的语法和文件类型相关脚本，必须"
filetype plugin indent on

" 插件使用设置及说明


" vim-autopep8
" 在命令行中输入 Autopep8 即可完成格式化

" vim-flake8
" Vim 普通模式下按 F7 便可以直接启动 flake8 对当前文件进行语法和格式检查。
"当检测到任何警告或错误时，Vim 会通过 quickfix 窗口 显示对应的错误信息。
"若没有检测到任何错误，vim-flake8 插件会显示 Flake8 check OK。
autocmd FileType python map <buffer> <C-C> :call flake8#Flake8()<CR>
"将检查按扭从F7换成Ctrl+C

" YouCompleteMe
" 使用 Ctrl+Q 来主动触发补全
let g:ycm_key_invoke_completion = '<C-Q>'
" 开启自动语义补全
let g:ycm_semantic_triggers =  {
			\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
			\ 'cs,lua,javascript': ['re!\w{2}'],
			\ 'html': ['re!\w{1}'],
			\ }
" 更改补全面板的颜色
highlight PMenu ctermfg=0 ctermbg=255 guifg=black guibg=Grey93
highlight PMenuSel ctermfg=255 ctermbg=0 guifg=Grey93 guibg=black
" 禁止自动弹出函数原型窗口
set completeopt=menu,menuone
let g:ycm_add_preview_to_completeopt = 0
" 设置白名单，禁止名单以外的文件格式使用
let g:ycm_filetype_whitelist = {
			\ "c":1,
			\ "cpp":1,
			\ "python":1,
			\ "objc":1,
			\ "sh":1,
			\ "zsh":1,
			\ "zimbu":1,
			\ "html":1
			\ }

" Nerdtree
" autocmd vimenter * NERDTree  "可设置自动开启Nerdtree
" 设置 Ctrl+M 快速打开目录树
map <C-M> :NERDTreeMirror<CR>
map <C-M> :NERDTreeToggle<CR>
"设定 NERDTree 视窗大小
let g:NERDTreeWinSize = 20
" 当目录树为唯一窗口时，自动关闭目录树
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" 打开vim时，如果没有指定文件，则打开目录树
autocmd vimenter * if !argc()|NERDTree|endif
" 不显示隐藏文件
" 恢复显示隐藏的文件的命令，在Nerdtree中按Ctrl-I，其中I是大写
let g:NERDTreeHidden=0
" 过滤: 所有指定文件和文件夹不显示
let NERDTreeIgnore = ['\.pyc$', '\.swp', '\.swo', '\.vscode', '__pycache__']

" 指定屏幕上可以进行分割的布局
" sv 文件名
" 纵向分割布局打开新文件
" vs 文件名
" 横向分割布局打开新文件
set splitbelow
set splitright

" split navigations
" Ctrl-j 切换到下方的分割窗口
" Ctrl-k 切换到上方的分割窗口
" Ctrl-l 切换到右侧的分割窗口
" Ctrl-h 切换到左侧的分割窗口
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" 设置ctags 自动设置tags源。
set tags=tags
set autochdir
" 设置Ctrl+T进行代码间函数的跳转和转回。
" 使用前需先在项目的主目录下运行
" sudo ctags -R
" 建立索引文件。
nnoremap <C-T> <C-]>


" Enable folding
" 代码折叠，输入za来折叠（或撤销折叠）
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
" 使用空格来代替za
nnoremap <space> za

" 设置缩进和行号
set ts=2 sw=2

" 显示行号
set number

" 突出显示当前行
set cursorline

" 设置文件编码格式
set termencoding=utf-8
set encoding=utf8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030

" 设置PEP8风格的代码缩进,各行意义如下：
" 一个tab占4个空格
" 一开始,插入的就是4个空格,此时一旦你再按下一次tab,这次的四个空格就会和上次的四个空格组合起来变成一个制表符
" 每一级自动缩进的空格数
" 设置每行代码长度限制
" 把输入的tab自动转换成空格，Python用户必用
" 自动缩进
" 设置保存格式
au BufNewFile,BufRead *.py...
			\ set tabstop=4
			\ set softtabstop=4
			\ set shiftwidth=4
			\ set textwidth=79
			\ set expandtab
			\ set autoindent
			\ set fileformat=unix

" 设置html文件的代码缩进
au BufNewFile,BufRead *.html...
			\ set tabstop=2
			\ set softtabstop=2
			\ set shiftwidth=2
			\ set textwidth=40
			\ set autoindent
			\ set expandtab


" 支持UTF-8编码
set encoding=utf-8

" 设置优先使用中文帮助文档
if version >= 603
	set helplang=cn
	set encoding=utf-8
	set fileencoding=utf-8
endif

" vim 中直接执行当前python代码，按 Ctrl+R 执行
filetype plugin on
map <C-R> :call PRUN()<CR>
func! PRUN()
	exec "w"
	if &filetype == 'python'
		exec "!python %"
	endif
endfunc

" 设置 Ctrl+A 来添加和更新文件头
map <C-A> :call TitleDet()<CR>
function AddTitle(x,y,l,h)
	if expand("%:e") == "html"
		call append(0,"<!--")
	elseif expand("%:e") == "css"
		call append(0,"/*")
	endif
	call append(1,"#//\""[a:x:a:y]." 作者：mxbbylin")
	call append(2,"#//\""[a:x:a:y]." 创建时间：".strftime("%Y-%m-%d %H:%M"))
	call append(3,"#//\""[a:x:a:y]." 最后修改时间：".strftime("%Y-%m-%d %H:%M"))
	call append(4,"#//\""[a:x:a:y]." 文件名：".expand("%:t"))
	call append(5,"#//\""[a:x:a:y]." 说明： ")
	call append(6," -->*/"[a:l:a:h])
	echohl WarningMsg | echo "成功添加文件头！" | echohl None
endfunction
"更新最近修改时间和文件名
function UpdateTitle(x,y)
	normal mk
	normal gg
	execute '/ 最后修改时间：'
	normal dd
	call append(3,"#//\""[a:x:a:y]." 最后修改时间：".strftime("%Y-%m-%d %H:%M"))
	normal gg
	execute '/ 文件名：'
	normal dd
	call append(4,"#//\""[a:x:a:y]." 文件名：".expand("%:t"))
	execute "noh"
	normal 'k
	echohl WarningMsg | echo "成功更新最后修改时间！" | echohl None
endfunction
"判断前10行代码里面，是否有Last modified这个单词，
"如果没有的话，代表没有添加过作者信息，需要新添加；
"如果有的话，那么只需要更新即可
function TitleDet()
	let l=0
	let h=0
	let x=0
	let y=0
	let judge="# 作者：mxbbylin"
	if expand("%:e") == "py"
	elseif expand("%:e") == "sql"
	elseif expand("%:e") == "c"
		let x=1
		let y=2
		let judge="// 作者：mxbbylin"
	elseif expand("%:e") == "h"
		let x=1
		let y=2
		let judge="// 作者：mxbbylin"
	elseif expand("%:e") == "cpp"
		let x=1
		let y=2
		let judge="// 作者：mxbbylin"
	elseif expand("%:e") == "java"
		let x=1
		let y=2
		let judge="// 作者：mxbbylin"
	elseif expand("%:e") == "html"
		let l=1
		let h=3
	elseif expand("%:e") == "css"
		let l=4
		let h=5
	else
		let x=3
		let y=3
		let judge="\" 作者：mxbbylin"
	endif

	let n=1
	while n < 10
		let line = getline(n)
		""       if line =~ '^\#\s*\S*mxbby\lin\S*.*$'
		if line == judge
			call UpdateTitle(x,y)
			return
		endif
		let n = n + 1
	endwhile
	call AddTitle(x,y,l,h)
endfunction




map <C+V> :call FormatCode()<CR>
func! FormatCode()
    exec "w"
    if &filetype == 'c' || &filetype == 'h'
        exec "!astyle --style=allman --suffix=none %"
    elseif &filetype == 'cpp' || &filetype == 'cc' || &filetype == 'hpp'
        exec "!astyle --style=allman --suffix=none %"
    elseif &filetype == 'perl'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'py'|| &filetype == 'python'
        exec "!autopep8 --in-place --aggressive %"
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
endfunc




