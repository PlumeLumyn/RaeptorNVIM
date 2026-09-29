vim.g.mapleader = " "
vim.g.maplocalleader = "  "
vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.laststatus = 0
vim.opt.cmdheight = 0
vim.opt.tabstop = 2      -- number of spaces a tab displays as
vim.opt.shiftwidth = 2   -- number of spaces for auto-indent
vim.opt.expandtab = true -- use spaces instead of tabs
vim.opt.softtabstop = 2  -- spaces inserted when pressing Tab
vim.opt.autoread = false
vim.o.wrap = false
vim.o.confirm = true
vim.o.cursorline = true

vim.o.title = true
local function update_title()
  vim.schedule(function()
    local pwd = vim.fn.getcwd()
    local name = vim.api.nvim_buf_get_name(0)

    pwd = vim.fn.fnamemodify(pwd, ":t")
    name = vim.fn.fnamemodify(name, ":t")

    -- Check if start with neo-tree filesystem
    if vim.startswith(name, "neo-tree filesystem") then
      name = "Neo-tree"
    end

    if name == "zsh" then
      name = "Terminal"
    end

    vim.o.titlestring = "  "
    vim.o.titlestring = vim.o.titlestring .. pwd .. " - "

    if name == "" then
      vim.o.titlestring = vim.o.titlestring .. "RæptorNVIM"
      return
    end

    vim.o.titlestring = vim.o.titlestring .. name
  end)
end

vim.api.nvim_create_autocmd({
  "BufEnter",
  "BufWinEnter",
  "WinEnter",
}, {
  callback = update_title,
})

update_title()


-- Add undo file
vim.opt.undofile = true


-- Enable treesitter folding (required for function folding)
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldcolumn = '1' -- '0' is not bad
vim.opt.foldenable = true
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99

vim.diagnostic.config({
  virtual_text = true,
  virtual_lines = { current_line = true },
  underline = true,
  update_in_insert = false
})

vim.cmd(":ShowkeysToggle")
