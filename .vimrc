" -------- [Vundle Start] --------
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

	Plugin 'gmarik/vundle'

	Plugin 'scrooloose/nerdtree.git'

	Plugin 'Buffergator'

	" PHPUnit QF (Unit tests for VIM)
	Bundle 'joonty/vim-phpunitqf.git' 
	"VDebug (runs the XDbeug)
	Bundle 'joonty/vdebug.git'
	" Git client
	Bundle 'tpope/vim-fugitive'

	" Ag plugin
	Plugin 'rking/ag.vim'
" Får ikke denne til å virke.. noe feil med Vundle som jeg ikke har tid til nå
"    Plugin 'godlygeek/tabular'

	"Plugin 'php.vim'
	"Plugin 'php-doc'
	"Bundle 'joonty/vim-phpqa.git'

call vundle#end()
filetype plugin indent on
" -------- [Vundle End] --------


" Load CtrlP (Fuzzy find)
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Load Tabular 
set runtimepath^=~/.vim/bundle/tabular
"
"OnmiComplete
set omnifunc=syntaxcomplete#Complete

" Scroll inside Vim and not terminal window
set mouse=nicr

" Search settings
set ignorecase " Case will be ignored when you search
set incsearch " You will see results while you type
set hlsearch " Search matches are highlighted

" Enable syntax highlighting
syntax enable

" Set linenumbers
set number

set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set autoindent
set smartindent
set wrap


" Set leader to ,
let mapleader = ','


" -------- [NERDTree Start] --------
	" Load NERDTree
	autocmd VimEnter * NERDTree
	" Go to previous (main) window.
	autocmd VimEnter * wincmd p
	" Close VIM if NERDTree is only open window
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
	" NERDTree OS-X fix
	let g:NERDTreeDirArrows=0

	" Togle NERDTreee on C-n (Show the tree-view)
	map <C-n> :NERDTreeToggle<CR>
	" Show the open file in NERDTree
	nnoremap <leader>f :NERDTreeFind<CR>
" -------- [NERDTree End] --------



" Shortcut modifiers
" "D" = "Command/cmd button"
" "S" = "Shift button"
" "C" = "Ctrl button"
" "M" = "Alt/Option/Meta button"

" Space for search
nmap <Space> /

" Move lines up or down
noremap <C-Up> ddkkp
noremap <C-Down> ddp

" Up and Down work normaly on wrapped lines
map j gj
map k gk
map <Down> gj
map <Up> gk

" Check what is unsaved
map <leader>diff :w !diff % -

" List buffest and wait for number to switch
nnoremap <F2> :buffers<CR>:buffer<Space>

" n = Next tab
map <c-n> :tabn<cr>
" p = Prev tab
map <c-p> :tabp<cr>
" t = tab (new tab)
map <c-t> :tabnew<cr>


" -------- [Unittest Start] --------
	" Run unit tests (Shift-Ctrl-r)
	nnoremap <S-C-r> :Test %<CR>

	" Set the phpunit command
	"let g:phpunit_cmd = "~/Sites/frontend/vendor/bin/phpunit"

	" Set the args for phpunit
	"let g:phpunit_args = "--bootstrap ~/Sites/frontend/src/config/test-prepend.php"
	" What it looks like on commandline:
	" phpunit --bootstrap ~/Sites/frontend/src/config/test-prepend.php BrowseHandlerTest.php
" -------- [Unittest End] --------
