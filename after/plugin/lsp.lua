local vim = vim;
local lsp_zero = require('lsp-zero');
local cmp = require('cmp');
local mason = require('mason');
local lsp_config = require('lspconfig');

lsp_config.intelephense.setup({});
mason.setup({});

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

lsp_config.eslint.setup{};
lsp_config.tsserver.setup{
   init_options = {
      preferences = {
        -- other preferences... 
        importModuleSpecifierPreference = 'relative',
        importModuleSpecifierEnding = 'minimal',
      },
    }
};
lsp_config.angularls.setup{};
lsp_config.svelte.setup{};
lsp_config.html.setup{};
lsp_config.cssls.setup{};
lsp_config.lua_ls.setup{};
lsp_config.emmet_language_server.setup{};

local cmp_select = {behavior = cmp.SelectBehavior.Select};
local cmp_mappings = lsp_zero.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
})

-- local mason_registry = require('mason-registry');
-- local angularls_path = mason_registry('css-lsp'):get_install_path();
--
-- local cmd = {
--   "ngserver",
--   "--stdio",
--   "--tsProbeLocations",
--   table.concat({
--       angularls_path,
--       vim.uv.cwd(),
--   }, ','),
--   "--ngProbeLocations",
--     table.concat({
--       angularls_path .. '/node_modules/@angular/language-server',
--       vim.uv.cwd(),
--   }, ','),
--   "--experimental-ivy",
-- }
--
-- lsp_config.angularls.setup({
--   cmd = cmd,
--   on_new_config = function(new_config, new_root_dir)
--     new_config.cmd = cmd
--   end,
--   -- on_attach = on_attach,
--   -- on_attach = capabilities,
-- })
