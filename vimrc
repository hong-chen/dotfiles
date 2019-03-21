" +
" Author: Hong Chen
" URL:    http://me.hongchen.cz
" Source: https://github.com/hong-chen/dotfiles/vimrc
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

" allow vim to delete anything
set backspace=indent,eol,start

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
set expandtab     " when press [Tab], insert spaces
set smarttab
set tabstop=4     " show existing tab with 4 spaces width
set softtabstop=4 " insert tabs/spaces to simulate tab stops
set shiftwidth=4  " when indenting with [>], use 4 spaces width

" set textwidth=79

" search settings
set hlsearch
set incsearch
set ignorecase
set smartcase

set virtualedit=all

filetype plugin on

" cursorline settings (steal from Rintaro Okamura)
set updatetime=1500
augroup hchen-cursorcolumn
    autocmd!
    autocmd CursorMoved,CursorMovedI,WinLeave * setlocal nocursorline
    autocmd CursorMoved,CursorMovedI,WinLeave * setlocal nocursorcolumn
    autocmd CursorHold,CursorHoldI * setlocal cursorline
    autocmd CursorHold,CursorHoldI * setlocal cursorcolumn
augroup END

augroup hchen-filetypes
    autocmd BufNewFile,BufRead .tmux.conf*,tmux.conf* setf tmux
    autocmd BufNewFile,BufRead *.{F90,f90,F77,f77,nml} setf fortran
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} setf markdown
augroup END

autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype markdown setlocal ts=2 sw=2 expandtab
autocmd Filetype idlang setlocal ts=2 sw=2 expandtab
autocmd Filetype fortran setlocal ts=2 sw=2 expandtab

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
Plug 'Konfekt/FastFold', { 'for': 'python' }
Plug 'tmhedberg/simpylfold', { 'for': 'python' }

" auto complete (can add more rules)
Plug 'cohama/lexima.vim'

" surroundings in pair
Plug 'tpope/vim-surround'

" commenting
Plug 'scrooloose/nerdcommenter'

" Emmet
Plug 'mattn/emmet-vim'

" file browsing
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'

" git integration
Plug 'tpope/vim-fugitive'

" syntax checking
Plug 'nvie/vim-flake8', { 'for': 'python' }

" remember last edit position
Plug 'farmergreg/vim-lastplace'

" preview markdown file
Plug 'kannokanno/previm', { 'for': 'markdown' }

" markdown syntax highlight
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" preview html file
"Plug 'jaxbot/browserlink.vim', { 'for': 'html' }

" grammer check
Plug 'rhysd/vim-grammarous', { 'for': 'markdown' }

" html emmet
Plug 'mattn/emmet-vim'

" html html5
Plug 'othree/html5.vim'

" rST riv, InstantRst
Plug 'Rykka/riv.vim'
Plug 'Rykka/InstantRst'

" easy-align
Plug 'junegunn/vim-easy-align'

" solarized theme
Plug 'altercation/vim-colors-solarized', { 'do': 'mv ~/.vim/plugged/vim-colors-solarized/colors ~/.vim/' }

" status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()
" ------------------------------------------------------------------------------

" ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" Plugin settings

" python fold settings
let g:SimpylFold_docstring_preview=1
let g:SimpylFold_fold_import=0
let b:SimpylFold_fold_import=0

" snippets settings
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "my_snippets"]

" nerdcommenter settings
let g:NERDSpaceDelims=0
let g:NERDDefaultAlign='left'
let g:NERDTrimTrailingWhitespace=1

" vim-flake8 settings
let python_highlight_all=1

" previm settings
let g:previm_open_cmd = 'open -a "Google Chrome"'

" vim-markdown settings
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_new_list_item_indent = 2

" riv.vim settings
let g:instant_rst_browser = 'chrome'
let g:riv_fold_auto_update = 0
autocmd Filetype rst set nofoldenable

" easy-align settings
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" nerdtree settings
autocmd vimenter * NERDTree
autocmd VimEnter * wincmd p
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" solarized theme settings
set background=dark
if !empty(glob('~/.vim/colors/solarized.vim'))
    if !exists(":colorscheme solarized")
        let g:solarized_termtrans=1
        colorscheme solarized
    endif
endif

" lexima settings
"let g:lexima_map_escape = '<Esc>'
"let g:lexima_enable_basic_rules = 1
"let g:lexima_enable_newline_rules = 0
"let g:lexima_enable_endwise_rules = 1

" lexima settings (Tex) [steal from Rintaro]
"call lexima#add_rule({'char': '$', 'input_after': '$', 'filetype': ['tex','latex','plaintex']})
"call lexima#add_rule({'char': '$', 'at': '\%#\$', 'leave': 1, 'filetype': ['tex','latex','plaintex']})
"call lexima#add_rule({'char': '<BS>', 'at': '\$\%#\$', 'delete': 1, 'filetype': ['tex','latex','plaintex']})
"call lexima#add_rule({'char': '<CR>', 'at': '^\s*%\s.*\%#', 'input': '<CR>% ', 'filetype': ['tex','latex','plaintex']})

" lexima settings (Fortran) [steal from Rintaro]
"call lexima#add_rule({'char': '<CR>', 'at': '^\s*if\>.*then\%#', 'input_after': '<CR>end if', 'filetype': ['fortran']})
"call lexima#add_rule({'char': '<CR>', 'at': '^\s*do.*\%#', 'input_after': '<CR>end do', 'filetype': ['fortran']})
"call lexima#add_rule({'char': '<CR>', 'at': '^\s*select\s*case\s*.*\%#', 'input_after': '<CR>end select', 'filetype': ['fortran']})
"call lexima#add_rule({'char': '<CR>', 'at': '^\s*!\s.*\%#', 'input': '<CR>! ', 'filetype': ['fortran']})
"call lexima#add_rule({'char': '<CR>', 'at': '^\s*program\>.*\%#', 'input_after': '<CR>end program', 'filetype': ['fortran']})

" lexima settings (IDL) [steal from Rintaro]
"call lexima#add_rule({'char': '<CR>', 'at': '^\s*if\>.*then\s*begin\%#', 'input_after': '<CR>endif', 'filetype': ['idlang']})
"call lexima#add_rule({'char': '<CR>', 'at': '^\s*endif\s*else\s*begin\%#', 'input_after': '<CR>endelse', 'filetype': ['idlang']})
"call lexima#add_rule({'char': '<CR>', 'at': '^\s*for\s*\>.*do\s*begin\%#', 'input_after': '<CR>endfor', 'filetype': ['idlang']})
"call lexima#add_rule({'char': '<CR>', 'at': '^\s*case\>.*of\%#', 'input_after': '<CR>endcase', 'filetype': ['idlang']})
"call lexima#add_rule({'char': '<CR>', 'at': '^\s*\;\s.*\%#', 'input': '<CR>; ', 'filetype': ['idlang']})
"call lexima#add_rule({'char': '<CR>', 'at': '^\s*pro\>.*\%#', 'input_after': '<CR>end', 'filetype': ['idlang']})

" lexima settings (markdown) [steal from Rintaro]
"call lexima#add_rule({'char': '**', 'input_after': '**', 'filetype': ['markdown']})
"call lexima#add_rule({'char': '<BS>', 'at': '\*\%#\*', 'delete': 1, 'filetype': ['markdown']})
"call lexima#add_rule({'char': '<BS>', 'at': '_\%#_', 'delete': 1, 'filetype': ['markdown']})
"call lexima#add_rule({'char': '~~', 'input_after': '~~', 'filetype': ['markdown']})
"call lexima#add_rule({'char': '<BS>', 'at': '\~\%#\~', 'delete': 1, 'filetype': ['markdown']})
"call lexima#add_rule({'char': '<CR>', 'at': '^\s*\*\s.*\%#', 'input': '<CR>* ', 'filetype': ['markdown']})
"call lexima#add_rule({'char': '<CR>', 'at': '^\s*+\s.*\%#', 'input': '<CR>+ ', 'filetype': ['markdown']})
"call lexima#add_rule({'char': '<CR>', 'at': '^\s*-\s.*\%#', 'input': '<CR>- ', 'filetype': ['markdown']})

" vim-airline settings
let g:airline_powerline_fonts = 1
set laststatus=2
" ------------------------------------------------------------------------------
