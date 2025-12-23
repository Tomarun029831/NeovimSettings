-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- For Molten
vim.keymap.set("n", "<localleader>mi", ":MoltenInit<CR>", { silent = true, desc = "Initialize Molten" })

vim.keymap.set("n", "<localleader>mo", ":MoltenEvaluateOperator<CR>", { silent = true, desc = "Evaluate operator" })
vim.keymap.set("n", "<localleader>ml", ":MoltenEvaluateLine<CR>", { silent = true, desc = "Evaluate line" })
vim.keymap.set("n", "<localleader>mc", ":MoltenReevaluateCell<CR>", { silent = true, desc = "Re-evaluate cell" })

vim.keymap.set("n", "<localleader>ms", ":MoltenSave<CR>", { silent = true, desc = "Save Molten state" })
vim.keymap.set("n", "<localleader>mL", ":MoltenLoad<CR>", { silent = true, desc = "Load Molten state" })

vim.keymap.set(
    "v",
    "<localleader>mv",
    ":<C-u>MoltenEvaluateVisual<CR>gv",
    { silent = true, desc = "Evaluate visual selection" }
)
