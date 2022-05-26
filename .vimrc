syntax enable " syntax highlighting
set number " line numbering
" set relativenumber " Hybrid line numbering 
" set hybrid
set hlsearch " search highlighting
set noswapfile " disable .swp file creation
set encoding=utf-8
set ignorecase " caseinsensitive search
set mouse=nicr
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
"Peresistent undo, make sure to create the dir ~/.vim/undodir
set undofile
set undodir=~/.vim/undodir
" Set default split directions
set splitright
set splitbelow

set ttyfast

" Enable folding
set foldmethod=indent
set foldlevel=99

" The path plugins will be installed into
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree' " NERDTree - file explorer
Plug 'Xuyuanp/nerdtree-git-plugin' 
let NERDTreeIgnore=['venv$[[dir]]','\~$', '__pycache__']
map <C-n> :NERDTreeToggle<CR>
Plug 'w0rp/ale' " Async linter engine
" Plug 'altercation/vim-colors-solarized'
" DOESN'T WORK call togglebg#map("<F5>") " switch solarized theme with F5
Plug 'tpope/vim-commentary' " Comment lines with gc
Plug 'tpope/vim-surround' " surround with s commands 

Plug 'airblade/vim-gitgutter' " Show git diff in gutter
Plug 'tpope/vim-fugitive'

" Initialize plug system
call plug#end()


" change cursor shape in different modes on iterm2+tmux
if($TERM_PROGRAM == "iTerm.app")
" Set dark theme (Looks horrid inside vscode)
	" colorscheme solarized
	set background=dark 
    " Set edit character to change between modes
	let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
	let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
	let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
en

" Autoformatter setup
autocmd FileType c,cpp setlocal equalprg=clang-format

command! ViewIssues execute "normal! \:vertical terminal ++kill=9 hub issue<CR><C-w>h" 
" autocmd FileType gitcommit ViewIssues

function! MiniTerm(...)
    execute 'terminal' join(a:000," ")
    resize 10
    normal <C-w>k
endfunction
    
command! -nargs=+ MiniTerm call MiniTerm(<f-args>)

autocmd bufwritepost .vimrc source %

