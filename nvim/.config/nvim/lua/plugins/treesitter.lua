return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			auto_install = true,
			ensure_installed = {
				"python",
				"cpp",
				"c",
				"typescript",
				"tsx",
				"javascript",
				"lua",
				"markdown",
				"markdown_inline",
				"json",
				"yaml",
				"html",
				"css",
			},
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
