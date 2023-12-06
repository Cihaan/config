-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

function run_main_file_depending_on_file_extension()
  local extension = vim.fn.expand("%:e")
  local cwd = vim.fn.getcwd()
  local command = ""

  if extension == "go" then
    command = "go run " .. cwd .. "/main.go"
  elseif extension == "rs" then
    command = "cargo run " .. cwd .. "/main.rs"
  end

  -- Run the command in a terminal
  vim.cmd("terminal " .. command)
end

function run_current_file_depending_on_file_extension()
  local extension = vim.fn.expand("%:e")
  local cwd = vim.fn.getcwd()
  local command = ""

  if extension == "go" then
    command = "go run " .. vim.fn.expand("%")
  elseif extension == "rs" then
    command = "cargo run " .. vim.fn.expand("%")
  end

  -- Run the command in a terminal
  vim.cmd("terminal " .. command)
end

vim.keymap.set(
  "n",
  "<leader>rg",
  run_main_file_depending_on_file_extension,
  { noremap = true, silent = true, desc = "Run main.go file" }
)
vim.keymap.set(
  "n",
  "<leader>rcg",
  run_current_file_depending_on_file_extension,
  { noremap = true, silent = true, desc = "Run current go file" }
)
vim.keymap.set(
  "n",
  "<leader>rr",
  run_current_file_depending_on_file_extension,
  { noremap = true, silent = true, desc = "Run current file" }
)
