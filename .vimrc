" -------- [ Shortcuts] ----------

" F2 (List active buffers)
" F8 togle TagBar (show functions from Ctag)
"
" C-p Fuzzy search for files
" C-w Move to new window
" C-w + (inc by 10 lines)
" C-w _ (inc split to max)
" C-w = (All splits are equal)
" :res +10 (Resize split)

" :ag string
" :Tab - (Tabulerize on -)
"

" C-x C-o For php AutoComplete

" C-n Togle Tree


" -- Phpqa
" :Php - check for syntax errors
" :Phpcs - run code sniffer
" :Phpmd - run mess detector (will ask for a rule XML file if not set)
" :Phpcc - show code coverage (will ask for a clover XML file if not set)
"
" -------- [Vundle Start] --------
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

    " Treeview
	Plugin 'scrooloose/nerdtree.git'
	" Ag plugin
	Plugin 'rking/ag.vim'
    " Align text with Tabularize
    Plugin 'godlygeek/tabular'
    " Show functions etc.
    Plugin 'majutsushi/tagbar'
    
	" Git client
	Plugin 'tpope/vim-fugitive'
   

    " EasyMotion
    Plugin 'easymotion/vim-easymotion'


	" PHPUnit QF (Unit tests for VIM)
	"Plugin 'joonty/vim-phpunitqf.git' 
	" VDebug (runs the XDbeug)
	"Plugin 'joonty/vdebug.git'

    " Php QA Tools
	Bundle 'joonty/vim-phpqa.git'

call vundle#end()
filetype plugin indent on
" -------- [Vundle End] --------

" Load CtrlP (Fuzzy find)
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Load Tabular 
"set runtimepath^=~/.vim/bundle/tabular

syntax enable                        " Enable syntax highlighting

set clipboard=unnamedplus             " yank and paste with the system clipboard
"set mouse=nicr                       " Scroll inside Vim and not terminal window
set mouse=a                           " Mouse selects in visual mode

set directory-=.                     " don't store swapfiles in the current directory
set encoding=utf-8

set ruler                            " show where you are
set number                           " Set linenumbers

set omnifunc=syntaxcomplete#Complete " OnmiComplete


" Search settings
set ignorecase                       " Case will be ignored when you search
set incsearch                        " You will see results while you type
set hlsearch                         " Search matches are highlighted

set expandtab
set smarttab
set shiftwidth=4                     " normal mode indentation commands use 4 spaces
set tabstop=4                        " actual tabs occupy 4 characters
set autoindent
set smartindent
set wrap


" Set leader to ,
let mapleader = ','


nmap <F8> :TagbarToggle<CR>


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
    map <C-f> :NERDTreeFind<CR>
" -------- [NERDTree End] --------


" -------- [PHP QA tool] Start---------
    let g:phpqa_messdetector_ruleset = "/path/to/phpmd.xml"

    " Set the codesniffer args
    let g:phpqa_codesniffer_args = "--standard=Zend"


    " PHP executable (default = "php")
    let g:phpqa_php_cmd='/path/to/php'

    " PHP Code Sniffer binary (default = "phpcs")
    let g:phpqa_codesniffer_cmd='/path/to/phpcs'

    " PHP Mess Detector binary (default = "phpmd")
    let g:phpqa_messdetector_cmd='/path/to/phpmd'
" -------- [PHP QA tool End]---------


" Shortcut modifiers
" "D" = "Command/cmd button"
" "S" = "Shift button"
" "C" = "Ctrl button"
" "M" = "Alt/Option/Meta button"

" Space for search (Never use this)
" nmap <Space> /

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

" List buffers and wait for number to switch
nnoremap <F2> :buffers<CR>:buffer<Space>

" n = Next tab
"map <C-n> :tabn<cr>
" p = Prev tab
"map <C-p> :tabp<cr>
" t = tab (new tab)
"map <C-t> :tabnew<cr>


" -------- [Unittest Start] --------
	" Run unit tests (Shift-Ctrl-r)
	nnoremap <S-C-r> :Test %<CR>

" Set the phpunit command
	" let g:phpunit_cmd = "~/Sites/frontend/vendor/bin/phpunit"

" Set the args for phpunit
	" let g:phpunit_args = "--bootstrap ~/Sites/frontend/src/config/test-prepend.php"
	" What it looks like on commandline:
	" phpunit --bootstrap ~/Sites/frontend/src/config/test-prepend.php BrowseHandlerTest.php
" -------- [Unittest End] --------
"
