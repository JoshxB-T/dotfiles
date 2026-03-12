-------------------------------------------------------------
-- BASIC OPTIONS
-------------------------------------------------------------
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true
vim.opt.background = "dark"
vim.opt.clipboard = "unnamedplus"
vim.opt.wrap = false

vim.g.mapleader = " "

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
    vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
    vim.api.nvim_set_hl(0, "LineNrAbove", { fg="#41c9eb", bold=true })
    vim.api.nvim_set_hl(0, "LineNr", { fg="white", bold=true })
    vim.api.nvim_set_hl(0, "LineNrBelow", { fg="#ff5555", bold=true })
  end,
})

-------------------------------------------------------------
-- OTHER OPTIONS
-------------------------------------------------------------
vim.keymap.set("i", "jj", "<Esc>", {noremap = true, silent = true, desc = "Exit Insert mode"})

-------------------------------------------------------------
-- PLUGIN MANAGER: lazy.nvim
-------------------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -----------------------------------------------------------
  -- JSREGEXP
  -----------------------------------------------------------
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp"
  },
  -----------------------------------------------------------
  -- DIABLE HEREROCKS
  -----------------------------------------------------------
  {
    "folke/lazy.nvim",
    opts = {
      rocks = {
        hererocks = false,
      },
    }
  },

  -----------------------------------------------------------
  -- THEME
  -----------------------------------------------------------
  {
    --"folke/tokyonight.nvim",
    --"ellisonleao/gruvbox.nvim",
    "ficcdaf/ashen.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      --vim.g.tokyonight_style = "night"
      --vim.o.background = "dark"
      --vim.cmd([[colorscheme tokyonight]])
      --vim.cmd([[colorscheme gruvbox]])
      vim.cmd([[colorscheme ashen]])
    end
  },

  -----------------------------------------------------------
  -- NVIM TMUX NAV
  -----------------------------------------------------------
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
        "TmuxNavigateLeft",
        "TmuxNavigateDown",
        "TmuxNavigateUp",
        "TmuxNavigateRight",
        "TmuxNavigatePrevious",
        "TmuxNavigateProcessList",
    },
    keys = {
        { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
        { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
        { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
        { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
        { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },

  -----------------------------------------------------------
  -- TREESITTER
  -----------------------------------------------------------
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = { "lua", "javascript" },
      highlight = {
        enable = true
      },
      indent = {
        enable = true
      },
    },
  },

  -----------------------------------------------------------
  -- LSP + COMPLETION (C / clangd)
  -----------------------------------------------------------
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "clangd" },
      })
    end
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping.confirm({ select = true }),
          ["<C-Space>"] = cmp.mapping.complete(),
        }),
        sources = {
          { name = "nvim_lsp" },
        },
      })
    end
  },

  -----------------------------------------------------------
  -- STATUSLINE
  -----------------------------------------------------------
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup()
    end,
  },
  
  -----------------------------------------------------------
  -- AUTO PAIRS
  -----------------------------------------------------------
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({
        disable_filetype = { "TelescopePrompt" },
        check_ts = true, -- enable Treesitter integration
      })
    end
  },

  -----------------------------------------------------------
  -- TELESCOPE
  -----------------------------------------------------------
  {
    "nvim-telescope/telescope.nvim", tag = "v0.2.0",
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
})

local builtin = require("telescope.builtin")
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

-----------------------------------------------------------
-- Native LSP config (Neovim 0.11+)
-----------------------------------------------------------
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local capabilities = cmp_nvim_lsp.default_capabilities()

vim.lsp.config("clangd", {
  cmd = { "clangd" },
  capabilities = capabilities,
  on_attach = function(_, bufnr)
    local opts = { buffer = bufnr, silent = true }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  end,
})

vim.lsp.enable("clangd")

