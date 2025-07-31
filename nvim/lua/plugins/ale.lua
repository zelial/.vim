return { 'dense-analysis/ale',
ft = { 'ruby', 'python', 'lua', 'puppet'},
config = function()
local g = vim.g
g.ale_puppet_puppetlint_executable = '/Users/ales.zelinka/bin/puppet-lint'
g.ale_ruby_rubocop_auto_correct_all = 1
g.ale_python_flake8_options = "--config=$HOME/.config/flake8"
g.ale_virtualtext_cursor = 'disabled'
g.ale_linters = {
    python = {'flake8'},
    ruby = {'rubocop', 'ruby'},
    lua = {'lua_language_server'},
    puppet = {'puppetlint', 'puppet', 'languageserver'},
}
g.ale_fixers = {
    python = {'black', 'ruff'}
}
end
}
