[[ -f ~/.xprofile ]] && source ~/.xprofile
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape' &2>/dev/null 

#Set repeat delay
xset r rate 224 24

[[ -f ~/.fehbg ]] && ~/.fehbg &
sxhkd &
bspwm &
pid=$!
# Wait for bspwm to actually start
while true ; do [ -S /tmp/bspwm*-socket ] && break ; sleep 0.1 ; done

# Wait for emacs daemon for up to 100 * 0.1s = 10s and open a buffer
for i in {0..100}
do
    if [ -S /tmp/emacs$UID/server ] ; then
        emacsclient -c
        break
    else
        sleep 0.1
    fi
done

wait $pid
