-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

-- vim.g.vimwiki_list = {
--   {
--     path = '~/Documents/Notes/',
--     syntax = 'markdown',
--     ext = '.md',
--   },
-- }
--
-- vim.g.vimwiki_ext2syntax = {
--   ['.md'] = 'markdown',
--   ['.markdown'] = 'markdown',
--   ['.mdown'] = 'markdown',
-- }
--
vim.g.copilot_assume_mapped = true
vim.opt_local.conceallevel = 2

vim.cmd 'set nowrap'

-- Example for configuring Neovim to load user-installed installed Lua rocks:
package.path = package.path .. ';' .. vim.fn.expand '$HOME' .. '/.luarocks/share/lua/5.1/?/init.lua;'
package.path = package.path .. ';' .. vim.fn.expand '$HOME' .. '/.luarocks/share/lua/5.1/?.lua;'

return {
  -- 'vimwiki/vimwiki',
  'github/copilot.vim',
  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
    },
  },
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    build = function()
      vim.fn['mkdp#util#install']()
    end,
  },
  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('alpha').setup(require('alpha.themes.startify').config)
    end,
  },
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  {
    'akinsho/bufferline.nvim',
    event = 'VeryLazy',
    keys = {
      { '<leader>bp', '<Cmd>BufferLineTogglePin<CR>',            desc = 'Toggle pin' },
      { '<leader>bP', '<Cmd>BufferLineGroupClose ungrouped<CR>', desc = 'Delete non-pinned buffers' },
      { '<leader>bo', '<Cmd>BufferLineCloseOthers<CR>',          desc = 'Delete other buffers' },
      { '<leader>br', '<Cmd>BufferLineCloseRight<CR>',           desc = 'Delete buffers to the right' },
      { '<leader>bl', '<Cmd>BufferLineCloseLeft<CR>',            desc = 'Delete buffers to the left' },
      { '<S-h>',      '<cmd>BufferLineCyclePrev<cr>',            desc = 'Prev buffer' },
      { '<S-l>',      '<cmd>BufferLineCycleNext<cr>',            desc = 'Next buffer' },
      { '[b',         '<cmd>BufferLineCyclePrev<cr>',            desc = 'Prev buffer' },
      { ']b',         '<cmd>BufferLineCycleNext<cr>',            desc = 'Next buffer' },
    },
  },
  {
    'kdheepak/lazygit.nvim',
    event = 'VeryLazy',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    keys = {
      { '<leader>gg', '<Cmd>LazyGit<CR>', desc = 'LazyGit' },
    },
  },
  {
    'nvimtools/none-ls.nvim',
    optional = true,
    opts = function(_, opts)
      local nls = require 'null-ls'
      opts.sources = opts.sources or {}
      table.insert(opts.sources, nls.builtins.formatting.black)
    end,
  },
  { 'echasnovski/mini.nvim', version = false },
  {
    'quarto-dev/quarto-nvim',
    'jmbuhr/otter.nvim',
  },
  {
    'benlubas/molten-nvim',
    version = '^1.0.0', -- use version <2.0.0 to avoid breaking changes
    build = ':UpdateRemotePlugins',
    ft = { 'python', 'markdown', 'quarto' },
    -- dependencies = { '3rd/image.nvim' },
    init = function()
      vim.g.molten_virt_text_output = true
      -- vim.g.molten_virt_lines_off_by_1 = true
      -- vim.g.molten_image_provider = 'image.nvim'
      vim.g.molten_auto_open_output = false
      vim.g.molten_wrap_output = false
      vim.g.molten_use_border_highlight = true
      vim.g.molten_output_win_style = 'minimal'
      vim.g.molten_virt_text_max_lines = 50
    end,
  },
  -- {
  --   '3rd/image.nvim',
  --   integrations = {
  --     markdown = {
  --       enabled = true,
  --       clear_in_insert_mode = false,
  --       download_remote_images = true,
  --       only_render_image_at_cursor = false,
  --       filetypes = { 'markdown', 'vimwiki' }, -- markdown extensions (ie. quarto) can go here
  --     },
  --   },
  --   opts = {
  --     backend = 'kitty', -- Kitty will provide the best experience, but you need a compatible terminal
  --     integrations = {}, -- do whatever you want with image.nvim's integrations
  --     max_width = 100, -- tweak to preference
  --     max_height = 12, -- ^
  --     max_height_window_percentage = math.huge, -- this is necessary for a good experience
  --     max_width_window_percentage = math.huge,
  --     window_overlap_clear_enabled = true,
  --     window_overlap_clear_ft_ignore = { 'cmp_menu', 'cmp_docs', '' },
  --   },
  --   version = '1.1.0',
  -- },
  {
    'Vimjas/vim-python-pep8-indent',
  },
  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        ['python'] = { 'black' },
      },
    },
  },
  {
    'nvim-telescope/telescope-file-browser.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
  },
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup {
        open_mapping = [[<c-/>]],
        direction = 'float',
      }
    end,
  },
  {
    'GCBallesteros/NotebookNavigator.nvim',
    keys = {
      {
        ']h',
        function()
          require('notebook-navigator').move_cell 'd'
        end,
      },
      {
        '[h',
        function()
          require('notebook-navigator').move_cell 'u'
        end,
      },
      { '<leader>X', "<cmd>lua require('notebook-navigator').run_cell()<cr>" },
      { '<leader>x', "<cmd>lua require('notebook-navigator').run_and_move()<cr>" },
    },
    dependencies = {
      'echasnovski/mini.comment',
      'hkupty/iron.nvim', -- repl provider
      'anuvyklack/hydra.nvim',
    },
    event = 'VeryLazy',
    config = function()
      local nn = require 'notebook-navigator'
      nn.setup {
        activate_hydra_keys = '<leader>h',
        cell_markers = {
          quarto = '```{python}',
          markdown = '```{python}',
        },
        repl_provider = 'molten',
      }
    end,
  },
  {
    'stevearc/aerial.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
  },
}
