" +
" Author: Hong Chen
" URL:    http://me.hongchen.cz
" Source: https://github.com/hong-chen/dotfiles/vim
" Email:  me@hongchen.cz
" Special thanks to Rintaro Okamura (github.com/rinx)
" -

" ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" <basic settings>
" set to non-compatible mode
if &compatible
    set noncompatible
endif

" set encoding
set encoding=utf-8

" turn on syntax
syntax on

" highlight unwanted spaces
set list listchars=tab:▷⋅,trail:⋅,nbsp:⋅

" turn on relative line numbering
set number relativenumber

" stop line breaking
set nowrap

" turn off swapfile
set noswapfile

" indent settings
filetype plugin indent on
set autoindent
set smartindent
if v:version >= 750
    set breakindent
endif

" tab settings
set expandtab " turn tab into spaces
set smarttab
set tabstop=4
set softtabstop=4 " insert tabs/spaces to simulate tab stops
set shiftwidth=4

set textwidth=79

" search settings
set hlsearch
set incsearch
set ignorecase
set smartcase

set cursorline
" ------------------------------------------------------------------------------

" ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" <plugins management>
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" alignment
Plug 'junegunn/vim-easy-align'

" snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" python fold
Plug 'tmhedberg/simpylfold', { 'for': 'python' }
let g:SimpylFold_docstring_preview=1

" auto pairing
Plug 'jiangmiao/auto-pairs'

" surroundings in pair
Plug 'tpope/vim-surround'

" commenting
Plug 'scrooloose/nerdcommenter'
filetype plugin on
let g:NERDSpaceDelims=1
let g:NERDDefaultAlign='left'
let g:NERDTrimTrailingWhitespace=1

" file browsing
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
"let g:nerdtree_tabs_open_on_console_startup=1

" git integration
Plug 'tpope/vim-fugitive'

" syntax checking
Plug 'scrooloose/syntastic', { 'for': 'python' }
Plug 'nvie/vim-flake8', { 'for': 'python' }
let python_highlight_all=1

" solarized theme
Plug 'altercation/vim-colors-solarized', { 'do': 'mv ~/.vim/plugged/vim-colors-solarized/colors ~/.vim/' }
set background=dark
if !empty(glob('~/.vim/colors/solarized.vim'))
    if !exists(":colorscheme solarized")
        colorscheme solarized
    endif
endif

" status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
set laststatus=2
call plug#end()
" ------------------------------------------------------------------------------
