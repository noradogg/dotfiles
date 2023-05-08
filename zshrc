
#   ███████╗███████╗██╗  ██╗██████╗  ██████╗
#   ╚══███╔╝██╔════╝██║  ██║██╔══██╗██╔════╝
#     ███╔╝ ███████╗███████║██████╔╝██║     
#    ███╔╝  ╚════██║██╔══██║██╔══██╗██║     
#   ███████╗███████║██║  ██║██║  ██║╚██████╗
#   ╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝


# >>> zsh prompt (arm64 or x86_64) ##
# ARCH=`uname -m`
# USER=`whoami`
# if [[ $ARCH == 'arm64' ]]; then
#    PROMPT="%m:$USER%~[a] \$ "
# else
#    PROMPT="%m:$USER%~[x] \$ "
# fi
# <<< zsh prompt ##

# >>> prompt custom >>>
# PROMPT="%B%{[38;5;244m%}[MacbookProKun]%{[0m%}%b:%F{027}%B%c%b%f %# "
# Zshのパラメータを使ったバージョン
PROMPT="%B%F{244}[%m]%f:%F{027}%c%f %# %b"
RPROMPT=""
# <<< prompt custom <<<


# >>> aliases
# Aliases only MacOS
if [ "$(uname)"=='Darwin' ]; then
    # man
    alias eman='env LANG=C man'
    alias man='env LANG=ja_JP.UTF-8 man'

    # alert
    alias bell='afplay /System/Library/Sounds/Hero.aiff'
    _alert() {
      if [ $# != 0 ]; then
        COMMAND=\'display\ dialog\ \"$@\"\'
      else
        COMMAND=\'display\ dialog\ \"Hello!!\ \ I\ was\ called!\"\'
      fi
      echo -e $COMMAND | xargs osascript -e
    }
    alias alert=_alert

    # java commands
    if [ "$(uname)"=='Darwin' ]; then
        alias javac='javac -J-Dfile.encoding=UTF-8 -d .'
        alias java='java -Dfile.encoding=UTF-8'
    fi

    # Other
    alias chrome="open -a 'Google Chrome'"

    if type trash > /dev/null 2>&1; then
        alias rm='trash -F'
    else
        echo "Command trash is not existiong."
        echo "Please install trash."
        echo "ex) 'brew install trash'"
        echo ""
    fi
fi

# python command
alias python="python3"

# shortcut command
alias starwars='telnet towel.blinkenlights.nl'
alias l='ls'
alias ll='ls -alF'
alias la='ls -A'
alias mkdir='mkdir -v'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias dbuild='docker-compose build'
alias dupd='docker-compose up -d'
alias dexec='(){docker-compose exec $1 bash}'
alias ddown='docker-compose down'

alias dotfiles='cd ~/GitHub/dotfiles/'

alias q='exit'

alias sed='gsed'
alias dir='tree -L 1'

case ${OSTYPE} in
    linux-gnu )
        alias pbcopy='xsel --clipboard --input'
        alias pbpaste='xsel --clipboard --output'
        ;;
esac

# alias mkdircd='(){mkdir $1 -p; cd $1}'
function mkdircd () { mkdir -p "$@" && eval cd "\"\$$#\""; }

# <<< alias


# かっこ補完
setopt auto_param_keys
# 音
setopt no_beep


## Welcome ##
echo ""
echo "██╗    ██╗███████╗██╗      ██████╗ ██████╗ ███╗   ███╗███████╗"
echo "██║    ██║██╔════╝██║     ██╔════╝██╔═══██╗████╗ ████║██╔════╝"
echo "██║ █╗ ██║█████╗  ██║     ██║     ██║   ██║██╔████╔██║█████╗  "
echo "██║███╗██║██╔══╝  ██║     ██║     ██║   ██║██║╚██╔╝██║██╔══╝  "
echo "╚███╔███╔╝███████╗███████╗╚██████╗╚██████╔╝██║ ╚═╝ ██║███████╗"
echo " ╚══╝╚══╝ ╚══════╝╚══════╝ ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝"
echo ""

## neofetch ##
if [ -f /opt/homebrew/bin/neofetch ]; then
    /opt/homebrew/bin/neofetch
fi


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
