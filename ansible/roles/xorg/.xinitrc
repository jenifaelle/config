#read X Resources
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

sh /home/alexandre/.screenlayout/default.sh

setxkbmap -layout us
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'

#start de trayer
trayer --edge top --align left --SetDockType true --SetPartialStrut true --expand true --widthtype pixel --width 260 --transparent true --tint 0x000000 --height 8 &

#various little setting
xset s off
xset s noblank
xset -dpms
xsetroot -cursor_name left_ptr -solid midnightblue

#set wallpaper
feh --bg-max ~/images/wallpaper/default.png

#automount helper
udiskie --tray --use-udisks2 &

#reduction lumiere bleu
redshift -l 46.80:-71.22 -m randr -t 5500:2700

#properly start xmonad, must be the last command, startx live and die with it
exec xmonad
