" Shortcuts in cheat-sheets/vim-keys.txt 

" Shortcut modifiers
" "D" = "Command/cmd button"
" "S" = "Shift button"
" "C" = "Ctrl button"
" "M" = "Alt/Option/Meta button"


set nocompatible                     " Use Vim settings, rather then Vi settings

" -------- [Vundle Start] --------
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

    Plugin 'scrooloose/nerdtree.git'   " Treeview
	Plugin 'rking/ag.vim'              " Ag plugin
    Plugin 'godlygeek/tabular'         " Align text with Tabularize
    Plugin 'majutsushi/tagbar'         " Show functions etc.
	Plugin 'tpope/vim-fugitive'        " Git client
    Plugin 'vim-scripts/svndiff'       " Git diff
    Plugin 'easymotion/vim-easymotion' " EasyMotion
    Plugin 'kien/ctrlp.vim'            " Fuzzy find


call vundle#end()
filetype plugin indent on
" -------- [Vundle End] --------

syntax enable                        " Enable syntax highlighting

set clipboard=unnamedplus            " Yank and paste with the system clipboard
set mouse=a                          " Mouse selects in visual mode (Used nicr)

set directory-=.                     " Don't store swapfiles in the current directory
set encoding=utf-8

set ruler                            " Dhow where you are
set number                           " Set linenumbers
set numberwidth=5                    " Width of numbers
set showcmd                          " Display incomplete commands
set so=7                             " Set the scrolloff cursor position. See 7 lines under
set laststatus=2                     " Always display the status line

set omnifunc=syntaxcomplete#Complete " OnmiComplete

set incsearch                        " You will see results while you type
set hlsearch                         " Search matches are highlighted
set ignorecase                       " Case will be ignored when you search
set smartcase                        " If search contains up-case it is case sensitive

set expandtab                        " Insert space characters whenever the tab key is pressed
set tabstop=4                        " Actual tabs occupy 4 characters
set shiftwidth=4                     " Normal mode indentation commands use 4 spaces
set autoindent                       " Use the indentation from the previous line, when starting a new line
set smartindent                      " Inserts one extra level of indentation in (if, while, for etc.)
set smarttab                         " Dont think I need this

set wrap                             " Word wrap only visually
set nostartofline                    " Keep column when jumping to other lines

set backspace=2                      " Backspace deletes like most programs in insert mode
set backspace=indent,eol,start       " Delete over line breaks etc.
set history=500                      " History includes previous search patterns as well as command-line entries

set undodir=~/.vim/undo/             " Set a directory to store the undo history
set undofile                         " Use a file for persistent undo
set undolevels=1000                  " Maximum number of changes that can be undone
set undoreload=10000                 " Maximum number lines to save for undo on a buffer reload

colorscheme eystein
set background=dark                  " Tell Vim that we are using a dark background
set encoding=utf-8                   " Sets how vim shall represent characters internally

set nobackup                         " Dont keep backup files
set nowb                             " No automatic write backup
set noswapfile                       " No swap files

set ffs=unix,dos,mac                 " Vim will look for these file formats. New will use unix

set autoread                         " Reloads on some external commands
set showmatch                        " Show match-paren like { } and use % to jump
set visualbell                       " Chose -visual bell- effect rather than -beeping-
set hidden                           " Causes files to be hidden instead of closed

set spell

" Fuzzy finder: ignore stuff that can't be opened, and generated files
let g:fuzzy_ignore ="*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif;vendor/**;coverage/**;tmp/**;rdoc/**"

" Not so sure about this one 
"nnoremap <Left> :echoe "Use h"<CR>
"nnoremap <Right> :echoe "Use l"<CR>
"nnoremap <Up> :echoe "Use k"<CR>
"nnoremap <Down> :echoe "Use j"<CR>


" Activate visual mode in normal mode with shift-arrow (might not be smart)
nmap <S-Up> v<Up>
nmap <S-Down> v<Down>
nmap <S-Left> v<Left>
nmap <S-Right> v<Right>
vmap <S-Up> <Up>
vmap <S-Down> <Down>
vmap <S-Left> <Left>
vmap <S-Right> <Right>
imap <S-Up> <Esc>v<Up>
imap <S-Down> <Esc>v<Down>
imap <S-Left> <Esc>v<Left>
imap <S-Right> <Esc>v<Right>
" Paste, copy, cut
vmap <C-c> y<Esc>i
vmap <C-x> d<Esc>i
map <C-v> pi
imap <C-v> <Esc>pi
imap <C-z> <Esc>ui

"Commenting with # " or //
vmap ,# :s/^/#/<CR>:noh<CR>
vmap ,// :s/^/\/\//<CR>:noh<CR>
vmap ," :s/^/"/<CR>:noh<CR>


noremap <C-d> <Del> " Forward-delete

nnoremap <CR> :noh<CR><CR> " Clear search highlight



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


