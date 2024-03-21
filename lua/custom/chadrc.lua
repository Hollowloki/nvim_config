---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  tabufline = { show_numbers = true },
  lsp = {
    signature = {},
  },
  cmp = {
    style = "atom_colored",
    selected_item_bg = "colored",
  },

  telescope = {
    style = "borderless",
  },

  statusline = {
    theme = "minimal",
  },

  theme = "tokyonight",
  theme_toggle = { "penumbra_light", "tokyonight" },

  hl_override = highlights.override,
  hl_add = highlights.add,
  nvdash = {
    load_on_startup = true,
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
