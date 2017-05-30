set -x fish_key_bindings fish_vi_key_bindings
set -x BROWSER chromium
function fish_prompt
    ~/git/powerline-shell/powerline-shell.py $status --shell bare ^/dev/null
end
