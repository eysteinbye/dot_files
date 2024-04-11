-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
--
-- Inspiration
-- https://github.com/vim/vim/blob/master/runtime/macmap.vim
-- https://github.com/vim/vim/blob/master/runtime/mswin.vim
--
--
-- Cmd keys are mapped in Alacritty to Ctrl keys

-- Function to create mappings easily
local map = function(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- DELETE SELECTION
-- This did not work with <BR> so I used Ctrl+H instead since both are the same
-- I then mapped <BR> to <C-h> in Alacritty
-- What is "intercepting" the <BR> key I do not know!
-- Backspace will delete selected text without copying it to the clipboard
vim.api.nvim_set_keymap("v", "<C-h>", '"_c', { noremap = true })
vim.api.nvim_set_keymap("v", "<BR>", '"_c', { noremap = true })

-- Cycle through buffers
map("n", "<C-S-Tab>", ":BufferLineCyclePrev<CR>")
map("n", "<S-Tab>", ":BufferLineCycleNext<CR>")
map("i", "<S-Tab>", "<Esc>:BufferLineCycleNext<CR>")
map("i", "<C-S-Tab>", "<Esc>:BufferLineCyclePrev<CR>")
map("v", "<S-Tab>", "<Esc>:BufferLineCycleNext<CR>")
map("v", "<C-S-Tab>", "<Esc>:BufferLineCyclePrev<CR>")
map("c", "<S-Tab>", "<C-C>:BufferLineCycleNext<CR>")
map("c", "<C-S-Tab>", "<C-C>:BufferLineCyclePrev<CR>")
map("o", "<S-Tab>", "<Esc>:BufferLineCycleNext<CR>")
map("o", "<C-S-Tab>", "<Esc>:BufferLineCyclePrev<CR>")

-- Move line up or down
-- map("n", "<A-Up>", "ddkP")
-- map("n", "<A-Down>", "ddp")
-- map("i", "<A-Down>", "<Esc>ddpi")
-- map("i", "<A-Up>", "<Esc>ddkPi")
-- map("v", "<A-Down>", "<Esc>ddp")
-- map("v", "<A-Up>", "<Esc>ddkP")
--
-- SHIFT-ARROW to select text
-- Normal mode mappings
map("n", "<S-Up>", "v<Up>")
-- Move the crsor left after the selection to not select the character under the cursor
map("n", "<S-Down>", "v<Down>h")
map("n", "<S-Left>", "v<Left>")
map("n", "<S-Right>", "v<Right>")
--  Visual mode mappings
map("v", "<S-Up>", "<Up>")
map("v", "<S-Down>", "<Down>")
map("v", "<S-Left>", "<Left>")
map("v", "<S-Right>", "<Right>")
-- Insert mode mappings
-- Move up before entering visual mode to not select the character under the cursor
map("i", "<S-Up>", "<Esc>vkl")
-- Move right before entering visual mode to not select the character under the cursor
map("i", "<S-Down>", "<Esc>lv<Down>h")
-- Since Esc will move the cursor left, and l will move it right
-- This selects the character to the left of the cursor
map("i", "<S-Left>", "<Esc>vl<Left>")
-- Esc will move back, so l will move right
-- Then virtual mode will move it left, so h will move it right
-- This will simulate what other Mac and Windows editors do
-- This selects the character to the right of the cursor
map("i", "<S-Right>", "<Esc>lvh<Right>")

-- Remove selection with arrow keys without Shift
map("v", "<Left>", "<Esc><Left>")
map("v", "<Right>", "<Esc><Right>")
map("v", "<Up>", "<Esc><Up>")
map("v", "<Down>", "<Esc><Down>")

-- SELECT ALL
-- map Ctrl+A to select all in all modes
map("n", "<C-a>", "ggVG")
map("v", "<C-a>", "<Esc>ggVG")
map("i", "<C-a>", "<Esc>ggVG")
map("c", "<C-a>", "<C-C>ggVG")
map("o", "<C-a>", "<Esc>ggVG")

-- SAVE
-- Cmd+S is mapped to Ctrl+S in Alacritty
vim.keymap.set("n", "<C-s>", ":update<CR>")
vim.api.nvim_set_keymap("v", "<C-s>", "<Esc><C-s>", { silent = true })
vim.api.nvim_set_keymap("i", "<C-s>", "<Esc><C-s>", { silent = true })
vim.api.nvim_set_keymap("c", "<C-s>", "<C-C><C-s>", { silent = true })
vim.api.nvim_set_keymap("o", "<C-s>", "<Esc><C-s>", { silent = true })

-- COPY
-- Cmd+C is mapped to Ctrl+C in Alacritty
-- Copy (Only needed in visual mode)
vim.api.nvim_set_keymap("v", "<C-c>", '"+y', { silent = true })

-- LazyGit
-- Cmd+G is mapped to Ctrl+G in Alacritty
-- Map Ctrl+G to LazyGit in all modes
vim.api.nvim_set_keymap("n", "<C-g>", ":LazyGit<CR>", { noremap = true })
vim.api.nvim_set_keymap("v", "<C-g>", "<Esc>:LazyGit<CR>", { noremap = true })
vim.api.nvim_set_keymap("i", "<C-g>", "<Esc>:LazyGit<CR>", { noremap = true })
vim.api.nvim_set_keymap("c", "<C-g>", "<C-C>:LazyGit<CR>", { noremap = true })
vim.api.nvim_set_keymap("o", "<C-g>", "<Esc>:LazyGit<CR>", { noremap = true })

-- FIND FILES
-- Cmd+P is mapped to Ctrl+P in Alacritty
-- Map Ctrl+P to Telescope in all modes
vim.api.nvim_set_keymap("n", "<C-p>", ":Telescope find_files<CR>", { noremap = true })
vim.api.nvim_set_keymap("v", "<C-p>", "<Esc>:Telescope find_files<CR>", { noremap = true })
vim.api.nvim_set_keymap("i", "<C-p>", "<Esc>:Telescope find_files<CR>", { noremap = true })
vim.api.nvim_set_keymap("c", "<C-p>", "<C-C>:Telescope find_files<CR>", { noremap = true })
vim.api.nvim_set_keymap("o", "<C-p>", "<Esc>:Telescope find_files<CR>", { noremap = true })

-- LAZY
-- Shift+Cmd+P is mapped to Ctrl+K in Alacritty
vim.api.nvim_set_keymap("n", "<C-k>", ":Lazy<CR>", { noremap = true })
vim.api.nvim_set_keymap("v", "<C-k>", "<Esc>:Lazy<CR>", { noremap = true })
vim.api.nvim_set_keymap("i", "<C-k>", "<Esc>:Lazy<CR>", { noremap = true })
vim.api.nvim_set_keymap("c", "<C-k>", "<C-C>:Lazy<CR>", { noremap = true })
vim.api.nvim_set_keymap("o", "<C-k>", "<Esc>:Lazy<CR>", { noremap = true })

-- FIND IN CURRENT FILE
-- Cmd+F is mapped to Ctrl+F in Alacritty
vim.api.nvim_set_keymap("n", "<C-f>", ":Telescope current_buffer_fuzzy_find<CR>", { noremap = true })
vim.api.nvim_set_keymap("v", "<C-f>", "<Esc>:Telescope current_buffer_fuzzy_find<CR>", { noremap = true })
vim.api.nvim_set_keymap("i", "<C-f>", "<Esc>:Telescope current_buffer_fuzzy_find<CR>", { noremap = true })
vim.api.nvim_set_keymap("c", "<C-f>", "<C-C>:Telescope current_buffer_fuzzy_find<CR>", { noremap = true })
vim.api.nvim_set_keymap("o", "<C-f>", "<Esc>:Telescope current_buffer_fuzzy_find<CR>", { noremap = true })

-- FIND IN FILES
-- Cmd+Shift+F is mapped to Ctrl+O in Alacritty
-- Map Ctrl+o to Telescope live_grep in all modes
vim.api.nvim_set_keymap("n", "<C-o>", ":Telescope live_grep<CR>", { noremap = true })
vim.api.nvim_set_keymap("v", "<C-o>", "<Esc>:Telescope live_grep<CR>", { noremap = true })
vim.api.nvim_set_keymap("i", "<C-o>", "<Esc>:Telescope live_grep<CR>", { noremap = true })
vim.api.nvim_set_keymap("c", "<C-o>", "<C-C>:Telescope live_grep<CR>", { noremap = true })
vim.api.nvim_set_keymap("o", "<C-o>", "<Esc>:Telescope live_grep<CR>", { noremap = true })

-- UNDO
-- Cmd+z is mapped to Ctrl+y in Alacritty
-- Map Ctrl+y to undo in all modes
vim.api.nvim_set_keymap("n", "<C-y>", "u", { noremap = true })
vim.api.nvim_set_keymap("v", "<C-y>", "<Esc>ugv", { noremap = true })
vim.api.nvim_set_keymap("i", "<C-y>", "<C-O>u", { noremap = true })
vim.api.nvim_set_keymap("c", "<C-y>", "<C-C>u", { noremap = true })
vim.api.nvim_set_keymap("o", "<C-y>", "<Esc>u", { noremap = true })
-- TEST !!!
--
-- Testing Goto definition LSP
--vim.keymap.set("n", "<C-h>", vim.lsp.buf.definition, { noremap = true })
