require "core"

local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

if custom_init_path then
  dofile(custom_init_path)
end

require("core.utils").load_mappings()

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- bootstrap lazy.nvim!
if not vim.loop.fs_stat(lazypath) then
  require("core.bootstrap").gen_chadrc_template()
  require("core.bootstrap").lazy(lazypath)
end

dofile(vim.g.base46_cache .. "defaults")
vim.opt.rtp:prepend(lazypath)
require "plugins"

vim.wo.relativenumber = true

-- allow use system clipboard as vim register
vim.opt.clipboard:append("unnamedplus")

-- press jk to leave insert mode
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true, silent = true })

-- use L to assign the last word of the line when pending
vim.api.nvim_set_keymap('o', 'L', '$', { noremap = true, silent = true })

-- use H to assign the first word of the line when pending
vim.api.nvim_set_keymap('o', 'H', '^', { noremap = true, silent = true })
