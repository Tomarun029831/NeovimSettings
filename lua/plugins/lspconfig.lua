return {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
        opts.servers = opts.servers or {}

        opts.servers.arduino_language_server = {
            cmd = {
                "arduino-language-server",
                "-cli-config",
                vim.fn.expand("$USERPROFILE") .. "\\AppData\\Local\\Arduino15\\arduino-cli.yaml",
                "-fqbn",
                "arduino:avr:uno",
                "-cli",
                "arduino-cli",
                "-clangd",
                "clangd",
            },
        }
    end,
    config = function(_, opts)
        local lspconfig = require("lspconfig")

        for server, server_opts in pairs(opts.servers or {}) do
            if
                not vim.tbl_contains(
                    vim.tbl_map(function(c)
                        return c.name
                    end, vim.lsp.get_active_clients()),
                    server
                )
            then
                lspconfig[server].setup(server_opts)
            end
        end
    end,
}
