set -x fish_key_bindings fish_vi_key_bindings
set -x BROWSER firefox
set -gx PATH $PATH /home/jenifael/bin
set -gx PATH $PATH /home/jenifael/.roswell/bin
set -x FZF_DEFAULT_COMMAND 'rg --hidden -l ""'
set -x OPTELBRIDGE_DEPLOYER_GENERAL_PATH "/mnt/general/"
set -x GITLAB_TOKEN "SBT2qisBwHkzwXarZBDS"
set -x DJANGO_SETTINGS_MODULE optel_osm_application.settings.dev
set -x _JAVA_AWT_WM_NONREPARENTING 1

status --is-interactive; and source (pyenv init -|psub)
status --is-interactive; and source (pyenv virtualenv-init -|psub)
