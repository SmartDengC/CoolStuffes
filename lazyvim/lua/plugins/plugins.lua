-- 修改lazyvim自带的有些插件的配置

-- if true then return {} end

return {
  -- 目录树
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
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

  -- 统领快捷键， lintao
  {
    "LintaoAmons/easy-commands.nvim",
    event = "VeryLazy",
    opts = {},
    -- use tag option to stay stable. This plugin is continues updating and adding more commands into it, pin to a tag should keep you stay where you are comfortable with.
    -- tag = "v0.8.0"
  }
}
