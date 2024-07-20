local vim = vim;

vim.g.mapleader = " ";
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex);

-- tab controls
vim.keymap.set("n", "<C-M-n>", ":tab split<CR>");
vim.keymap.set("n", "<C-M-c>", ":tabc<CR>");
vim.keymap.set("n", "<C-M-l>", ":tabn<CR>");
vim.keymap.set("n", "<C-M-h>", ":tabp<CR>");

-- move highlighted text
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv");
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv");

-- yank from cursor until end of line
vim.keymap.set("n", "Y", "yg$");

-- cursor stays in place when moving to one line
vim.keymap.set("n", "J", "mzJ`z");

-- cursor stays in the middle of the screen
vim.keymap.set("n", "<C-d>", "<C-d>zz");
vim.keymap.set("n", "<C-u>", "<C-u>zz");
vim.keymap.set("n", "n", "nzzzv");
vim.keymap.set("n", "N", "Nzzzv");

-- does not overwrite copied item with deleted one
vim.keymap.set("x", "<leader>p", "\"_dP");

-- copy to system clipboard. n-leader+y accepts arguments
vim.keymap.set("n", "<leader>y", "\"+y");
vim.keymap.set("v", "<leader>y", "\"+y");
vim.keymap.set("n", "<leader>Y", "\"+Y");

-- deletes to the void registry. Permanent delete
vim.keymap.set("n", "<leader>d", "\"_d");
vim.keymap.set("v", "<leader>d", "\"_d");

-- LSP actions
-- formats file with LSP rules
vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format();
end)

vim.keymap.set("n", "<leader>ca", function()
    vim.lsp.buf.code_action();
end)

-- Open GD in new V split - WIP
-- vim.keymap.set("n", "<leader>gds", "<C-w>vgd<C-w>x")

-- Quickfix list navigation 
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz");
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz");
-- Location list navigation
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz");
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz");

-- Rewrite all!
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>");

-- Open diagnostics float
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float);
