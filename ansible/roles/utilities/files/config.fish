set -x fish_key_bindings fish_vi_key_bindings
set -x BROWSER firefox
set -gx PATH $PATH /home/jenifael/bin
function fish_prompt
    ~/.config/fish/powerline-shell.py $status --shell bare ^/dev/null
end
