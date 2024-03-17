return {
  --"rose-pine/neovim",
  "morhetz/gruvbox",
  priority = 1000,
  opts = ...,
  config = function()
    vim.cmd.colorscheme("gruvbox")
    --vim.cmd.colorscheme("rose-pine")
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  end,
}
