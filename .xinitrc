[[ -f ~/.xprofile ]] && source ~/.xprofile
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape' &2>/dev/null 

[[ -f ~/.fehbg ]] && ~/.fehbg &

systemctl start --user graphical-session.target

exec i3
