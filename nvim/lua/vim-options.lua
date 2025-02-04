vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { noremap = true, silent = true })
vim.o.clipboard = "unnamedplus"

-- small cursor for insert modo
vim.opt.guicursor = "n-v-c:block-Cursor,i:ver100-iCursor,n-v-c:blinkon0,i:blinkwait10"

-- relative numbering
vim.opt.nu = true
vim.opt.relativenumber = true

-- tabs and space options
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- smart indenting for idnenting values
vim.opt.smartindent = true

vim.opt.wrap = false

-- for undoing for long time
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- searching options
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

-- fixing scroll for 8 lines only
vim.opt.scrolloff = 8

-- for moving the selected line  up and down function
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- remapping control-c to c to override terminal exit
vim.keymap.set({ "i", "n", "v" }, "<C-c>", "<Esc>")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

