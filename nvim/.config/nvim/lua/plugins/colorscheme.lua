return {
	-- "morhetz/gruvbox",
	"chriskempson/vim-tomorrow-theme",
	priority = 1000,
	lazy = false,
	opts = ...,
	config = function()
		-- vim.cmd.colorscheme("gruvbox")
		vim.cmd.colorscheme("Tomorrow-Night-Bright")

		-- Defer highlight changes to after UI is ready
		-- Transparent background
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

		-- Ensure floating window borders are visible
		vim.api.nvim_set_hl(0, "FloatBorder", {
			fg = "#81a2be", -- Tomorrow Night Bright blue color
			bg = "none",
		})
	end,
}
