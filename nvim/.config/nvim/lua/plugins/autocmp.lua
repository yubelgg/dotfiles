return {
	"saghen/blink.cmp",
	dependencies = "rafamadriz/friendly-snippets",
	event = "InsertEnter",
	version = "*",
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = { preset = "default" },

		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},

		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
			providers = {
				buffer = {
					max_items = 5,
					min_keyword_length = 3,
				},
			},
		},

		-- Add borders to completion windows
		completion = {
			menu = {
				border = "rounded",
				delay = 10,
			},
			documentation = {
				window = {
					border = "rounded",
				},
				auto_show = true,
				auto_show_delay_ms = 200,
			},
		},

		signature = {
			window = {
				border = "rounded",
			},
		},
	},
	opts_extend = { "sources.default" },
}
