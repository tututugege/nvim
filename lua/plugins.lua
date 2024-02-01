local packer = require("packer")
packer.startup({
    function(use)
   -- Packer 可以管理自己本身
        use 'wbthomason/packer.nvim'
    -- 你的插件列表...
        use 'folke/tokyonight.nvim'
        use({ "nvim-tree/nvim-tree.lua", requires = "nvim-tree/nvim-web-devicons" })
        use {'akinsho/bufferline.nvim', tag = "*", requires = {'nvim-tree/nvim-web-devicons', 'moll/vim-bbye'}}
        use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
        use("arkav/lualine-lsp-progress")
        use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
        use({ "williamboman/mason.nvim" })
        use({ "williamboman/mason-lspconfig.nvim" })
        use({ "neovim/nvim-lspconfig" })

        use("hrsh7th/nvim-cmp")
        -- snippet 引擎
        use("hrsh7th/vim-vsnip")
        -- 补全源
        use("hrsh7th/cmp-vsnip")
        use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
        use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
        use("hrsh7th/cmp-path") -- { name = 'path' }
        use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }

        -- 常见编程语言代码段
        use("rafamadriz/friendly-snippets")
        use{"glepnir/dashboard-nvim",
            requires = {"nvim-tree/nvim-web-devicons"}
        }
        use("ahmedkhalf/project.nvim")
        use { 'nvim-telescope/telescope.nvim', requires = { "nvim-lua/plenary.nvim" } }

        use {
            "windwp/nvim-autopairs",
            config = function() require("nvim-autopairs").setup {} end
        }

        use {
            'numToStr/Comment.nvim',
            config = function()
                require('Comment').setup()
            end
}
    end,
    config = {
        display = {
            open_fn = function()
                return require("packer.util").float({ border = "single" })
            end,
        },
    }
})
pcall(
  vim.cmd,
  [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
)
