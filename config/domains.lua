local platform = require('utils.platform')

---@type Config
local options = {
   -- ref: https://wezfurlong.org/wezterm/config/lua/SshDomain.html
   ssh_domains = {
      -- yazi's image preview on Windows will only work if launched via ssh from WSL
      {
         name = 'wsl.ssh',
         remote_address = 'localhost',
         multiplexing = 'None',
         default_prog = { 'fish', '-l' },
         assume_shell = 'Posix',
      },
   },

   -- ref: https://wezfurlong.org/wezterm/multiplexing.html#unix-domains
   unix_domains = {},

   -- ref: https://wezfurlong.org/wezterm/config/lua/WslDomain.html
   wsl_domains = {},
}

if platform.is_win then
   options.ssh_domains = {
      {
         name = 'ssh:wsl',
         username = 'oomor',
         remote_address = 'localhost',
         multiplexing = 'None',
         default_prog = { '/usr/bin/env', 'zsh', '-l', '-c', 'exec /usr/bin/env zsh' },
         assume_shell = 'Posix',
      },
   }

   options.wsl_domains = {
      {
         name = 'wsl:ubuntu-zsh',
         distribution = 'Ubuntu',
         default_cwd = '/home/oomor',
         default_prog = { '/usr/bin/env', 'zsh', '-l', '-c', 'exec /usr/bin/env zsh' },
      },
   }
end

return options
