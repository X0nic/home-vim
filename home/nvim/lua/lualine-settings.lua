local lualine = require('lualine')
local icons = require("icons")

-- lunar vim
local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

-- local diagnostics = {
--   "diagnostics",
--   sources = { "nvim_diagnostic" },
--   sections = { "error", "warn" },
--   symbols = { error = " ", warn = " " },
--   colored = false,
--   always_visible = true,
-- }

local diagnostics = {
  {
    "diagnostics",
    symbols = {
      error = icons.diagnostics.Error,
      warn = icons.diagnostics.Warn,
      info = icons.diagnostics.Info,
      hint = icons.diagnostics.Hint,
    },
  },
  { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
  { "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
  -- stylua: ignore
  {
    function() return require("nvim-navic").get_location() end,
    cond = function() return package.loaded["nvim-navic"] and require("nvim-navic").is_available() end,
  },
  'g:metals_status',
}

local diff = {
  "diff",
  colored = false,
  symbols = { added = icons.git.LineAdded .. " ", modified = icons.git.LineModified .. " ", removed = icons.git.LineRemoved .. " " }, -- changes diff symbols
  cond = hide_in_width,
}

local filetype = {
  "filetype",
  icons_enabled = false,
}

local location = {
  "location",
  padding = 0,
}

local spaces = function()
  return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

lualine.setup {
  options = {
    globalstatus = true,
    icons_enabled = true,
    theme = "auto",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "alpha", "dashboard" },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = {"branch"},
    -- lualine_c = { diagnostics, 'g:metals_status' },
    lualine_c = diagnostics,
    lualine_x = { diff, spaces, "encoding", filetype },
    lualine_y = { location },
    lualine_z = { "progress" },
  },
}
