vim.schedule(function()
  local c30 = require("base46").get_theme_tb("base_30")
  local c16 = require("base46").get_theme_tb("base_16")

  vim.api.nvim_set_hl(0, "StatusLine", {
    fg = c30.white,
    bg = c16.base00, -- or darker_black, one_bg, etc.
  })

  vim.api.nvim_set_hl(0, "StatusLineNC", {
    fg = c30.grey,
    bg = c16.base00,
  })

  vim.api.nvim_set_hl(0, "NvimDapViewTabSelected", {
    fg = "#ffffff",
    bg = "#a0a0a0",
    bold = true,
  })

  vim.api.nvim_set_hl(0, "NvimDapViewTab", {
    fg = "#c0c0c0",
    bg = "#202020",
  })

  vim.api.nvim_set_hl(0, "DapBreakpoint", {
    fg = "#f38ba8",
  })

  vim.api.nvim_set_hl(0, "DapBreakpointCondition", {
    fg = "#f9e2af",
  })

  vim.api.nvim_set_hl(0, "DapLogPoint", {
    fg = "#89b4fa",
  })

  vim.api.nvim_set_hl(0, "DapStopped", {
    fg = "#89b4fa",
  })


  require("base46").load_all_highlights()
end)
-- put this after lazy setup

-- (method 1, For heavy lazyloaders)
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

-- require("nvconfig").base46.theme = 'vscode'
-- require("base46").load_all_highlights()
