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
}
