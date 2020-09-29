# Defined in - @ line 1
function la --wraps='ls -A' --wraps='ls -a' --description 'alias la ls -a'
  ls -a $argv;
end
