return {
  'mbbill/undotree',
  config = function()
    vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
    vim.keymap.set("n", "<C-h>", "<C-w>h", {})
    vim.keymap.set("n", "<C-l>", "<C-w>l", {})
  end
}
