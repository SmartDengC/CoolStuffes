-- 修改lazyvim自带的有些插件的配置

-- if true then return {} end

return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
        },
      },
      window = {
        position = "left",
      },
    },
  },
}
