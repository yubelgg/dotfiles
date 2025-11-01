-- UI & Display
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.guicursor = ""
vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"

-- Indentation & Formatting
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- File Handling & Persistence
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Search & Navigation
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.wrap = false
vim.opt.scrolloff = 10

-- Interface & Behavior
vim.opt.mouse = ""
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.colorcolumn = "80"

-- Performance
vim.opt.splitkeep = "screen"

-- Floating Windows
vim.o.winborder = "rounded"

-- Buffer-local settings
vim.opt_local.conceallevel = 2
