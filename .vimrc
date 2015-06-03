" ------VUNDLE CONFIG------
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" This is the Vundle package, which can be found on GitHub.
" For GitHub repos, you specify plugins using the
" 'user/repository' format
Plugin 'gmarik/vundle'

" ------PLUGINS--------

" We could also add repositories with a ".git" extension
Plugin 'scrooloose/nerdtree.git'

" To get plugins from Vim Scripts, you can reference the plugin
" by name as it appears on the site
Plugin 'Buffergator'

" PHPUnit QF (Unit tests for VIM)
Bundle 'joonty/vim-phpunitqf.git' 
"VDebug (runs the XDbeug)
Bundle 'joonty/vdebug.git'
" Git client
Bundle 'tpope/vim-fugitive'

"Plugin 'php.vim'
"Plugin 'php-doc'
"Bundle 'joonty/vim-phpqa.git'



" todo : load ctrlP with VUNDLE
" All of your Plugins must be added before the following line
call vundle#end()

"--------SETTINGS---------
" Now we can turn our filetype functionality back on
filetype plugin indent on

"OnmiComplete
set omnifunc=syntaxcomplete#Complete

" Load CtrlP (Fuzzy find)
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Scroll inside Vim and not terminal window
set mouse=nicr

" Search settings
set ignorecase " Case will be ignored when you search
set incsearch " You will see results while you type
set hlsearch " Search matches are highlighted


"Enable syntax highlighting
syntax enable

"Set linenumbers
set number

" Start NERDTree
autocmd VimEnter * NERDTree
" Go to previous (main) window.
autocmd VimEnter * wincmd p

" Close VIM if NERDTree is only open window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif




"Togle NERDTreee on C-n
map <C-n> :NERDTreeToggle<CR>

"NERDTree OS-X fix
let g:NERDTreeDirArrows=0


" Keybard shortcuts
let mapleader = ','
"nnoremap <C-x> <C-o>c
nnoremap <leader>f :NERDTreeFind<CR>
"nnoremap <leader>g :GitGutterToggle<CR>
nnoremap <S-C-r> :Test %<CR>

"Space for search
"nmap <Space> /
"nmap <C-Space> <C-x> <C-o>

map <c-l> :tabn<cr>
map <c-h> :tabp<cr>
" map <c-n> :tabnew<cr>


" the modifier "D" stands for the "Command" key
" S is shift
" " C is Ctrl
" Meta" is the "Option"/"Alt" key on the Mac.  "M"

noremap <C-Up> ddkkp
noremap <C-Down> ddp

nnoremap <C-s> :w<CR>

" Unit-test settings for FRONTEND
"let g:phpunit_args = "--bootstrap ~/Sites/frontend/src/config/test-prepend.php"
" phpunit --bootstrap ~/Sites/frontend/src/config/test-prepend.php BrowseHandlerTest.php
"let g:phpunit_cmd = "~/Sites/frontend/vendor/bin/phpunit"
" ~/Sites/phpUnit/phpunit-lts.phar"
