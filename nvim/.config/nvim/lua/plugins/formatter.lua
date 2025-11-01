return {
	"stevearc/conform.nvim",
	dependencies = { "mason.nvim" },
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		notify_on_error = false,
		format_on_save = {
			lsp_fallback = true,
			async = false,
			timeout_ms = 1000,
		},
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "ruff_format" },
			c = { "clang-format" },
			cpp = { "clang-format" },
			css = { "prettier" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			html = { "prettier" },
			json = { "prettier" },
			yaml = { "prettier" },
			markdown = { "prettier" },
		},
	},
	config = function(_, opts)
		require("conform").setup(opts)

		-- Defer formatter installation checks to avoid blocking startup
		vim.defer_fn(function()
			local mason_registry = require("mason-registry")
			local formatters = { "ruff", "stylua", "prettier", "clang-format" }

			for _, formatter in ipairs(formatters) do
				if not mason_registry.is_installed(formatter) then
					vim.notify("Installing formatter: " .. formatter, vim.log.levels.INFO)
					vim.cmd("MasonInstall " .. formatter)
				end
			end
		end, 1000)
	end,
}
