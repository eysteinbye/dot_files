" Shortcuts in cheat-sheets/vim-keys.txt 
"
" Shortcut modifiers
" "D" = "Command/cmd button"
" "S" = "Shift button"
" "C" = "Ctrl button"
" "M" = "Alt/Option/Meta button"
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
   
    " Git diff
    Plugin 'vim-scripts/svndiff'

    " EasyMotion
    Plugin 'easymotion/vim-easymotion'


	" PHPUnit QF (Unit tests for VIM)
	" Plugin 'joonty/vim-phpunitqf.git' 
	" VDebug (runs the XDbeug)
	" Plugin 'joonty/vdebug.git'

    " Php QA Tools
	" Bundle 'joonty/vim-phpqa.git'

    Plugin 'flazz/vim-colorschemes'

    " To try: 
    " https://github.com/Shougo/unite.vim
    " https://github.com/Shougo/neocomplete.vim

call vundle#end()
filetype plugin indent on
" -------- [Vundle End] --------

" Load CtrlP (Fuzzy find)
set runtimepath^=~/.vim/bundle/ctrlp.vim

syntax enable                        " Enable syntax highlighting

set clipboard=unnamedplus            " yank and paste with the system clipboard
"set mouse=nicr                      " Scroll inside Vim and not terminal window
set mouse=a                          " Mouse selects in visual mode

set directory-=.                     " don't store swapfiles in the current directory
set encoding=utf-8

set ruler                            " show where you are
set number                           " Set linenumbers
set numberwidth=5                    " Width of numbers

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


set nocompatible  " Use Vim settings, rather then Vi settings

set backspace=2   " Backspace deletes like most programs in insert mode
set history=500
set showcmd       " display incomplete commands
set laststatus=2  " Always display the status line

" Fuzzy finder: ignore stuff that can't be opened, and generated files
let g:fuzzy_ignore ="*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif;vendor/**;coverage/**;tmp/**;rdoc/**"

" Color scheme
colorscheme phphaxor
set background=dark
set encoding=utf-8


" Not so sure about this one 
"nnoremap <Left> :echoe "Use h"<CR>
"nnoremap <Right> :echoe "Use l"<CR>
"nnoremap <Up> :echoe "Use k"<CR>
"nnoremap <Down> :echoe "Use j"<CR>


" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
set complete=.,w,t
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>


" Persistent undo
set undodir=~/.vim/undo/
set undofile
set undolevels=1000
set undoreload=10000



noremap <F4> :call Svndiff("next")<CR>
let g:svndiff_autoupdate = 1
" Git diff highlight colors
hi DiffAdd      ctermfg=0 ctermbg=2 guibg='green'
hi DiffDelete   ctermfg=0 ctermbg=1 guibg='red'
hi DiffChange   ctermfg=0 ctermbg=3 guibg='yellow'


" http://vimdoc.sourceforge.net/htmldoc/spell.html
" setlocal spell spelllang=en_us

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

    " ToDo Add correct path here

    "let g:phpqa_messdetector_ruleset = "/path/to/phpmd.xml"

    " Set the codesniffer args
    " let g:phpqa_codesniffer_args = "--standard=Zend"


    " PHP executable (default = "php")
    let g:phpqa_php_cmd='~/Sites/frontend/bin/zphp'

    " PHP Code Sniffer binary (default = "phpcs")
    "let g:phpqa_codesniffer_cmd='/path/to/phpcs'

    " PHP Mess Detector binary (default = "phpmd")
    " let g:phpqa_messdetector_cmd='/Users/ebye/Sites/frontend/vendor/phpmd/phpmd'
" -------- [PHP QA tool End]---------


" nmap <Space> /      " Space for search (Never use this)

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
