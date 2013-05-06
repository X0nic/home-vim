set nocompatible               " be iMproved
filetype off                   " required!


set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs

"let g:Powerline_symbols = 'fancy'

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
Bundle 'ack.vim'

" vim-scripts repos
Bundle 'L9'
"Bundle 'FuzzyFinder'
" non github repos
"Bundle 'git://git.wincent.com/command-t.git'
" ...

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

syntax enable
set autoread                      " Automatically reload changes if detected

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.
set cursorline                    " Highlight current line

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set nowrap                        " Turn off line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif
nmap <leader>v :edit $MYVIMRC<CR>


" -----------------------------
" Backups, Tmp Files, and Undo
" -----------------------------
set backup
set backupdir=~/.vim/.backup
set directory=~/.vim/.tmp
" Persistent Undo
set undofile
set undodir=~/.vim/.undo

" UNCOMMENT TO USE
set tabstop=2                    " Global tab width.
set shiftwidth=2                 " And again, related.
set expandtab                    " Use spaces instead of tabs

" We don't need no stinking whitespace
autocmd FileType coffee,css,cucumber,haml,ruby,sass,yaml autocmd BufWritePre <buffer> :%s/\s\+$//e

" https://github.com/ggreer/the_silver_searcher
Bundle 'rking/ag.vim'

Bundle 'Lokaltog/vim-powerline'
Bundle 'kien/ctrlp.vim'

Bundle 'tComment'
nnoremap // :TComment<CR>j
vnoremap // :TComment<CR>

Bundle 'scrooloose/nerdtree'
map <leader>n :NERDTreeToggle<cr>
map <leader>r :NERDTreeFind<cr>

" For NERDTree to be able to show hidden files.
let NERDTreeShowHidden=1

" Close NERDTree after a file has been opened.
let NERDTreeQuitOnOpen=1

Bundle 'matchit.zip'
runtime macros/matchit.vim

Bundle 'flazz/vim-colorschemes'
Bundle 'desert-warm-256'
colorscheme desert-warm-256

Bundle 'airblade/vim-gitgutter'

Bundle 'Valloric/YouCompleteMe'

Bundle 'godlygeek/tabular'
nmap <Leader>t= :Tabularize /=<CR>
vmap <Leader>t= :Tabularize /=<CR>
nmap <Leader>t: :Tabularize /:\zs<CR>
vmap <Leader>t: :Tabularize /:\zs<CR>
nmap <Leader>t, :Tabularize /,\zs<CR>
vmap <Leader>t, :Tabularize /,\zs<CR>
nmap <Leader>t> :Tabularize /=>\zs<CR>
vmap <Leader>t> :Tabularize /=>\zs<CR>
nmap <Leader>t- :Tabularize /-<CR>
vmap <Leader>t- :Tabularize /-<CR>
nmap <Leader>t" :Tabularize /"<CR>
vmap <Leader>t" :Tabularize /"<CR>

Bundle 'sjl/gundo.vim'
map <leader>u :GundoToggle<cr>

Bundle 'nginx.vim'

if has("gui_macvim")
  " Open ctrlp with cmd+p
  let g:ctrlp_map = '<D-p>'

  " Go to file
  nmap <D-t> :CtrlP<cr>

  " Move  with cmd+alt
  nmap <D-M-RIGHT> gt
  nmap <D-M-LEFT> gT

  " Comment lines with cmd+/
  map <D-/> :TComment<cr>j
  vmap <D-/> :TComment<cr>gv

  " Indent lines with cmd+[ and cmd+]
  nmap <D-]> >>
  nmap <D-[> <<
  vmap <D-[> <gv
  vmap <D-]> >gv

  "Open sidebar with cmd+k
  map <D-k> :NERDTreeToggle<CR>

  " Stop completion with enter, in addition to default ctrl+y
  " imap <expr> <CR> pumvisible() ? "\<c-y>" : "<Plug>delimitMateCR"

  map <D-u> :GundoToggle<cr>

endif

function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

:au FocusLost * :set number
:au FocusGained * :set relativenumber

autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber
