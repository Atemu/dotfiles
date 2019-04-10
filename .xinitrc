[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape' &2>/dev/null 

#Set repeat delay
xset r rate 224 24

[[ -f ~/.fehbg ]] && ~/.fehbg &
sxhkd &
exec bspwm
