vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.o.termguicolors = true

require("config.lazy")
require("config.commands")
require("config.dap")
require("options.keymaps")
require("options.options")
require("options.debug")

-- Colorscheme
vim.cmd.colorscheme("one_monokai")
