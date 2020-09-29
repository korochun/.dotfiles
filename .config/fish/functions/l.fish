# Defined in - @ line 1
function l --wraps='ls -lAF' --wraps='ls -laF' --description 'alias l ls -laF'
  ls -laF $argv;
end
