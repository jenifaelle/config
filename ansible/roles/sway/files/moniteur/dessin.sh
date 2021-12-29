#!/usr/bin/bash
swaymsg 'output * disable'
swaymsg 'output DP-6 pos 0 1080 enable'
swaymsg 'output DP-5 pos 0 0 enable'
swaymsg 'output eDP-1 pos 1920 0 enable'
swaymsg 'input type:tablet_tool map_to_output "Unknown GT-133 "'
