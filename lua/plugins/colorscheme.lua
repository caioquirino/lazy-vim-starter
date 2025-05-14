return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- Load early to prevent theme flashing
    opts = {
      flavour = "latte", -- Light flavour
      -- You can configure different flavours for light/dark if the theme supports it directly
      -- or we can switch themes entirely as shown below.
    },
  },
  {
    "f-person/auto-dark-mode.nvim",
    opts = {
      set_dark_mode = function()
        vim.cmd("set bg=" .. "dark")
        vim.cmd.colorscheme="catppuccin-frappe"
        -- vim.api.nvim_set_option_value("background", "dark", {})
        -- vim.api.nvim_set_option_value("colorscheme", "catppuccin-frappe", {})
      end,
      set_light_mode = function()
          -- vim.api.nvim_set_option_value("background", "light", {})
          -- vim.api.nvim_set_option_value("colorscheme", "catppuccin-latte", {})
        vim.cmd("set bg=" .. "light")
        vim.cmd.colorscheme="catppuccin-latte"
      end,
      update_interval = 3000,
      fallback = "dark"
    }
  }
}
