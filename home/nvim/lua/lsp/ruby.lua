require'lspconfig'.solargraph.setup{
  flags = {
    debounce_text_changes = 150,
  },
  settings = {
    solargraph = {
      diagnostics = false,
    },
  }
}
-- require'lspconfig'.ruby_ls.setup{}
