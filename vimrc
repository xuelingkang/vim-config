" 基本配置
let mapleader=' '
syntax enable
set showmode
set showcmd
set mouse=a
set encoding=utf-8
set t_Co=256
filetype indent on
filetype plugin on

" 缩进
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

" 外观
set number
set relativenumber
set cursorline
set wrap
set linebreak
set wrapmargin=2
set scrolloff=5
set laststatus=2
set ruler
colorscheme dracula
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'

" 搜索
set showmatch
set hlsearch
set incsearch
set ignorecase
set smartcase

" 编辑
set backup
set swapfile
set undofile
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//
set undodir=~/.vim/.undo//
set autochdir
set noerrorbells
set visualbell
set history=1000
set autoread
" 如果行尾有多余的空格（包括 Tab 键），该配置将让这些空格显示成可见的小方块
set listchars=tab:»■,trail:■
set list
" 命令模式下，底部操作指令按下 Tab 键自动补全。第一次按下 Tab，会显示所有匹配的操作指令的清单；第二次按下 Tab，会依次选择各个指令
set wildmenu
set wildmode=longest:list,full
set clipboard=unnamedplus,unnamed
" 记住光标位置
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|end

" 退出编辑模式自动切换为英文输入法
function! InputMethodEn()
    if has('mac')
        let l:a = system("InputSourceSelector select com.apple.keylayout.ABC")
    elseif has('linux')
        let l:a = system("fcitx5-remote -c")
    endif
endfunction
set ttimeoutlen=100
autocmd InsertLeave * call InputMethodEn()

" 搜索选中的文本
vnoremap // y/<C-r>"<return>

" 清除搜索
nnoremap <esc><esc> :noh<return> :let @/ = ""<return>

" NERDTree
nnoremap <leader>nt :NERDTreeToggle<CR>

" startify书签
let g:startify_bookmarks = [
        \ '~/.vimrc',
        \ '~/.ideavimrc',
        \ '~/.zshrc',
        \ '~/.oh-my-zsh/custom/lazy/',
        \]

