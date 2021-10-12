" ----------------------------------------
" Vundle
" ----------------------------------------
"
" To install run:
" `git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/vundle.vim`

set nocompatible " be iMproved
filetype off     " required!

set rtp+=~/.config/nvim/bundle/vundle.vim
call vundle#rc()

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'
"
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
