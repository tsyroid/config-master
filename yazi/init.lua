-- ~/.config/yazi/init.lua
-- <2025-02-11 Tue 07:53>

require('full-border'):setup()

-- show symlinks in file status bar
-- https://yazi-rs.github.io/docs/tips#symlink-in-status

Status:children_add(function(self)
  local h = self._current.hovered
  if h and h.link_to then
    return ' -> ' .. tostring(h.link_to)
  else
    return ''
  end
end, 3300, Status.LEFT)
