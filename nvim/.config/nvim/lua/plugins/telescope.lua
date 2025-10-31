return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require('telescope').setup({
                -- defaults = {
                --     layout_strategy = "vertical",
                --     layout_config = {
                --         vertical = {
                --             width = 0.8,
                --             height = 0.9,
                --             preview_height = 0.6,
                --             preview_cutoff = 1,
                --         },
                --     },
                -- },
            })
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
            vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
            vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
        end,
    },
}
