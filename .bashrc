# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Functions
# timer by terdon
function countdown(){
   date1=$((`date +%s` + $1)); 
   while [ "$date1" -ge `date +%s` ]; do 
     echo -ne "$(date -u --date @$(($date1 - `date +%s`)) +%H:%M:%S)\r";
     sleep 0.1
   done
}
function stopwatch(){
  date1=`date +%s`; 
   while true; do 
    echo -ne "$(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)\r"; 
    sleep 0.1
   done
}
# Functions
# ls after every cd
cd() {
	    builtin cd "$@" && ls
    }
# make directory and move to it
mcd()
{
	test -d "$1" || mkdir "$1" && cd "$1"
}
# vim mode for the terminal
alias :q=exit
set -o vi
# Shortcuts
# shortcut to ssh into school computers
alias ug="ssh rkimpins@ug12.cs.ualberta.ca"
# Get to main files easier
# Jump to Links
alias vegan='vim ~/links/vegan.txt'
alias todo='vim ~/links/todo.txt'
alias movies='vim ~/links/movies.txt'
alias anime='vim ~/links/anime.txt'
alias manga='vim ~/links/manga.txt'
alias pmo='vim ~/links/pmo.txt'
alias biking='vim ~/links/biking.txt'
alias swing='vim ~/links/swing.txt'
alias quotes='vim ~/links/quotes.txt'
alias books='vim ~/links/books.txt'
alias highlights='vim ~/links/highlights.txt'
alias boardgames='vim ~/links/boardgames.txt'
alias cardgames='vim ~/links/cardgames.txt'
alias songs='vim ~/links/songs.txt'
alias positivity='vim ~/links/positivity.txt'
alias parenting='vim ~/links/parenting.txt'
alias friends='vim ~/links/friends.txt'
alias asl='vim ~/links/asl.txt'
alias goals='vim ~/links/goals.txt'
alias h='vim ~/links/h.txt'
alias sched='vim ~/links/upcoming_work_schedule.txt'
# Fast moving to links without always adding a command
alias ll='cd ~/links && vim'
# Fast moving to tutorials without adding commands
alias tt='cd ~/tt && vim'
#alias hnumbers='vim ~/links/hnumbers.txt'
alias mindfulness='vim ~/links/mindfulness.txt'
alias memories='vim ~/links/memories.txt'
alias chords='vim ~/links/guitar_chords.txt'
alias unicode='vim ~/links/unicode.txt'
# change directory to Lexar thumbdrive
alias usb='cd ~/../../media/randal/Lexar'
# Quickly get the weather
alias weather='finger edmonton@graph.no'
# Shortcut to backup everything
alias backup='~/scripts/backup.sh'
# Open Chromium
alias chrome='chromium-browser &'
# Open a pdf
alias open='xdg-open'
# Open task manager
alias tm='gnome-system-monitor'
# Open journal entry
alias journal='vim ~/journal/journal-$(date +%y-%m-%d).txt'
# g++ flags
alias cflag='-Wall -Wextra -Wconversion -O'
# change size
alias ss='resize -s 20 50'
alias sv='resize -s 65 104'
alias sm='resize -s 30 100' 
# update then upgrade
alias uu='sudo apt-get update; sudo apt-get upgrade'
# Download videos and mp3's
alias dmusic='youtube-dl -i --extract-audio --audio-format mp3'
alias dvideo='youtube-dl -i'
# transmission commands
alias transstop='sudo service transmission-daemon stop'
alias transstart='sudo service transmission-daemon start'
alias transreload='sudo service transmission-daemon reload'
# Remove and purge a program
alias remove='sudo apt-get --purge remove'
# Shortcuts for encfs encryption
alias openv='encfs ~/encrypted ~/decrypted'
alias closev='sudo umount -l ~/decrypted'
# Run unity
# Unity stuff
alias runity='cd ~ && Unity-2019.1.0f2/Editor/Unity'
alias unity='vim ~/links/unity.txt'
# Open pycharm
alias pycharm='./pycharm-professional-2019.2.1/pycharm-2019.2.1/bin/pycharm.sh'
# Quick file navigation
alias 281='cd ~/coding/281'
alias 379='cd ~/coding/379'
alias 397='cd ~/coding/397'
alias 340='cd ~/coding/340'
alias 366='cd ~/coding/366'
# Open navigator at current directory
alias fe='nautilus --browser .'
# Refresh the bashrc file
alias refresh='source ~/.bashrc'
# Run anaconda
alias anaconda='anaconda-navigator'
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/randal/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/randal/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/randal/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/randal/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

