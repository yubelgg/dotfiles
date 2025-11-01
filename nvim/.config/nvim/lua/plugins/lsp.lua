return {
	{
		"williamboman/mason.nvim",
		lazy = true,
		cmd = {
			"Mason",
			"MasonInstall",
			"MasonUninstall",
			"MasonUpdate",
			"MasonLog",
		},
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "clangd", "pyright", "ruff", "ts_ls" },
			})
		end,
	},
	{
		dir = vim.fn.stdpath("config"),
		name = "minimal-lsp",
		priority = 100,
		config = function()
			local lsp_augroup = vim.api.nvim_create_augroup("CustomLSP", { clear = true })

			vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
				group = lsp_augroup,
				pattern = "*.cc",
				callback = function()
					vim.bo.filetype = "cpp"
				end,
			})

			vim.lsp.config("clangd", {
				cmd = { "clangd" },
				filetypes = { "c", "cpp" },
			})

			vim.lsp.config("pyright", {
				cmd = { "pyright-langserver", "--stdio" },
				filetypes = { "python" },
			})

			vim.lsp.config("ruff", {
				cmd = { "ruff", "server" },
				filetypes = { "python" },
			})

			vim.lsp.config("ts_ls", {
				cmd = { "typescript-language-server", "--stdio" },
				filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
			})

			vim.lsp.config("lua_ls", {
				cmd = { "lua-language-server" },
				filetypes = { "lua" },
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
						workspace = { checkThirdParty = false },
					},
				},
			})

			-- Configure diagnostics with borders
			vim.diagnostic.config({
				virtual_text = {
					spacing = 4,
					prefix = "●",
				},
				signs = true,
				underline = true,
				update_in_insert = false,
				severity_sort = true,
				float = { border = "rounded" },
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				group = lsp_augroup,
				callback = function(event)
					local opts = { buffer = event.buf, silent = true }

					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)

					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)

					vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
					vim.keymap.set("n", "<leader>f", function()
						vim.lsp.buf.format({ async = true })
					end, opts)

					vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
					vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
					vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
					vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)
				end,
			})
		end,
	},
}
