require("packer").startup(function(use)
    use({"wbthomason/packer.nvim"})

    -- lsp
    use("neovim/nvim-lspconfig")
    use { "williamboman/mason.nvim" }
    use { "williamboman/mason-lspconfig.nvim" }
    use { "jose-elias-alvarez/null-ls.nvim" } -- for formatters and linters
    use { "RRethy/vim-illuminate" }

    -- Fuzzy finding
    use({
      "nvim-telescope/telescope.nvim",
      requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
    })
    use { "junegunn/fzf", run = vim.fn['fzf#install()']  }


    -- Treesitter
    -- use "nvim-treesitter/nvim-treesitter", {'do': ':TSUpdate'}
    use({
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
    })
    use "nvim-treesitter/nvim-treesitter-textobjects"

    use "tpope/vim-fugitive"
    use "Lokaltog/vim-easymotion"
    -- use "rstacruz/sparkup", {'rtp': 'vim/'}
    use "tpope/vim-rails"
    use "tpope/vim-surround"
    use "tpope/vim-rake"
    use "tpope/vim-projectionist"
    use "ecomba/vim-ruby-refactoring"
    -- use "neoclide/coc.nvim", {'branch': 'release'}

    use "mbbill/undotree"
    use "preservim/vimux"
    use "morhetz/gruvbox"
    use "kchmck/vim-coffee-script"
    -- use "elixir-lang/vim-elixir"
    -- use "osyo-manga/vim-over"

    use "mustache/vim-mustache-handlebars"
    use "lambdatoast/elm.vim"
    use "rust-lang/rust.vim"
    use "slim-template/vim-slim"
    use "digitaltoad/vim-pug"
    use "ternjs/tern_for_vim"
    use "tomlion/vim-solidity"
    use "tomtom/tcomment_vim"
    use "scrooloose/nerdtree"
    use "christoomey/vim-tmux-navigator"
    use "mhinz/vim-signify"
    use "ryanoasis/vim-devicons"
    use "adelarsq/vim-devicons-emoji"
    use "vim-airline/vim-airline"
    use "jvirtanen/vim-hcl"

    -- Scala
    -- Plug 'nvim-lua/plenary.nvim'
    -- Plug 'scalameta/nvim-metals'

    -- use "desert-warm-256"
    -- use "croaky/vim-colors-github"
    use "godlygeek/tabular"
end)

-- Reload plugins file when saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
