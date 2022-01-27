set number relativenumber
set clipboard+=unnamedplus

set tabstop=4
set shiftwidth=4
set expandtab

set nohls

call plug#begin('~/.config/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'evanleck/vim-svelte'
call plug#end()
