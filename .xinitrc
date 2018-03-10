[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
sxhkd &
exec bspwm
