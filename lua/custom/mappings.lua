---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["C-h"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
    ["C-l"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
    ["C-j"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
    ["C-k"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
    ["<leader>fl"] = { "<cmd>CellularAutomaton make_it_rain<CR>" },
  },
  v = {
    [">"] = { ">gv", "indent" },
  },
}

M.trouble = {
  n = {
    ["<leader>xx"] = { "<cmd>TroubleToggle<CR>", "trouble" },
    ["<leader>xw"] = { "<cmd>TroubleToggle workspace_diagnostics<CR>", "workspace" },
    ["<leader>xd"] = { "<cmd>TroubleToggle document_diagnostics<CR>", "document" },
    ["<leader>xl"] = { "<cmd>TroubleToggle loclist<CR>", "loclist" },
    ["<leader>xq"] = { "<cmd>TroubleToggle quickfix<CR>", "quickfix" },
    ["<leader>xr"] = { "<cmd>TroubleToggle lsp_references<CR>", "references" },
  },
}

M.lspconfig = {
  plugin = true,
  n = {
    ["<leader>t"] = {
      "<cmd> Lspsaga term_toggle <CR>",
      "LSP terminal",
    },
    ["gf"] = {
      "<cmd> Lspsaga finder <CR>",
      "LSP finder",
    },

    ["gd"] = {
      "<cmd> Lspsaga goto_definition <CR>",
      "LSP definition",
    },

    ["K"] = {
      "<cmd> Lspsaga hover_doc <CR>",
      "LSP hover",
    },
    ["<leader>ra"] = { "<cmd> Lspsaga rename <CR>", "LSP rename" },
    ["]d"] = {
      "<cmd> Lspsaga diagnostic_jump_next<CR>",
      "LSP jump next",
    },
    ["[d"] = {
      "<cmd> Lspsaga diagnostic_jump_prev<CR>",
      "LSP jump prev",
    },
    ["<leader>ca"] = {
      "<cmd> Lspsaga code_action <CR>",
      "LSP code action",
    },
  },
}

M.telescope = {
  n = {
    ["<leader>f"] = { "<cmd> Telescope find_files <CR>", "Файлаас хайх." },
    ["<leader>fo"] = { "<cmd> Telescope bookmarks list <CR>", "Хадгалсан мөр лүү очих." },
  },
}

M.oil = {
  n = {
    ["<leader>o"] = { "<cmd>Oil<CR>", "Тухайн орчин дахь файлуудыг харуулна." },
  },
}

return M
