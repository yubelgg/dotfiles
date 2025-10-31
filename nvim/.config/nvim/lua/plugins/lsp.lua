return {
	-- Mason for managing LSP servers
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "clangd", "pyright", "ruff" },
			})
		end,
	},
	-- Completion engine
	{
		"saghen/blink.cmp",
		config = function()
			require("blink.cmp").setup()
		end,
	},
	-- Minimal native LSP setup
	{
		dir = vim.fn.stdpath("config"),
		name = "minimal-lsp",
		priority = 100,
		config = function()
			-- Ensure .cc files are recognized as cpp
			vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
				pattern = "*.cc",
				callback = function()
					vim.bo.filetype = "cpp"
				end,
			})

			-- Simple LSP setup using vim.lsp.config
			vim.lsp.config("clangd", {
				cmd = { "clangd" },
				filetypes = { "c", "cpp" },
			})

			vim.lsp.config("pyright", {
				cmd = { "pyright-langserver", "--stdio" },
				filetypes = { "python" },
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

			-- Enable diagnostics
			vim.diagnostic.config({
				virtual_text = true,
				signs = true,
			})

			-- Set up keymaps when LSP attaches
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(event)
					local opts = { buffer = event.buf, silent = true }
					
					-- Essential navigation
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)              -- Go to definition
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)             -- Go to declaration
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)          -- Go to implementation
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)              -- Show references
					vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)         -- Go to type definition
					
					-- Documentation and help
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)                    -- Show hover documentation
					vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)       -- Show signature help
					
					-- Code actions and refactoring
					vim.keymap.set({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action, opts)  -- Code actions
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)              -- Rename symbol
					vim.keymap.set("n", "<leader>f", function()                              -- Format buffer
						vim.lsp.buf.format({ async = true })
					end, opts)
					
					-- Diagnostics navigation
					vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)             -- Previous diagnostic
					vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)             -- Next diagnostic
					vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)     -- Show line diagnostics
					vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)     -- Show all diagnostics
					
					-- Workspace management (optional but useful)
					vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)     -- Add workspace folder
					vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)  -- Remove workspace folder
					vim.keymap.set("n", "<leader>wl", function()                                   -- List workspace folders
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end, opts)
				end,
			})

		end,
	},
}
