-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Define your preferred light and dark themes (ensure these are correct)



-- local light_theme = "catppuccin-latte" -- Or your chosen light theme
-- local dark_theme = "catppuccin-mocha" -- Or your chosen dark theme

-- -- Function to apply the correct theme
-- local function apply_theme()
--   if vim.o.background == "light" then
--     vim.cmd("colorscheme " .. light_theme)
--   else
--     vim.cmd("colorscheme " .. dark_theme)
--   end
--   -- Optional: Add transparency settings here if needed
-- end

-- -- Autocommand to change the theme when 'background' option is set
-- vim.api.nvim_create_autocmd("OptionSet", {
--   pattern = "background",
--   group = vim.api.nvim_create_augroup("ThemeSwitcherBackgroundChanged", { clear = true }),
--   callback = function()
--     vim.schedule(apply_theme)
--   end,
-- })

-- -- MODIFIED Function to check macOS theme using AppleScript and set Neovim's background
-- local function sync_neovim_background_with_macos()
--   local apple_script_cmd =
--     [[/usr/bin/osascript -e 'tell application "System Events" to tell appearance preferences to get dark mode']]

--   vim.system(
--     { apple_script_cmd },
--     { text = true },
--     vim.schedule_wrap(function(obj)
--       -- obj contains:
--       -- obj.stdout: Standard output ("true\n" for dark, "false\n" for light)
--       -- obj.stderr: Standard error
--       -- obj.code: Exit code (should be 0 if osascript runs)

--       local current_macos_mode = "light" -- Default to light

--       -- If osascript ran successfully and stdout contains "true"
--       if obj.code == 0 and obj.stdout and obj.stdout:match("true") then
--         current_macos_mode = "dark"
--       end

--       if vim.o.background ~= current_macos_mode then
--         vim.o.background = current_macos_mode -- This will trigger the OptionSet autocmd
--       else
--         apply_theme() -- Ensure theme is correct
--       end
--     end)
--   )
-- end

-- -- Set the theme on Neovim startup
-- vim.api.nvim_create_autocmd("VimEnter", {
--   pattern = "*",
--   group = vim.api.nvim_create_augroup("ThemeSwitcherVimEnter", { clear = true }),
--   once = true,
--   callback = function()
--     sync_neovim_background_with_macos()
--   end,
-- })

-- -- Optional: Re-check when Neovim gains focus
-- vim.api.nvim_create_autocmd("FocusGained", {
--   pattern = "*",
--   group = vim.api.nvim_create_augroup("ThemeSwitcherFocusGained", { clear = true }),
--   callback = function()
--     sync_neovim_background_with_macos()
--   end,
-- })
