-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    filesystem = {
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },
    },
  },
  config = function()
    require('neo-tree').setup {
      enable_git_status = true,
      default_component_configs = {
        git_status = {
          symbols = {
            added = 'A', -- Added
            modified = 'M', -- Modified
            deleted = 'D', -- Deleted
            renamed = 'R', -- Renamed
            untracked = 'U', -- Untracked
            ignored = 'I', -- Ignored
            unstaged = 'US', -- Unstaged
            staged = 'S', -- Staged
            conflict = 'C', -- Conflict
          },
        },
      },
    }
  end,
}
