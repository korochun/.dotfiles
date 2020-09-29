# Defined in - @ line 1
function ls --wraps='exa --git --icons -hgb' --description 'alias ls exa --git --icons -hgb'
  exa --git --icons -hgb $argv;
end
