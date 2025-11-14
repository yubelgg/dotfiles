return {
	-- "morhetz/gruvbox",
	"chriskempson/vim-tomorrow-theme",
	priority = 1000,
	lazy = false,
	opts = ...,
	config = function()
		-- vim.cmd.colorscheme("gruvbox")
		vim.cmd.colorscheme("Tomorrow-Night-Bright")

		-- Transparent background
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

		-- Ensure floating window borders are visible
		vim.api.nvim_set_hl(0, "FloatBorder", {
			fg = "#81a2be",
			bg = "none",
		})

		-- Blink.cmp with transparent background
		vim.api.nvim_set_hl(0, "BlinkCmpMenu", {
			bg = "none",
		})

		vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", {
			fg = "#81a2be",
			bg = "none",
		})

		vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection", {
			bg = "#2a2a2a",
		})

		vim.api.nvim_set_hl(0, "BlinkCmpDoc", {
			bg = "none",
		})

		vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", {
			fg = "#81a2be",
			bg = "none",
		})

		vim.api.nvim_set_hl(0, "Pmenu", {
			bg = "none",
		})

		vim.api.nvim_set_hl(0, "PmenuSel", {
			bg = "#2a2a2a",
		})
	end,
}
