-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
--

local keymap = vim.keymap

local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  -- 如果存在懒按键处理器就不要创建按键映射？
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- 删除存在的快捷键
vim.keymap.del("n", "<leader>ww", {})
vim.keymap.del("n", "<leader>qq", {})

-- 模式 快捷键 映射的功能
map("n", "<leader>ww", "<Esc>:w<cr>", { desc = "Save File" })
map("n", "<leader>qq", "<Esc>:q<cr>", { desc = "Quit File" })

map("i", "<leader>w", "<Esc>:w<cr>", { desc = "Save File" })
map("i", "<leader>q", "<Esc>:q<cr>", { desc = "Quit File" })

local command_keymappings = {
  ["Scratch"] = "<C-M-n>",
  ["RunCurrentBuffer"] = "<M-C-o>",
}

local function contains(str, char)
  for i = 1, #str do
    if str:sub(i, i) == char then
      return true
    end
  end
  return false
end

for command, keybinding in pairs(command_keymappings) do
  if type(keybinding) == "string" then
    vim.keymap.set("n", keybinding, "<CMD>" .. command .. "<CR>", {})
    goto continue
  end

  if contains(keybinding.mode, "v") then
    vim.keymap.set("v", keybinding.keys, "<CMD>" .. command .. "<CR>", {})
  end

  if contains(keybinding.mode, "n") then
    vim.keymap.set("n", keybinding.keys, "<CMD>" .. command .. "<CR>", {})
  end

  if contains(keybinding.mode, "i") then
    vim.keymap.set("i", keybinding.keys, "<CMD>" .. command .. "<CR>", {})
  end

  ::continue::
end
vim.keymap.set("n", "<leader>wo", "<c-w>o", { desc = "Maximize window" })

-- 映射快捷键：leader + se to :e %:h
map("n", "<leader>se", "<Esc>:e %:h<cr>", { desc = "show directory current file" })
