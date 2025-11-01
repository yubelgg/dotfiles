return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		-- Configure linters by filetype
		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
		}

		-- Create augroup for linting autocommands
		local lint_augroup = vim.api.nvim_create_augroup("Linting", { clear = true })

		-- Lint on these events (removed BufEnter to reduce overhead)
		vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
			desc = "Trigger linting for current buffer",
		})

		-- Defer linter installation check to avoid blocking startup
		vim.defer_fn(function()
			local mason_registry = require("mason-registry")
			if not mason_registry.is_installed("eslint_d") then
				vim.notify("Installing linter: eslint_d", vim.log.levels.INFO)
				vim.cmd("MasonInstall eslint_d")
			end
		end, 1000)
	end,
}
