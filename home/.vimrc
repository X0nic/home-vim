set nocompatible               " be iMproved
filetype off                   " required!

set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs

let mapleader = ","

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
Bundle 'tpope/vim-surround.git'
Bundle 'ecomba/vim-ruby-refactoring'
Bundle 'ack.vim'
Bundle 'SirVer/ultisnips'
Bundle 'kchmck/vim-coffee-script'

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

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif
nmap <leader>v :edit $MYVIMRC<CR>

" Mouse in terminal
set mouse=a

" -----------------------------
" Backups, Tmp Files, and Undo
" -----------------------------
set nobackup
set backupdir=~/.vim/.backup
set directory=~/.vim/.tmp
" Persistent Undo
set undofile
set undodir=~/.vim/.undo

" UNCOMMENT TO USE
set tabstop=2                    " Global tab width.
set shiftwidth=2                 " And again, related.
set expandtab                    " Use spaces instead of tabs

" Display extra whitespace
set list listchars=tab:»·,trail:·

" We don't need no stinking whitespace
autocmd FileType coffee,css,cucumber,haml,ruby,sass,yaml,thor autocmd BufWritePre <buffer> :%s/\s\+$//e

" http://robots.thoughtbot.com/post/48275867281/vim-splits-move-faster-and-more-naturally
" Easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" More natural split opening
set splitbelow
set splitright

"Max out the height of the current split
" ctrl + w _

"Max out the width of the current split
" ctrl + w |

"Normalize all split sizes, which is very handy when resizing terminal
" ctrl + w =

inoremap jj <ESC>

map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>

command! Q q " Bind :Q to :q
command! Qall qall 

" Disable Ex mode
map Q <Nop>

" Disable K looking stuff up
map K <Nop>

" https://github.com/ggreer/the_silver_searcher
Bundle 'rking/ag.vim'

Bundle 'Lokaltog/vim-powerline'
Bundle 'kien/ctrlp.vim'
nmap <C-p> :CtrlP<cr>

" Bundle 'Shougo/vimproc.vim'
" Bundle 'unite.vim'

Bundle 'tComment'
nnoremap // :TComment<CR>j
vnoremap // :TComment<CR>

Bundle 'scrooloose/nerdtree'
map <leader>n :NERDTreeToggle<cr>
map <leader>r :NERDTreeFind<cr>

" For NERDTree to be able to show hidden files.
let NERDTreeShowHidden=1

" Close NERDTree after a file has been opened.
" let NERDTreeQuitOnOpen=1

Bundle 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ruby_checkers = ['mri', 'rubocop']
" let g:syntastic_aggregate_errors = 1

Bundle 'matchit.zip'
runtime macros/matchit.vim

Bundle 'desert-warm-256'
Bundle 'croaky/vim-colors-github'
colorscheme desert-warm-256
" colorscheme github

Bundle 'airblade/vim-gitgutter'

Bundle 'Valloric/YouCompleteMe'
let g:EclimCompletionMethod = 'omnifunc'

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

Bundle 'rails.vim'

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

" Bundle 'mhinz/vim-startify'
" " ---------------
" " vim-startify
" " ---------------
" let g:startify_bookmarks = [ '~/.vim/vimrc',
"                             \'~/homefiles/zshrc',
"                             \'~/homefiles/gitconfig',
"                             \'~/homefiles/gemrc']
" let g:startify_show_files_number=20

" Cursor settings. This makes terminal vim sooo much nicer!
" Tmux will only forward escape sequences to the terminal if surrounded by a DCS
" sequence
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Unite
" let g:unite_source_history_yank_enable = 1
" call unite#filters#matcher_default#use(['matcher_fuzzy'])
" " nmap <C-p> :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
" nnoremap <leader>t :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
" nnoremap <leader>t :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
" nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
" nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
" nnoremap <leader>o :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
" nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
" nnoremap <leader>e :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>


" Custom mappings for the unite buffer
" autocmd FileType unite call s:unite_settings()
" function! s:unite_settings()
"   " Play nice with supertab
"   let b:SuperTabDisabled=1
"   " Enable navigation with control-j and control-k in insert mode
"   imap <buffer> <C-j>   <Plug>(unite_select_next_line)
"   imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
" endfunction

" ---------------
" UltiSnips
" ---------------
let g:UltiSnipsSnippetDirectories=["MyUltiSnips"]
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" Replace insert pry breakpoint in insert mode
imap !!p require 'pry' ; binding.pry

" Yank current file
" https://github.com/benzittlau/vim-castle/blob/master/home/.vim/autoload/file_yank.vim
function! GetCurrentFileAndLine()
  " A regex for all files that you might want to test from
  let file = @%
  let @* = file . ":" . line(".")
endfunction

command! YankCurrentFileAndLine call GetCurrentFileAndLine()
silent! nmap <silent> <Leader>y :YankCurrentFileAndLine<CR>
