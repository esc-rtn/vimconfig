set belloff=all
colorscheme Molokai
set background=dark
set backspace=indent,eol,start

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
set lines=999 columns=999
au GUIEnter * simalt ~x

if has('gui_running')
  set guifont=Consolas:h11
endif

noremap pp "0p
noremap :W :w
noremap WQ wq
noremap Wq wq
noremap W w
noremap Q q

"vim mappings
inoremap kj <Esc>
"resistance is futile...
inoremap <Left>  <NOP>
inoremap <Right> <NOP>
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>

nnoremap   <Up>     <NOP>
nnoremap   <Down>   <NOP>
nnoremap   <Left>   <NOP>
nnoremap   <Right>  <NOP>


call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree',
Plug 'OmniSharp/omnisharp-vim',
Plug 'tpope/vim-dispatch',
Plug 'scrooloose/syntastic',
Plug 'ctrlpvim/ctrlp.vim',

call plug#end()

let javaScript_fold=1         " JavaScript
let sh_fold_enabled=1         " sh
let vimsyn_folding='af'       " Vim script
let xml_syntax_folding=1      " XML
let mapleader=','
let g:indent_guides_guide_size = 1

syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

"improve autocomplete menu color
highlight PMenu gui=bold guibg=#CECECE guifg=#444444


autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd w

autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

command -nargs=+ Sf grep -r <args> *

nnoremap ;;; :NERDTreeToggle<CR>
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

 function! s:CloseIfOnlyNerdTreeLeft()
   if exists("t:NERDTreeBufName")
       if bufwinnr(t:NERDTreeBufName) != -1
             if winnr("$") == 1
                     q
             endif
       endif
   endif
 endfunction

