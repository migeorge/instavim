colorscheme dichromatic

" Settings
" ========
set smartindent
set autoindent
set number
set ruler
set rulerformat=%-14.(%l,%c%V%)\ %P
set modelines=0
syntax enable

set nowrap
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set list
set backspace=indent,eol,start

set showmode
set showcmd

set listchars=""
set listchars=tab:\ \
set listchars+=trail:.
set listchars+=extends:>
set listchars+=precedes:<

if has("autocmd")
  filetype indent on
endif

" Helpful keybindings
" ===================
" remove help key
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

nnoremap ; :

" Fix tab key behavior
" ====================
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Searching
" =========
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set gdefault
set smartcase
