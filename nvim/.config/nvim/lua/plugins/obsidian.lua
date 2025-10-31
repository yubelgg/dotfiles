return {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        workspaces = {
            {
                name = "z",
                path = "~/personal/z",
            },
        },
        templates = {
            folder = "05 - template",
            date_format = "%Y-%m-%d",
            time_format = "%H:%M",
        },
    },
    config = function(_, opts)
        require("obsidian").setup(opts)

        local function update_timestamp()
            local first_line = vim.api.nvim_buf_get_lines(0, 0, 1, false)[1]
            if first_line ~= "---" then return end

            local timestamp = os.date("%Y-%m-%d %H:%M")

            local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
            local frontmatter_end = 0
            local updated_line = 0

            for i = 2, #lines do
                if lines[i] == "---" then
                    frontmatter_end = i
                    break
                elseif lines[i]:match("^updated:") then
                    updated_line = i
                end
            end

            local cursor_pos = vim.api.nvim_win_get_cursor(0)

            if updated_line > 0 then
                vim.api.nvim_buf_set_lines(0, updated_line - 1, updated_line, false, { "updated: " .. timestamp })
            elseif frontmatter_end > 0 then
                vim.api.nvim_buf_set_lines(0, frontmatter_end - 1, frontmatter_end - 1, false,
                    { "updated: " .. timestamp })
            end

            vim.api.nvim_win_set_cursor(0, cursor_pos)
        end

        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*.md",
            callback = update_timestamp
        })
    end,
}
