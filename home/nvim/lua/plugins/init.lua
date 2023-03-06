local icons = require("icons")

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
  -- {
  --   'nvim-tree/nvim-tree.lua',
  --   dependencies = {
  --     'nvim-tree/nvim-web-devicons', -- optional, for file icons
  --   }
  -- },

  -- Fuzzy finding
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = false, -- telescope did only one release, so use HEAD for now
    dependencies = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
    opts = {
      defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
      },
    },
  },
  {'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  { "junegunn/fzf", build = vim.fn['fzf#install()']  },
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

  -- better diagnostics list and others
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    dependencies = { 'nvim-tree/nvim-web-devicons' }, -- optional, for file icons
    opts = { use_diagnostic_signs = true },
    keys = {
      { "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
      { "<leader>xX", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
    },
  },

  -- git
  {
    'lewis6991/gitsigns.nvim',
    config = true,
    opts = {
      signs = {
        add = {
          hl = "GitSignsAdd",
          text = icons.ui.BoldLineLeft,
          numhl = "GitSignsAddNr",
          linehl = "GitSignsAddLn",
        },
        change = {
          hl = "GitSignsChange",
          text = icons.ui.BoldLineLeft,
          numhl = "GitSignsChangeNr",
          linehl = "GitSignsChangeLn",
        },
        delete = {
          hl = "GitSignsDelete",
          text = icons.ui.Triangle,
          numhl = "GitSignsDeleteNr",
          linehl = "GitSignsDeleteLn",
        },
        topdelete = {
          hl = "GitSignsDelete",
          text = icons.ui.Triangle,
          numhl = "GitSignsDeleteNr",
          linehl = "GitSignsDeleteLn",
        },
        changedelete = {
          hl = "GitSignsChange",
          text = icons.ui.BoldLineLeft,
          numhl = "GitSignsChangeNr",
          linehl = "GitSignsChangeLn",
        },
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then return ']c' end
          vim.schedule(function() gs.next_hunk() end)
          return '<Ignore>'
        end, {expr=true})

        map('n', '[c', function()
          if vim.wo.diff then return '[c' end
          vim.schedule(function() gs.prev_hunk() end)
          return '<Ignore>'
        end, {expr=true})

        -- Actions
        map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>', { desc = "Stage Hunk" })
        map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>')
        map('n', '<leader>hS', gs.stage_buffer)
        map('n', '<leader>hu', gs.undo_stage_hunk)
        map('n', '<leader>hR', gs.reset_buffer)
        map('n', '<leader>hp', gs.preview_hunk)
        map('n', '<leader>hb', function() gs.blame_line{full=true} end)
        map('n', '<leader>tb', gs.toggle_current_line_blame)
        map('n', '<leader>hd', gs.diffthis)
        map('n', '<leader>hD', function() gs.diffthis('~') end)
        map('n', '<leader>td', gs.toggle_deleted)

        -- Text object
        map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
      end
    },
  },

  -- which-key
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      plugins = { spelling = true },
      key_labels = { ["<leader>"] = "SPC" },
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      wk.register({
        mode = { "n", "v" },
        ["g"] = { name = "+goto" },
        ["]"] = { name = "+next" },
        ["["] = { name = "+prev" },
        ["<leader><tab>"] = { name = "+tabs" },
        ["<leader>b"] = { name = "+buffer" },
        ["<leader>c"] = { name = "+code" },
        ["<leader>f"] = { name = "+file/find" },
        ["<leader>g"] = { name = "+git" },
        ["<leader>gh"] = { name = "+hunks" },
        ["<leader>q"] = { name = "+quit/session" },
        ["<leader>s"] = { name = "+test" },
        ["<leader>sn"] = { name = "+noice" },
        ["<leader>u"] = { name = "+ui" },
        ["<leader>w"] = { name = "+windows" },
        ["<leader>x"] = { name = "+diagnostics/quickfix" },
      })
    end,
  },
  -- session management
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = { options = { "buffers", "curdir", "tabpages", "winsize", "help" } },
    -- stylua: ignore
    keys = {
      { "<leader>qs", function() require("persistence").load() end, desc = "Restore Session" },
      { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
      { "<leader>qd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
    },
  },

  { "tpope/vim-fugitive" },
  -- { "Lokaltog/vim-easymotion" },
  -- use "rstacruz/sparkup", {'rtp': 'vim/'}

  { "tpope/vim-surround" },
  { "tpope/vim-rails",
    dependencies = {"tpope/vim-projectionist"}
  },
  { "tpope/vim-rake",
    dependencies = {"tpope/vim-projectionist"}
  },

  { "mbbill/undotree" },
  { "preservim/vimux" },
  { "morhetz/gruvbox" },
  -- use "osyo-manga/vim-over"

  { "slim-template/vim-slim" },
  { "digitaltoad/vim-pug" },
  { "ternjs/tern_for_vim" },
  { "christoomey/vim-tmux-navigator" },
  -- { "mhinz/vim-signify" },
  -- { "ryanoasis/vim-devicons" },
  -- { "adelarsq/vim-devicons-emoji" },

  -- use "desert-warm-256"
  -- use "croaky/vim-colors-github"
  { "godlygeek/tabular" },
}
