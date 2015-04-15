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
