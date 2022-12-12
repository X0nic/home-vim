lua << EOF
require "plugins"
EOF

let g:rustfmt_autosave = 1
let g:python3_host_prog = '~/.asdf/shims/python'


" Automatically detect file types. (must turn on after Vundle)
filetype plugin indent on

" Configure basic vim settings, no key mappings
source ~/.config/nvim/config.vim

" Set the vim theme
source ~/.config/nvim/theme.vim

" Here be the functions
source ~/.config/nvim/functions.vim

let g:coc_global_extensions = ['coc-json', 'coc-tsserver', 'coc-git', 'coc-css', 'coc-solargraph', 'coc-lightbulb', 'coc-html', 'coc-eslint', 'coc-stylelint', 'coc-tslint', 'coc-prettier', 'coc-metals']
source ~/.config/nvim/coc.vim

" Enable linux clipboard
" https://waylonwalker.com/til/ubuntu-terminal-clipboard/
set clipboard+=unnamedplus

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

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

let g:mustache_abbreviations = 1

inoremap jj <ESC>

map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>

command! Q q " Bind :Q to :q
command! Qall qall 

" Disable Ex mode
map Q <Nop>

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

nnoremap // :TComment<CR>j
vnoremap // :TComment<CR>

map <leader>n :NERDTreeToggle<cr>
map <leader>r :NERDTreeFind<cr>

" For NERDTree to be able to show hidden files.
let NERDTreeShowHidden=1

" Bundle 'godlygeek/tabular'
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

nnoremap <C-n> :call NumberToggle()<cr>

:au FocusLost * :set number
:au FocusGained * :set relativenumber

autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

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
