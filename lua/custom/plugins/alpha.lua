return {
  'goolord/alpha-nvim',
  event = 'VimEnter',
  config = function()
    local alpha = require 'alpha' -- Load alpha
    local dashboard = require 'alpha.themes.dashboard' -- Load the dashboard theme

    local journal_file = vim.fn.expand '~/Desktop/Journal_2025/' .. os.date '%Y-%m-%d' .. '.txt'
    -- Ensure the journal directory exists
    local journal_dir = vim.fn.fnamemodify(journal_file, ':h')
    if vim.fn.isdirectory(journal_dir) == 0 then
      vim.fn.mkdir(journal_dir, 'p')
    end

    dashboard.section.header.val = {
      [[ .-----------------. .----------------.  .----------------.  .----------------.  .----------------.  .----------------. ]],
      [[| .--------------. || .--------------. || .--------------. || .--------------. || .--------------. || .--------------. |]],
      [[| | ____  _____  | || |  _________   | || |     ____     | || | ____   ____  | || |     _____    | || | ____    ____ | |]],
      [[| ||_   \|_   _| | || | |_   ___  |  | || |   .'    `.   | || ||_  _| |_  _| | || |    |_   _|   | || ||_   \  /   _|| |]],
      [[| |  |   \ | |   | || |   | |_  \_|  | || |  /  .--.  \  | || |  \ \   / /   | || |      | |     | || |  |   \/   |  | |]],
      [[| |  | |\ \| |   | || |   |  _|  _   | || |  | |    | |  | || |   \ \ / /    | || |      | |     | || |  | |\  /| |  | |]],
      [[| | _| |_\   |_  | || |  _| |___/ |  | || |  \  `--'  /  | || |    \ ' /     | || |     _| |_    | || | _| |_\/_| |_ | |]],
      [[| ||_____|\____| | || | |_________|  | || |   `.____.'   | || |     \_/      | || |    |_____|   | || ||_____||_____|| |]],
      [[| |              | || |              | || |              | || |              | || |              | || |              | |]],
      [[| '--------------' || '--------------' || '--------------' || '--------------' || '--------------' || '--------------' |]],
      [[ '----------------'  '----------------'  '----------------'  '----------------'  '----------------'  '----------------' ]],
    }

    dashboard.section.buttons.val = {
      dashboard.button('f', '📁  Find file', ':Telescope find_files<CR>'),
      dashboard.button('e', '✏️   New file', ':ene <BAR> startinsert <CR>'),
      dashboard.button('r', '🔄  Recent files', ':Telescope oldfiles<CR>'),
      dashboard.button('s', '⚙️   Settings', ':e $MYVIMRC<CR>'),
      dashboard.button('q', '❌  Quit', ':qa<CR>'),
      dashboard.button('j', '📔 Open Journal', string.format(':lua vim.cmd("edit %s")<CR>', journal_file)),
    }

    alpha.setup(dashboard.opts) -- Correctly call setup

    -- Disable folding for Alpha
    vim.cmd [[autocmd FileType alpha setlocal nofoldenable]]
  end,
}
