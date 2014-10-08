set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'plasticboy/vim-markdown.git'
Plugin 'sickill/vim-monokai'
Plugin 'tomasr/molokai'
Plugin 'kien/ctrlp.vim'
Plugin 'ntpeters/vim-better-whitespace'

call vundle#end()            " required


" keys
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'


" theme
colorscheme molokai
let g:molokai_original=1
let g:rehash256=1
let g:molokai_transparent=1


" options
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*pyc
set mouse=a
set number
set numberwidth=3
set t_Co=256 " 256 terminal colors!_!_!_! HAX
set textwidth=79  " lines longer than 79 columns will be broken
set shiftwidth=4  " operation >> indents 4 columns; << unindents 4 columns
set tabstop=4     " a hard TAB displays as 4 columns
set expandtab     " insert spaces when hitting TABs
set softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
set shiftround    " round indent to multiple of 'shiftwidth'
set autoindent    " align the new line indent with the previous line
set ruler
syntax on
