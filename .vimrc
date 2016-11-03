set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
Bundle 'Valloric/YouCompleteMe'
Bundle 'Valloric/ListToggle'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set termencoding=utf-8
set encoding=utf-8
set cscopequickfix=s-,c-,d-,i-,t-,e-

let g:persistentBehaviour=0
let g:winManagerWindowLayout='FileExplorer|TagList,BufExplorer'
"let g:winManagerWindowLayout='NERDTree|TagList'
map <c-w><c-f> :FirstExplorerWindow<cr>
map <c-w><c-b> :BottomExplorerWindow<cr>
nmap wm :WMToggle<cr>

"这条命令，实际上是执行$vimRUNTIME/syntax/syntax.vim脚本。如果你还没有打开文件类型检测功能，
"在这个脚本里会把它打开，因为要语法高亮，首先需要知道是什么文件类型。然后它会安装Filetype自动命令，
"在检测到文件类型时，设置syntax选项。而对syntax选项进行设置，又会触发Syntax自动命令，这条自动命令
"会在runtimepath的syntax子目录搜寻该类型的语法文件，并使用缺省的配色方案进行染色。
syntax enable
syntax on

"可以在其中找到一个自己喜欢的。安装colorscheme时，只需要把它们拷贝到.vim/color目录下就行了。
colorscheme desert
hi Search  guibg=yellow guifg=wheat

set tabstop=4
set shiftwidth=4
set noexpandtab
set smartindent
set autoindent
set incsearch
set hlsearch

if exists('+colorcolumn')
  set colorcolumn=100
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

"删除末尾的空格
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal 'z"
endfunc

set nu
set relativenumber
set nocompatible

" YouCompleteMe
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gd :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_always_populate_location_list = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
set tags+=./.tags

set laststatus=2

set background=light
set background=dark
