return {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
        opts.servers = opts.servers or {}
    end,
}

-- return {
--     "neovim/nvim-lspconfig",
--     opts = function(_, opts)
--         opts.servers = opts.servers or {}
--     end,
--     config = function(_, opts)
--         local lspconfig = require("lspconfig")
--
--         -- Arduino Language Server のセットアップ
--         if
--             not vim.tbl_contains(
--                 vim.tbl_map(
--                     function(client)
--                         return client.name
--                     end,
--                     vim.lsp.get_clients() -- 起動済みLSP
--                 ),
--                 "arduino_language_server"
--             )
--         then
--             lspconfig.arduino_language_server.setup({
--                 cmd = {
--                     "arduino-language-server",
--                     "-cli-config",
--                     vim.fn.expand("$USERPROFILE") .. "\\AppData\\Local\\Arduino15\\arduino-cli.yaml",
--                     "-fqbn",
--                     "esp32:esp32:esp32wroverkit",
--                     "-cli",
--                     "arduino-cli",
--                     "-clangd",
--                     "clangd",
--                 },
--                 filetypes = { "arduino" },
--             })
--         end
--     end,
-- }
