function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

" Yank current file
" https://github.com/benzittlau/vim-castle/blob/master/home/.vim/autoload/file_yank.vim
function! GetCurrentFileAndLine()
  " A regex for all files that you might want to test from
  let file = @%
  let @* = file . ":" . line(".")
endfunction
