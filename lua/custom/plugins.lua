local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {
  {
    lazy = false,
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  -- markdown preview
  -- when .md file is opened, run :MarkdownPreviewToggle
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  -- lsp bootstrapper
  {
    "nvimdev/lspsaga.nvim",
    config = function()
      require("lspsaga").setup {}
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter", -- optional
      "nvim-tree/nvim-web-devicons", -- optional
    },
    lazy = false,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- mason plugins
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "intelephense",
        "html-lsp",
        "css-lsp",
        "stylua",
        "rust-analyzer",
        "phpactor",
        "typescript-language-server",
        "pyright",
        "mypy",
        "eslint_d",
        "ruff",
        "black",
        "debugpy",
        "prettierd",
        "phpcbf",
        "pint",
        "tailwindcss-language-server",
        "asmfmt",
        "asm-lsp",
        "marksman",
        "markdownlint",
        "jdtls",
        "gopls",
        "gofumpt",
        "goimports-reviser",
        "golines",
        "sql-formatter",
        "sqlls",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  -- left hand side bar
  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- escape from insert mode by typing jk
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- ai completion plugin
  {
    "github/copilot.vim",
    ft = { "python", "php", "javascript", "typescript", "c", "lua", "rust", "css" },
    lazy = false,
  },

  -- todo comment hightlight
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    lazy = false,
  },

  -- mini indent scope
  {
    "echasnovski/mini.nvim",
    version = "*",
    config = function()
      require("mini.indentscope").setup()
    end,
    lazy = false,
  },

  -- rust tools
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
    dependencies = "neovim/nvim-lspconfig",
    opts = function()
      return require "custom.configs.rust-tools"
    end,
    config = function(_, opts)
      require("rust-tools").setup(opts)
    end,
  },

  {
    "saecki/crates.nvim",
    ft = { "rust", "toml" },
    config = function(_, opts)
      local crates = require "crates"
      crates.setup(opts)
      crates.show()
    end,
  },

  -- navigate between tmux and vim
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    suggesstion = {
      auto_trigger = true,
    },
  },

  -- cool plugin
  {
    "eandrju/cellular-automaton.nvim",
    lazy = false,
  },

  -- file explorer
  {
    "stevearc/oil.nvim",
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function(_, opts)
      require("oil").setup()
    end,
    lazy = false,
  },

  -- smooth scroll
  {
    "karb94/neoscroll.nvim",
    keys = { "<C-d>", "<C-u>" },
    config = function()
      require("neoscroll").setup()
    end,
  },
  -- Screenshot
  {
    "michaelrommel/nvim-silicon",
    lazy = true,
    cmd = "Silicon",
    config = function()
      require("silicon").setup {
        -- Configuration here, or leave empty to use defaults
        font = "JetbrainsMono Nerd Font Mono=34;Noto Emoji=34",
        theme = "Dracula",
        background = "#94e2d5",
      }
    end,
  },

  -- distraction free mode
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    config = function()
      require "custom.configs.zenmode"
    end,
  },

  -- bookmark line
  {
    "tomasky/bookmarks.nvim",
    -- after = "telescope.nvim",
    event = "VimEnter",
    config = function()
      require("bookmarks").setup {
        -- sign_priority = 8,  --set bookmark sign priority to cover other sign
        save_file = vim.fn.expand "$HOME/.bookmarks", -- bookmarks save file path
        keywords = {
          ["@t"] = "♡", -- mark annotation startswith @t ,signs this icon as `Todo`
          ["@w"] = "⚠️ ", -- mark annotation startswith @w ,signs this icon as `Warn`
          ["@f"] = "⛏ ", -- mark annotation startswith @f ,signs this icon as `Fix`
          ["@n"] = " ", -- mark annotation startswith @n ,signs this icon as `Note`
        },
        on_attach = function(bufnr)
          local bm = require "bookmarks"
          local map = vim.keymap.set
          map("n", "mm", bm.bookmark_toggle) -- add or remove bookmark at current line
          map("n", "mi", bm.bookmark_ann) -- add or edit mark annotation at current line
          map("n", "mc", bm.bookmark_clean) -- clean all marks in local buffer
          map("n", "mn", bm.bookmark_next) -- jump to next mark in local buffer
          map("n", "mp", bm.bookmark_prev) -- jump to previous mark in local buffer
          map("n", "ml", bm.bookmark_list) -- show marked file list in quickfix window
        end,
      }
      require("telescope").load_extension "bookmarks"
    end,
    lazy = false,
  },
  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
