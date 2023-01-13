return {

  -- nightfox
  {
    "EdenEast/nightfox.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
  },

  -- tokyonight
  {
    "folke/tokyonight.nvim",
    opts = { style = "night" },
  },

  -- catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
  },
-- " Bundle 'croaky/vim-colors-github'
}
