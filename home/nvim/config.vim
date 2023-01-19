set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs

let mapleader = " "
let maplocalleader = " "
" nnoremap , <space>
" nnoremap , <leader>

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.
set cmdheight=2                   " Give more space for displaying messages.

syntax enable
set autoread                      " Automatically reload changes if detected

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

" set wildmenu                      " Enhanced command line completion.
" set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.
set cursorline                    " Highlight current line

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set nowrap                        " Turn off line wrapping.
set scrolloff=10                  " Show 10 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

" Mouse in terminal
set mouse=a
if has('mouse_sgr')
  set ttymouse=sgr
endif

" -----------------------------
" Backups, Tmp Files, and Undo
" -----------------------------
set nobackup
set nowritebackup
set backupdir=~/.config/nvim/.backup
set directory=~/.config/nvim/.tmp

" Persistent Undo
set undofile
set undodir=~/.config/nvim/.undo

set tabstop=2                    " Global tab width.
set shiftwidth=2                 " And again, related.
set expandtab                    " Use spaces instead of tabs
set textwidth=120
set numberwidth=5                " wider gutter

" Display extra whitespace
set list listchars=tab:»·,trail:·

" More natural split opening
set splitbelow
set splitright
