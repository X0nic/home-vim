local lsp_zero = require("lsp-zero")
local icons = require("icons")

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({ buffer = bufnr })
  -- lsp_zero.default_keymaps({
  --   buffer = bufnr,
  --   preserve_mappings = false
  -- })
  vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", { buffer = bufnr })
  --
  -- vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  -- vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  -- vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  -- vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  -- vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  -- vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  -- vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  -- vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  -- vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  -- vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp_zero.set_sign_icons({
  error = icons.diagnostics.Error,
  warn = icons.diagnostics.Warn,
  hint = icons.diagnostics.Hint,
  info = icons.diagnostics.Info,
})

vim.diagnostic.config({
  virtual_text = {
    -- source = "if_many",
    source = "always",
    -- prefix = " ", -- Could be '●', '▎', 'x'
    prefix = "●",
    "▎",
    "x",
    -- prefix = icons.diagnostics.Warn
  },
  float = {
    source = "always",
  },
  severity_sort = true,
})

-- to learn how to use mason.nvim with lsp-zero
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
require("mason").setup({})
require("mason-lspconfig").setup({
  -- ensure_installed = {'tsserver', 'rust_analyzer', 'ruby_ls'},
  ensure_installed = { "tsserver", "rust_analyzer", "solargraph" },
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
      require("lspconfig").lua_ls.setup({
        single_file_support = false,
        on_attach = function(client, bufnr)
          print("lua server loaded")
        end,
      })
    end,
    tsserver = function()
      require("lspconfig").tsserver.setup({
        single_file_support = false,
        on_attach = function(client, bufnr)
          print("tsserver loaded")
        end,
      })
    end,
    -- ruby_ls = function()
    --   require('lspconfig').ruby_ls.setup({
    --     single_file_support = false,
    --     on_attach = function(client, bufnr)
    --       print('ruby_ls loaded')
    --     end
    --   })
    -- end,
  },
})

-- require('lspconfig').lua_ls.setup({
--   single_file_support = false,
--   on_attach = function(client, bufnr)
--     print('hello lua server')
--   end
-- })

-- require('lspconfig').tsserver.setup({
--   single_file_support = false,
--   on_attach = function(client, bufnr)
--     print('hello tsserver')
--   end
-- })

-- require('mason-lspconfig').setup({
--   handlers = {
--     lsp_zero.default_setup,
--     lua_ls = function()
--       require('lspconfig').lua_ls.setup({
--         single_file_support = false,
--         on_attach = function(client, bufnr)
--           print('hello lua 2 server')
--         end
--       })
--     end,
--   }
-- })

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }

-- this is the function that loads the extra snippets to luasnip
-- from rafamadriz/friendly-snippets
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
  sources = {
    -- { name = "copilot" },
    -- { name = "supermaven" },
    { name = "path" },
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "luasnip", keyword_length = 2 },
    { name = "buffer",  keyword_length = 3 },
  },
  formatting = lsp_zero.cmp_format(),
  mapping = cmp.mapping.preset.insert({
    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm({
      -- documentation says this is important.
      -- I don't know why.
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    }),
  }),
})

-- local lsp = require('lsp-zero')
-- lsp.preset('recommended')
--
-- lsp.configure('solargraph', {
--   settings = {
--     solargraph = {
--       diagnostics = false,
--     },
--   },
--   init_options = {
--     formatting = false
--   }
-- })
--
-- lsp.configure('lua_ls', {
--   settings = {
--     Lua = {
--       diagnostics = {
--         globals = { 'vim' }
--       },
--     },
--   },
-- })
--
-- lsp.configure("yamlls", {
--   settings = {
--     yaml = {
--       keyOrdering = false
--     }
--   }
-- })
--
-- local navic = require("nvim-navic")
-- lsp.on_attach(function(client, bufnr)
--   if client.server_capabilities.documentSymbolProvider then
--     navic.attach(client, bufnr)
--   end
-- end)
--
-- lsp.setup()
--
-- vim.diagnostic.config({
--   virtual_text = true,
--   signs = true,
--   update_in_insert = false,
--   underline = true,
--   severity_sort = false,
--   float = true,
-- })

-- local cmp = require('cmp')
-- local cmp_action = lsp.cmp_action()
--
-- cmp.setup({
--   sources = {
--     {name = 'copilot'},
--     {name = 'nvim_lsp'},
--   },
--   mapping = cmp.mapping.preset.insert({
--     ['<CR>'] = cmp.mapping.confirm({
--       -- documentation says this is important.
--       -- I don't know why.
--       behavior = cmp.ConfirmBehavior.Replace,
--       select = false,
--     })
--   })
-- })

-- require("lsp.ruby")
require("lsp.null-ls")
require("lsp.metals")

-- require "lsp.mason"
--
-- -- require all language server modules
-- require("lsp.ruby")
-- require("lsp.typescript")
-- require("lsp.eslint")
-- -- require("lsp.vue")
-- -- require("lsp.css")
-- -- require("lsp.html")
-- -- require("lsp.luals")
-- -- require("lsp.python")
-- -- require("lsp.json")
-- -- require("lsp.tailwind")
-- -- require("lsp.yaml")
-- -- require("lsp.prisma")
-- -- require("lsp.emmet")
-- -- require("lsp.gql")
-- -- require("lsp.rust")
-- -- require("lsp.go")
-- -- require("lsp.deno")
-- -- require("lsp.astro")
--
-- require "lsp.null-ls"
--
-- -- Customization and appearance -----------------------------------------
-- -- change gutter diagnostic symbols
-- local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
--
-- for type, icon in pairs(signs) do
--   local hl = "DiagnosticSign" .. type
--   vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
-- end
-- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
--   border = "rounded",
-- })
--
-- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
--   border = "rounded",
-- })

-- -- Mappings.
-- -- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- local opts = { noremap=true, silent=true }
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
--
-- -- Use an on_attach function to only map the following keys
-- -- after the language server attaches to the current buffer
-- local on_attach = function(client, bufnr)
--   -- Enable completion triggered by <c-x><c-o>
--   vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
--
--   -- Mappings.
--   -- See `:help vim.lsp.*` for documentation on any of the below functions
--   local bufopts = { noremap=true, silent=true, buffer=bufnr }
--   vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
--   vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
--   vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
--   vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
--   vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
--   vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
--   vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
--   vim.keymap.set('n', '<space>wl', function()
--     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--   end, bufopts)
--   vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
--   vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
--   vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
--   vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
--   vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
-- end
