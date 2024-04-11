-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
--require("treesitter-config")

-- Load Lualine
-- https://github.com/nvim-lualine/lualine.nvim
require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = "catppuccin",
    section_separators = { left = "", right = "" },
    component_separators = { left = "", right = "" },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff", "diagnostics" },
    lualine_c = { "filename" },
    lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {},
})

-- Show Neotree on VimEnter (Startup)
-- vim.api.nvim_create_autocmd("VimEnter", {
--   callback = function()
--     vim.cmd("Neotree show")
--   end,
-- })

-- Enable spell-checking
vim.opt.spell = true

-- Enable persistent undo feature
vim.opt.undofile = true

vim.opt.swapfile = false

-- Absolute linenumbers
vim.opt.relativenumber = false

-- Minimal number of screen lines to keep above and below the cursor
vim.opt.scrolloff = 10

vim.opt.encoding = "utf-8"
-- vim.opt.fileencoding = "utf-8"

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.showcmd = true
vim.opt.showcmd = true
vim.opt.shiftwidth = 3
vim.opt.tabstop = 3

vim.opt.backspace = { "start", "eol", "indent" }

vim.opt.path:append({ "**" })
vim.opt.wildignore:append({ "*/node_modules/*" })

-- Where to split the window
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.splitkeep = "cursor"
