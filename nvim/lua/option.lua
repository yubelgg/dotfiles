vim.g.mapleader = " "
vim.g.autoformat = true

local opt = vim.opt
opt.number = true
opt.relativenumber = true
opt.guicursor = ""

opt.clipboard = "unnamedplus"
opt.cursorline = true

opt.shiftwidth = 2
opt.softtabstop = 2
opt.tabstop = 2
opt.expandtab = true
opt.smartindent = true

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.hlsearch = false
opt.list = true
opt.mouse = ""
opt.scrolloff = 8
opt.termguicolors = true
opt.updatetime = 50
opt.colorcolumn = "80"

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0
