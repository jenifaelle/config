set -x fish_key_bindings fish_vi_key_bindings
set -x BROWSER firefox
set -gx PATH $PATH /home/jenifael/bin
set -gx PATH $PATH /home/jenifael/.roswell/bin
set -gx PATH $PATH /home/jenifael/.cargo/bin
set -x FZF_DEFAULT_COMMAND 'rg --hidden -l ""'
set -x GITLAB_TOKEN "SBT2qisBwHkzwXarZBDS"
set -x DJANGO_SETTINGS_MODULE optel_osm_application.settings.dev
set -x _JAVA_AWT_WM_NONREPARENTING 1
set -x TERM screen-256color

set -x OPTELBRIDGE_DEPLOYER_GENERAL_PATH "/mnt/general/"
set -x OPTELBRIDGE_HOME "/opt/optelbridge"
set -x BRIDGE_LOGS_PATH "/var/log/optelbridge"
set -x BRIDGE_SERIAL_BACKUP_LOCATION "/opt/optelbridge"

set -x SSH_AUTH_SOCK /run/user/1000/ssh-agent.socket
status --is-interactive; and source (rbenv init -|psub)

pyenv init --path | source
pyenv init - | source
