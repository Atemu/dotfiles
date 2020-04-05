[[ -f ~/.xprofile ]] && source ~/.xprofile
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape' &2>/dev/null 

[[ -f ~/.fehbg ]] && ~/.fehbg &
i3 &
pid=$!
# Wait for bspwm to actually start
while true ; do [ -S /tmp/bspwm*-socket ] && break ; sleep 0.1 ; done

systemctl start --user graphical-session.target

wait $pid
