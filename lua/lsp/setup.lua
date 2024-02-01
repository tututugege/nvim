-- :h mason-default-settings
require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

local lspconfig = require('lspconfig')
-- mason-lspconfig uses the `lspconfig` server names in the APIs it exposes - not `mason.nvim` package names
-- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
require("mason-lspconfig").setup({
  -- 确保安装，根据需要填写
  ensure_installed = {
    "lua_ls",
    "bashls",
    "clangd"
  },
})

require("mason-lspconfig").setup_handlers ({
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function (server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {}
    end,
    -- Next, you can provide a dedicated handler for specific servers.
    ["lua_ls"] = function ()
        lspconfig.lua_ls.setup({})
    end,

    ["clangd"] = function ()
    lspconfig.clangd.setup {
      cmd = {
        "clangd",
        "--header-insertion=never",
        "--query-driver=/opt/homebrew/opt/llvm/bin/clang",
        "--all-scopes-completion",
        "--completion-style=detailed",
      }
    }
  end
})

