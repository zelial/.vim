-- Converted Neovim configuration from Vimscript
-- Remove default settings and preserve original comments

-- General settings
vim.opt.wrap = false
vim.opt.history = 1000
vim.opt.ruler = true
vim.opt.title = true

-- Indentation
vim.cmd("filetype plugin indent on")
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.tabstop = 4
vim.opt.expandtab = true

-- Keep selection for repeated indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Search settings
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Swap file directory
vim.opt.directory = { "~/tmp", ".", "/tmp" }

-- Wildmenu
vim.opt.wildmenu = true
vim.opt.wildmode = { "list", "longest" }

-- Status line
vim.opt.laststatus = 2

-- Matching brackets
vim.opt.showmatch = true

-- Scrolling
vim.opt.scrolloff = 10
vim.opt.sidescroll = 10

-- Display settings
vim.opt.display = { "lastline" }

-- Backspace behavior
vim.opt.backspace = { "indent", "eol", "start" }

-- Highlight matching parens
vim.cmd("highlight MatchParen term=standout cterm=bold,underline")

-- Mouse settings
vim.opt.mouse = "a"
vim.opt.mousemodel = "extend"

-- Folding
vim.opt.foldenable = true
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 10
vim.opt.foldnestmax = 10

-- Spellchecking
vim.opt.spell = true

-- Tags and completion
vim.opt.complete = { ".", "w", "b", "u", "t", "i", "k", "]" }

-- Auto change directory
vim.opt.autochdir = true

-- Selection pasting shortcuts
vim.api.nvim_set_keymap("i", "<S-Insert>", "<ESC>\"*pi", { noremap = true })
vim.api.nvim_set_keymap("c", "<S-Insert>", "<C-R>*", { noremap = true })
-- ve visual modu pri stisku p nahrad vyber obsahem schranky
vim.api.nvim_set_keymap("v", "p", "<Esc>:let current_reg = @\"<CR>gvdi<C-R>=current_reg<CR><Esc>", { noremap = true })

-- Show trailing whitespace and tabs
vim.opt.listchars = { tab = ">-", trail = "·", nbsp = "⎵" }
vim.opt.list = true 

-- Always show the diagnostic colum
vim.opt.signcolumn = "yes"

-- Clipboard
-- y and d put stuff into system clipboard (so that other apps can see it)
vim.opt.clipboard = "unnamed"

-- open list of revisions automatically after git log
vim.cmd("command Glog2 :silent Glog | copen")

-- Colorscheme
vim.cmd("colorscheme zelial")

-- MRU settings
vim.g.MRU_Max_Entries = 2000
vim.g.MRU_Window_Height = 15

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Key mappings for Copilot suggestion
vim.keymap.set("n", "<leader>ac", ":Copilot suggestion<CR>", { noremap = true, silent = true })
vim.keymap.set("i", "<leader>ac", "<C-o>:Copilot suggestion<CR>", { noremap = true, silent = true })


-- BarBar mappings
vim.keymap.set("n", "<A-,>", "<Cmd>BufferPrevious<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<A-.>", "<Cmd>BufferNext<CR>", { silent = true, noremap = true })

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = {
    enabled = true,
    notify = false,
    },
  rocks = {
    enabled = false,
  },
})

-- nice iconf for disagnostics instead of letters
vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '✗',
      [vim.diagnostic.severity.WARN]  = '󱍼',
      [vim.diagnostic.severity.INFO]  = '󰙎',
      [vim.diagnostic.severity.HINT]  = ''
    },
  },
})

vim.lsp.enable('bashls')

-- leap remap s to anywahere so I don't need to care if destination if before or after cursor
vim.keymap.set({'n', 'x', 'o'}, 's', '<Plug>(leap-anywhere)')

-- scrolling the window without moving the cursor
-- vim.keymap.set("n", "<C-E>", "5<C-e>", { noremap = true, silent = true })
-- vim.keymap.set("n", "<C-Y>", "5<C-y>", { noremap = true, silent = true })

-- shortcuts to most used mini-surround motions
vim.keymap.set("n", "<leader>\"", "<leader>saiW\"", {remap = true})
vim.keymap.set("n", "<leader>'", "<leader>saiW'", {remap = true})
