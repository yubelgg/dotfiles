vim.g.mapleader = " "
vim.g.autoformat = true

local opt = vim.opt
opt.clipboard = "unnamedplus"
opt.cursorline = true
opt.expandtab = true
opt.list = true
opt.mouse = ""
opt.number = true
opt.relativenumber = true
opt.scrolloff = 4
opt.shiftwidth = 2
opt.tabstop = 2
opt.termguicolors = true

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0
