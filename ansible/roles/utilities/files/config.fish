set -x fish_key_bindings fish_vi_key_bindings
set -x BROWSER firefox
set -gx PATH $PATH /home/jenifael/bin
set -x FZF_DEFAULT_COMMAND 'rg --hidden -l ""'
set -x OPTELBRIDGE_DEPLOYER_GENERAL_PATH "/mnt/general/"

status --is-interactive; and source (pyenv init -|psub)
status --is-interactive; and source (pyenv virtualenv-init -|psub)
