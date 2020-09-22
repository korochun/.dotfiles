# Defined in - @ line 1
function ls --wraps='exa --icons --git -hgb' --description 'alias ls exa --icons --git -hgb'
  exa --icons --git -hgb $argv;
end
