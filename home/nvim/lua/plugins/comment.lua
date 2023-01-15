return {
  -- Comment
  -- { "tomtom/tcomment_vim" },
  {
    "terrortylor/nvim-comment",
    config = function ()
      require("nvim_comment").setup({
        hook = function()
          require("ts_context_commentstring.internal").update_commentstring()
        end,
      })
    end,
    dependencies = { 'JoosepAlviste/nvim-ts-context-commentstring' }
  },
}
