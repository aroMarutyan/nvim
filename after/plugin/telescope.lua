local vim = vim;
local telescope = require('telescope');
local builtin = require('telescope.builtin');
local actions = require('telescope.actions');

telescope.load_extension('git_file_history');
local git_file_history = telescope.extensions.git_file_history;

telescope.setup{
  defaults = {
    -- dynamic_preview_title = true;
    -- show_line = false;
    -- wrap_results = true;
    -- show_result = false;
  },
  --  pickers = {
  --     grep_string = {
  --       mappings = {
  --       i = { ["<C-f>"] = actions.to_fuzzy_refine },
  --       },
  --           additional_args = function()
  --             return {"--max-count=1","--fixed-strings"}
  --           end
  --     },
  -- }
};


vim.keymap.set('n', '<leader>gfh', function()
	git_file_history.git_file_history({ noremap = true, silent = true, show_line = false, wrap_results = true });
end);

vim.keymap.set('n', '<leader>ref', function()
	builtin.lsp_references({ noremap = true, silent = true, show_line = false, wrap_results = true });
end);

vim.keymap.set('n', '<leader>im', function()
	builtin.lsp_implementations({ noremap = true, silent = true, show_line = false, wrap_results = true });
end);

vim.keymap.set('n', '<leader>ica', function()
	builtin.lsp_incoming_calls({ noremap = true, silent = true, show_line = false, wrap_results = true });
end);

vim.keymap.set('n', '<leader>oca', function()
	builtin.lsp_outgoing_calls({ noremap = true, silent = true, show_line = false, wrap_results = true });
end);

vim.keymap.set('n', '<leader>typ', function()
	builtin.type_definitions({ noremap = true, silent = true, show_line = false, wrap_results = true });
end);

-- Remaps
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > "), disable_coordinates = true });
end)

-- Exact word match
-- vim.keymap.set('n', '<leader>pse', function()
-- 	builtin.grep_string({ search = vim.fn.input("Grep Exact Match> "), disable_coordinates = true, word_match = "-w" });
-- end)

vim.keymap.set('n', '<leader>pS', function()
  builtin.grep_string({ disable_coordinates = true });
end)

vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
