set nobackup
set showmode
set tabstop=4
set shiftwidth=4
set showmatch
set backspace=2
set number
set ignorecase
set expandtab
set diffopt=filler,iwhite
set hlsearch
set fileencoding=japan
set fileencodings=utf-8,latin
set encoding=utf-8

nnoremap j gj
nnoremap k gk
nnoremap <Down> g<Down>
nnoremap <Up> g<Up>


let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBuffs = 1

au BufRead,BufNewFile Makefile set noexpandtab

syntax on

