"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-Plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin()

Plug 'junegunn/vim-plug'

" Utilities
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-surround'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdcommenter'
Plug 'airblade/vim-gitgutter'

" Autocomplete & Language Server Client
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
Plug 'racer-rust/vim-racer', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Languages
Plug 'rust-lang/rust.vim'

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'

" Colors
Plug 'dracula/vim'

call plug#end()            " required
filetype plugin indent on    " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = "\<Space>"

set nu
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
set expandtab

syntax on
"color dracula

"""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""

" Airline
let g:airline_powerline_fonts = 1
let g:airline_extensions_tabline_enabled = 1

" Deoplete
let g:deoplete#enable_at_startup = 1

" LanguageClient
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['javascript-typescript-stdio'],
    \ 'typescript': ['javascript-typescript-stdio'],
    \ 'typescript.tsx': ['javascript-typescript-stdio'],
    \ }

" NERDTree
map <leader>n :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" LanguageClient
let g:LanguageClient_autoStart = 1

" Rust.vim
let g:rustfmt_autosave = 1

" CtrlP
let g:ctrlp_map = '<leader>p'
