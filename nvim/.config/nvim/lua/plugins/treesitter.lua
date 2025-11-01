return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            auto_install = true,
            -- Explicitly install parsers for primary languages
            ensure_installed = {
                "python",           -- Python
                "cpp",              -- C++
                "c",                -- C
                "typescript",       -- TypeScript
                "tsx",              -- TypeScript JSX (React)
                "javascript",       -- JavaScript
                "lua",              -- Lua (for Neovim config)
                "markdown",         -- Markdown
                "markdown_inline",  -- Inline markdown
                "json",             -- JSON
                "yaml",             -- YAML
                "html",             -- HTML
                "css",              -- CSS
            },
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}
