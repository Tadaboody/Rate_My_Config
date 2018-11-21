syntax enable " syntax highlighting
set number " line numbering
" set relativenumber " Hybrid line numbering 
" set hybrid
set hlsearch " search highlighting
set noswapfile " disable .swp file creation
set encoding=utf-8
set ignorecase " caseinsensitive search
set mouse=nicr
" Indents
filetype plugin indent on    " required
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
"Peresistent undo, make sure to create the dir ~/.vim/undodir
set undofile
set undodir=~/.vim/undodir
" VUNDLE
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)
Plugin 'scrooloose/nerdtree' " NERDTree - file explorer
Plugin 'Xuyuanp/nerdtree-git-plugin' 
let NERDTreeIgnore=['venv$[[dir]]','\~$', '__pycache__']
map <C-n> :NERDTreeToggle<CR>
Plugin 'wakatime/vim-wakatime' " Wakatime
Plugin 'w0rp/ale' " Async linter engine
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
set laststatus=2 " always show powerline (0 - never,1 - only when split, 2 - always)
Plugin 'altercation/vim-colors-solarized'
" DOESN'T WORK call togglebg#map("<F5>") " switch solarized theme with F5
Plugin 'tpope/vim-commentary' " Comment lines with gc
Plugin 'tpope/vim-surround' " surround with s commands 

Plugin 'alfredodeza/pytest.vim'
filetype on
filetype plugin on
Plugin 'airblade/vim-gitgutter' " Show git diff in gutter

Plugin 'maralla/completor.vim'
let g:completor_python_binary = 'python3'
let g:completor_clang_binary = 'clang'
let g:completor_complete_options = 'menuone,noselect,preview'
" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" END VUNDLE


"

" Enable folding
set foldmethod=indent
set foldlevel=99

" change cursor shape in different modes on iterm2+tmux
if($TERM_PROGRAM== "iTerm.app")
" Set dark theme (Looks horrid inside vscode)
	colorscheme solarized
	set background=dark 
	let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
	let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
	let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
en

" Autoformatter setup
autocmd FileType c,cpp setlocal equalprg=clang-format
autocmd FileType python setlocal equalprg=autopep8\ -\ -a

"python with virtualenv support
" Doesn't work
"py << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"  project_base_dir = os.environ['VIRTUAL_ENV']
"  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"  execfile(activate_this, dict(__file__=activate_this))
"EOF
" :silent exec
set splitright
set splitbelow
"Make a vertical split that lists the issues, uses https://github.com/github/hub
command! ViewIssues execute "normal! \:vertical terminal hub issue<CR><C-w>h" 
autocmd FileType gitcommit ViewIssues
autocmd bufwritepost .vimrc source %
