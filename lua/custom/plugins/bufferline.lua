return {
  'akinsho/bufferline.nvim',
  version = '*',
  config = function()
    require('bufferline').setup {
      options = {
        diagnostics = 'nvim_lsp', -- Enable LSP diagnostics in the bufferline
        separator_style = 'slant', -- Set the separator style between buffers
        show_buffer_close_icons = false, -- Disable buffer close icons
        show_close_icon = false, -- Disable main close icon
        always_show_bufferline = true, -- Always show bufferline, even with a single buffer

        -- Custom name formatter function to show relative paths when files have the same name
        name_formatter = function(buf)
          -- Get all listed buffers to check for files with the same name
          local buffers = vim.fn.getbufinfo { buflisted = 1 }
          local count = 0
          for _, buffer in pairs(buffers) do
            -- Compare file names
            if vim.fn.fnamemodify(buffer.name, ':t') == vim.fn.fnamemodify(buf.name, ':t') then
              count = count + 1
            end
          end

          -- If there are multiple files with the same name, show relative path
          if count > 1 then
            return vim.fn.fnamemodify(buf.name, ':~:.') -- Show relative path
          else
            return vim.fn.fnamemodify(buf.name, ':t') -- Show only the file name
          end
        end,
      },
    }
  end,
}
