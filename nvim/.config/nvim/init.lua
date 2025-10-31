local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("options")
require("keymaps")
require("lazy").setup("plugins")

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    pattern = "*.py",
    command = "silent !black %",
    group = group,
})

vim.g.netrw_banner = 0
vim.g.netrw_winsize = 30
