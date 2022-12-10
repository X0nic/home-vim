source ~/.config/nvim/vundle.vim

"let g:Powerline_symbols = 'fancy'

" My Bundles here:
"
" original repos on github
" if !has('nvim')
"   Bundle 'SirVer/ultisnips'
" endif

call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'Lokaltog/vim-easymotion'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-projectionist'
Plug 'ecomba/vim-ruby-refactoring'
" Plug 'ack.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug  'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
" Plug 'sjl/gundo.vim'
" Plug 'simnalamburt/vim-mundo'
Plug 'mbbill/undotree'
Plug 'preservim/vimux'
Plug 'morhetz/gruvbox'
Plug 'kchmck/vim-coffee-script'
Plug 'elixir-lang/vim-elixir'
Plug 'osyo-manga/vim-over'

Plug 'mustache/vim-mustache-handlebars'
Plug 'lambdatoast/elm.vim'
Plug 'rust-lang/rust.vim'
Plug 'slim-template/vim-slim'
Plug 'digitaltoad/vim-pug'
Plug 'ternjs/tern_for_vim'
" Plugin  '/usr/local/opt/fzf'
Plug 'tomlion/vim-solidity'
Plug 'tomtom/tcomment_vim'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mhinz/vim-signify'
" Plug 'nvim-lua/lsp-status.nvim'
" Plug 'datwaft/bubbly.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'adelarsq/vim-devicons-emoji'
" Plug 'adelarsq/neoline.vim'
Plug 'vim-airline/vim-airline'
call plug#end()

let g:rustfmt_autosave = 1
let g:python3_host_prog = '~/.asdf/shims/python'

" vim-scripts repos
" Bundle 'L9'
"Bundle 'FuzzyFinder'
" non github repos
"Bundle 'git://git.wincent.com/command-t.git'
" ...


" Automatically detect file types. (must turn on after Vundle)
filetype plugin indent on

" Do the platform specific stuff
source ~/.config/nvim/platforms.vim

" Configure basic vim settings, no key mappings
source ~/.config/nvim/config.vim

" Set the vim theme
source ~/.config/nvim/theme.vim

" Here be the functions
source ~/.config/nvim/functions.vim

let g:coc_global_extensions = ['coc-json', 'coc-tsserver', 'coc-git', 'coc-css', 'coc-solargraph', 'coc-lightbulb', 'coc-html', 'coc-eslint', 'coc-stylelint', 'coc-tslint', 'coc-prettier']
source ~/.config/nvim/coc.vim

" Enable linux clipboard
" https://waylonwalker.com/til/ubuntu-terminal-clipboard/
set clipboard+=unnamedplus

" automatically rebalance windows on vim resize
" autocmd VimResized * :wincmd =
"
" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

" Source the vimrc file after saving it
" if has("autocmd")
"   autocmd bufwritepost .vimrc source $MYVIMRC
" endif
nmap <leader>v :edit $MYVIMRC<CR>

" We don't need no stinking whitespace
autocmd FileType coffee,css,cucumber,haml,ruby,sass,yaml,thor autocmd BufWritePre <buffer> :%s/\s\+$//e

" http://robots.thoughtbot.com/post/48275867281/vim-splits-move-faster-and-more-naturally
" Easier split navigation with tmux support
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-J> :TmuxNavigateDown<cr>
nnoremap <silent> <C-K> :TmuxNavigateUp<cr>
nnoremap <silent> <C-L> :TmuxNavigateRight<cr>
nnoremap <silent> <C-H> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-\> :TmuxNavigatePrevious<cr>

"Max out the height of the current split
" ctrl + w _

"Max out the width of the current split
" ctrl + w |

"Normalize all split sizes, which is very handy when resizing terminal
" ctrl + w =

let g:mustache_abbreviations = 1

inoremap jj <ESC>

map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>

command! Q q " Bind :Q to :q
command! Qall qall 

" Disable Ex mode
map Q <Nop>

" Disable K looking stuff up
" map K <Nop>

" https://github.com/ggreer/the_silver_searcher
" Bundle 'rking/ag.vim'

" Bundle 'Lokaltog/vim-powerline'
" Bundle 'kien/ctrlp.vim'
" nmap <C-p> :CtrlP<cr>

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects
  " .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Bundle 'Shougo/vimproc.vim'
" Bundle 'unite.vim'

nnoremap // :TComment<CR>j
vnoremap // :TComment<CR>

map <leader>n :NERDTreeToggle<cr>
map <leader>r :NERDTreeFind<cr>

" For NERDTree to be able to show hidden files.
let NERDTreeShowHidden=1

" Close NERDTree after a file has been opened.
" let NERDTreeQuitOnOpen=1

" Bundle 'scrooloose/syntastic'
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
"
" let g:syntastic_always_populate_loc_list = 1
" " let g:syntastic_auto_loc_list = 1
" let g:syntastic_auto_loc_list = 0
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_ruby_checkers = ['mri', 'rubocop']
" let g:syntastic_javascript_checkers = ['eslint']
" " let g:syntastic_aggregate_errors = 1

" autocmd bufwritepost *.js silent !standard --fix %
" set autoread

" Bundle 'matchit.zip'
" runtime macros/matchit.vim
" 
" 
" " Bundle 'airblade/vim-gitgutter'
" 
" if !has('nvim')
"   Bundle 'Valloric/YouCompleteMe'
"   " let g:EclimCompletionMethod = 'omnifunc'
" endif

Bundle 'godlygeek/tabular'
nmap <Leader>t= :Tabularize /=<CR>
vmap <Leader>t= :Tabularize /=<CR>
nmap <Leader>t: :Tabularize /:\zs<CR>
vmap <Leader>t: :Tabularize /:\zs<CR>
nmap <Leader>t, :Tabularize /,\zs<CR>
vmap <Leader>t, :Tabularize /,\zs<CR>
nmap <Leader>t> :Tabularize /=><CR>
vmap <Leader>t> :Tabularize /=><CR>
nmap <Leader>t- :Tabularize /-<CR>
vmap <Leader>t- :Tabularize /-<CR>
nmap <Leader>t" :Tabularize /"<CR>
vmap <Leader>t" :Tabularize /"<CR>

" map <leader>u :MundoToggle<cr>
map <leader>u :UndotreeToggle<cr>

" Bundle 'nginx.vim'

" Bundle 'rails.vim'


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
imap !!P require 'pry' ; binding.pry

command! YankCurrentFileAndLine call GetCurrentFileAndLine()
silent! nmap <silent> <Leader>y :YankCurrentFileAndLine<CR>

command! VimuxTestLine call vimux#TestCurrentLine()
silent! nmap <silent> <Leader>sz :VimuxTestLine <CR>

command! RunLastCommand call vimux#RunLastCommand()
silent! nmap <silent> <Leader>sl :RunLastCommand<CR>

command! TestFullFile call vimux#TestFullFile()
silent! nmap <silent> <Leader>sf :TestFullFile<CR>

command! RubocopCurrentFile call vimux#RubocopCurrentFile()
silent! nmap <silent> <Leader>sr :RubocopCurrentFile<CR>

command! StopSpring call vimux#StopSpring()
silent! nmap <silent> <Leader>ss :StopSpring<CR>

" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Selecta Mappings
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Run a given vim command on the results of fuzzy selecting from a given shell
" " command. See usage below.
" function! SelectaCommand(choice_command, selecta_args, vim_command)
"   try
"     let selection = system(a:choice_command . " | selecta " . a:selecta_args)
"   catch /Vim:Interrupt/
"     " Swallow the ^C so that the redraw below happens; otherwise there will be
"     " leftovers from selecta on the screen
"     redraw!
"     return
"   endtry
"   redraw!
"   exec a:vim_command . " " . selection
" endfunction
"
" function! SelectaFile(path)
"   " call SelectaCommand("find " . a:path . "/* -type f", "", ":e")
"   " call SelectaCommand("find " . a:path . "/* -type f -not -path './node_modules/*'", "", ":e")
"   call SelectaCommand("ag -l --nocolor " . a:path , "", ":e")
" endfunction
"
" nmap <C-p> :call SelectaFile(".")<cr>
" nnoremap <leader>f :call SelectaFile(".")<cr>
" nnoremap <leader>gv :call SelectaFile("app/views")<cr>
" nnoremap <leader>gc :call SelectaFile("app/controllers")<cr>
" nnoremap <leader>gm :call SelectaFile("app/models")<cr>
" nnoremap <leader>gh :call SelectaFile("app/helpers")<cr>
" nnoremap <leader>gl :call SelectaFile("lib")<cr>
" nnoremap <leader>gp :call SelectaFile("public")<cr>
" nnoremap <leader>gs :call SelectaFile("public/stylesheets")<cr>
" nnoremap <leader>gf :call SelectaFile("features")<cr>
"
" "Fuzzy select
" function! SelectaIdentifier()
"   " Yank the word under the cursor into the z register
"   normal "zyiw
"   " Fuzzy match files in the current directory, starting with the word under
"   " the cursor
"   call SelectaCommand("find * -type f", "-s " . @z, ":e")
" endfunction
" nnoremap <c-g> :call SelectaIdentifier()<cr>


" quicker tab jumping
map <leader>1 1gt
map <leader>2 2gt
map <leader>3 3gt
map <leader>4 4gt
map <leader>5 5gt
map <leader>6 6gt
map <leader>7 7gt
map <leader>8 8gt
map <leader>9 9gt
map <leader>0 :tablast<CR>

" Quick new tab
map <leader>tn :tabe %<cr>

" Insert a hash rocket with <c-l>
imap <c-l> <space>=><space>

nnoremap <Leader>vfr :call VisualFindAndReplace()<CR>
xnoremap <Leader>vfr :call VisualFindAndReplaceWithSelection()<CR>

function! VisualFindAndReplace()
    :OverCommandLine%s/
    :w
endfunction
function! VisualFindAndReplaceWithSelection() range
    :'<,'>OverCommandLine s/
    :w
endfunction

let g:tern_show_argument_hints='on_hold'
let g:tern_map_keys=1
let g:tern_map_prefix = '<leader>'

set rtp+=/usr/local/opt/fzf
" let $FZF_DEFAULT_COMMAND  'ag %s -l --nocolor -g \"\"'
nnoremap <C-p> :FZF<Cr>

lua <<EOF
require("treesitter")
EOF
