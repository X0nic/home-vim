return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufReadPost",
    ---@type TSConfig
    opts = {
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
      -- context_commentstring = { enable = true, enable_autocmd = false },
      ensure_installed = {
        "bash",
        "vimdoc",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
    },
    ---@param opts TSConfig
    config = function(plugin, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
  { "nvim-treesitter/nvim-treesitter-textobjects" },
}
