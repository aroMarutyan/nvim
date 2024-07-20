local vim = vim;
local harpoon = require("harpoon");

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end);
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end);

vim.keymap.set("n", "<C-h>", function() harpoon:list():prev() end);
vim.keymap.set("n", "<C-l>", function() harpoon:list():next() end);

-- vim.keymap.set("n", "<C-j>", function() ui.nav_file(2) end);
-- vim.keymap.set("n", "<C-k>", function() ui.nav_file(3) end);
