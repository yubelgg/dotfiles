return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
    keys = {
        { "<C-e>", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, desc = "Harpoon menu" },
        { "<leader>a", function() require("harpoon"):list():add() end, desc = "Harpoon add" },
        { "<C-b>", function() require("harpoon"):list():select(1) end, desc = "Harpoon 1" },
        { "<C-n>", function() require("harpoon"):list():select(2) end, desc = "Harpoon 2" },
        { "<C-s>", function() require("harpoon"):list():select(3) end, desc = "Harpoon 3" },
    },
    config = function()
        require("harpoon"):setup()
    end,
}
