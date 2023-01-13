return {
  -- lsp
  {
    'VonHeikemen/lsp-zero.nvim',
    dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},
      -- In order to load custom rubocop diagnostics, run these commands.
      -- https://github.com/williamboman/mason.nvim/issues/383
      -- https://github.com/williamboman/mason.nvim/issues/392
      -- GEM_PATH="/home/nate/.local/share/nvim/mason/packages/solargraph" GEM_HOME="/home/nate/.local/share/nvim/mason/packages/solargraph" gem install rubocop-rspec
      -- GEM_PATH="/home/nate/.local/share/nvim/mason/packages/solargraph" GEM_HOME="/home/nate/.local/share/nvim/mason/packages/solargraph" gem install rubocop-rails
      -- GEM_PATH="/home/nate/.local/share/nvim/mason/packages/solargraph" GEM_HOME="/home/nate/.local/share/nvim/mason/packages/solargraph" gem install activesupport -v 6.1.7

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    }
  },

  -- use { "williamboman/mason.nvim" }
  -- use { "williamboman/mason-lspconfig.nvim" }
  -- use("neovim/nvim-lspconfig")
  { "jose-elias-alvarez/null-ls.nvim", dependencies = { "nvim-lua/plenary.nvim" } }, -- for formatters and linters
  { "RRethy/vim-illuminate" },

  -- tree
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    }
  },

  -- Fuzzy finding
  {'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
  },
  { "junegunn/fzf", run = vim.fn['fzf#install()']  },
  {
    "nvim-telescope/telescope-frecency.nvim",
    config = function()
      require"telescope".load_extension("frecency")
    end,
    dependencies = {"kkharji/sqlite.lua"}
  },


  -- CoC
  -- use { "neoclide/coc.nvim", branch = 'release'}

  -- Treesitter
  -- use "nvim-treesitter/nvim-treesitter", {'do': ':TSUpdate'}
  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   build = ":TSUpdate",
  -- },
  -- { "nvim-treesitter/nvim-treesitter-textobjects" },


  -- -- Autocomplete
  -- use({
  --   "hrsh7th/nvim-cmp",
  --   requires = {
  --     "hrsh7th/cmp-cmdline", -- command line
  --     "hrsh7th/cmp-buffer", -- buffer completions
  --     "hrsh7th/cmp-nvim-lua", -- nvim config completions
  --     "hrsh7th/cmp-nvim-lsp", -- lsp completions
  --     "hrsh7th/cmp-path", -- file path completions
  --     "saadparwaiz1/cmp_luasnip", -- snippets completions
  --   },
  -- })
  --
  -- -- snippets
  -- use({
  --   "L3MON4D3/LuaSnip",
  --   requires = {
  --     "rafamadriz/friendly-snippets",
  --   },
  -- })
  --
  -- -- icons
  -- use("kyazdani42/nvim-web-devicons")
  --
  -- -- icons in completion
  -- use("onsails/lspkind-nvim")

  -- use { "akinsho/bufferline.nvim", requires = 'nvim-tree/nvim-web-devicons' }

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true }
  },
  {
    "SmiteshP/nvim-navic",
    opts = { separator = " ", highlight = true, depth_limit = 5 },
    dependencies = "neovim/nvim-lspconfig",
  },

  {
    "folke/trouble.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' }, -- optional, for file icons
    config = function()
      require("trouble").setup({})
    end,
  },

  -- git
  {
  'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  },

  { "tpope/vim-fugitive" },
  { "Lokaltog/vim-easymotion" },
  -- use "rstacruz/sparkup", {'rtp': 'vim/'}
  { "tpope/vim-rails" },
  { "tpope/vim-surround" },
  { "tpope/vim-rake" },
  { "tpope/vim-projectionist" },
  { "ecomba/vim-ruby-refactoring" },

  { "mbbill/undotree" },
  { "preservim/vimux" },
  { "morhetz/gruvbox" },
  { "kchmck/vim-coffee-script" },
  -- use "elixir-lang/vim-elixir"
  -- use "osyo-manga/vim-over"

  { "mustache/vim-mustache-handlebars" },
  { "lambdatoast/elm.vim" },
  { "rust-lang/rust.vim" },
  { "slim-template/vim-slim" },
  { "digitaltoad/vim-pug" },
  { "ternjs/tern_for_vim" },
  { "tomlion/vim-solidity" },
  { "tomtom/tcomment_vim" },
  { "christoomey/vim-tmux-navigator" },
  -- { "mhinz/vim-signify" },
  -- { "ryanoasis/vim-devicons" },
  -- { "adelarsq/vim-devicons-emoji" },
  { "jvirtanen/vim-hcl" },

  -- Scala
  {
    "scalameta/nvim-metals",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "mfussenegger/nvim-dap",
    },
  },

  -- use "desert-warm-256"
  -- use "croaky/vim-colors-github"
  { "godlygeek/tabular" },
}
