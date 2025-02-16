local M = {}

M.config = function()

  -- vim.opt.relativenumber = false -- WARNING : slower line key repeat rate on enable
  lvim.colorscheme = "catppuccin" -- set to a custom theme
  lvim.builtin.time_based_themes = false -- set false to use your own configured theme

  if vim.fn.has "nvim-0.9" == 1 then
    vim.opt.mousescroll = { "ver:1", "hor:6" }
    vim.o.mousefocus = true
    vim.o.mousemoveevent = true
    vim.o.splitkeep = "screen"
  end

  lvim.builtin.lsp_lines = true
  vim.diagnostic.config { virtual_lines = false } -- i only want to use it explicitly ( by calling the toggle function)
  lvim.builtin.tmux_lualine = false
  if lvim.builtin.tmux_lualine then
    vim.opt.cmdheight = 0
    vim.opt.laststatus = 0
    vim.g.tpipeline_cursormoved = 1
    -- HACK: lualine hijacks the statusline, so we need to set it back to what we want
    vim.cmd [[ autocmd WinEnter,BufEnter,VimResized * setlocal laststatus=0 ]]
  end

  lvim.builtin.custom_web_devicons = false -- use nvim-web-devicons, not custom
  lvim.use_icons = true -- ERROR use devicons

  lvim.builtin.sell_your_soul_to_devil = { active = false, prada = false }
  lvim.lsp.document_highlight = false
  lvim.builtin.task_runner = "async_tasks"
  lvim.builtin.dap.active = true
  vim.g.instant_username = vim.env.USER
  lvim.builtin.global_statusline = false
  lvim.builtin.dressing.active = true
  lvim.builtin.fancy_wild_menu.active = true
  lvim.builtin.refactoring.active = true
  lvim.builtin.test_runner.runner = "neotest"
  lvim.format_on_save = {
    enabled = true,
    pattern = "*.rs",
    timeout = 2000,
    filter = require("lvim.lsp.utils").format_filter,
  }
  lvim.builtin.smooth_scroll = ""
  lvim.builtin.tree_provider = "neo-tree"
  lvim.builtin.noice.active = false
  lvim.builtin.go_programming.active = true
  lvim.builtin.python_programming.active = true
  lvim.builtin.web_programming.active = true
  lvim.builtin.rust_programming.active = true
  lvim.builtin.cpp_programming.active = false
  lvim.builtin.borderless_cmp = true
  lvim.builtin.colored_args = true
  lvim.builtin.inlay_hints.active = true
  lvim.reload_config_on_save = false -- NOTE: i don't like this
  lvim.builtin.mind.active = true
  -- require("lvim.lsp.manager").setup("prosemd_lsp", {})
  lvim.builtin.cheat = { active = true } -- enable/disable cheat.sh integration
  lvim.lsp.diagnostics.virtual_text = true -- remove this line if you want to see inline errors

  local continue = function() -- load vscode configuration on debug continue
    if vim.fn.filereadable('.vscode/launch.json') then
      require('dap.ext.vscode').load_launchjs()
    end
    require('dap').continue()
  end
  lvim.lsp.buffer_mappings.normal_mode["<leader>dc"] = { continue, "Start/Continue debug" }
end

return M
