[[ -f ~/.xprofile ]] && source ~/.xprofile
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape' &2>/dev/null 

[[ -f ~/.fehbg ]] && ~/.fehbg &

case `uname` in
    "Linux")
        systemctl start --user graphical-session.target
        ;;
    "Darwin")
        # Nothing more needed, xQuartz starts handles of its stuff on its own
        # Something needs to continue to run though, so sleep for over a hundred years
        exec sleep 2147483647
        ;;
esac

exec i3
