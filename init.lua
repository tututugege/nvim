require('basic')
require('keybindings')
require('plugins')
require('colorscheme')
require('plugin-config.bufferline')
require('plugin-config.lualine')
require('plugin-config.nvim-treesitter')
require('plugin-config.dashboard')
require('plugin-config.project')
require('plugin-config.comment')
require('lsp.setup')
require('lsp.cmp')


local nvimTree = require("nvim-tree")

local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', 'v', api.node.open.vertical, opts('Open: Veritical Split'))
  vim.keymap.set('n', 'h', api.node.open.horizontal, opts('Open:Horizontal Split'))
  vim.keymap.set('n', 't', api.node.open.tab, opts('Open: New Tab'))
end

-- pass to setup along with your other options

  -- disable netrw at the very start of your init.lua (strongly advised)
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1

  nvimTree.setup({
    on_attach = my_on_attach,
    update_cwd = true,
    update_focused_file = {
      enable = true,
      update_root = true,
      update_cwd = true,
    },
    git = {
      enable = true,
      ignore = true,
    },
    filters = {
      -- hide dot files
      dotfiles = true,
      -- hide node_modules folder
      -- custom = { "node_modules" },
    },
    view = {
      width = 34,
      -- or 'right'
      side = "left",
      number = false,
      relativenumber = false,
      signcolumn = "yes",
    },
    actions = {
      open_file = {
        resize_window = true,
        quit_on_open = false,
      },
    },
  renderer = {
    group_empty = true,
    icons = {
      show = {
        git = true,
        file = true,
        folder = true,
        folder_arrow = true,
      },
      glyphs = {
        bookmark = " ",
        folder = {
          arrow_closed = "⏵",
          arrow_open = "⏷",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "⌥",
          renamed = "➜",
          untracked = "★",
          deleted = "⊖",
          ignored = "◌",
        },
      },
    },
  },
})
