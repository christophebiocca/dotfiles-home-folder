# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000
setopt appendhistory
setopt nullglob
setopt interactivecomments
unsetopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install

# Fix the shortcuts.
bindkey "\e[1~" beginning-of-line # Home
bindkey "\e[4~" end-of-line # End
bindkey "\e[5~" beginning-of-history # PageUp
bindkey "\e[6~" end-of-history # PageDown
bindkey "\e[2~" quoted-insert # Ins
bindkey "\e[3~" delete-char # Del
bindkey "\e[5C" forward-word
bindkey "\eOc" emacs-forward-word
bindkey "\e[5D" backward-word
bindkey "\eOd" emacs-backward-word
bindkey "\e\e[C" forward-word
bindkey "\e\e[D" backward-word
bindkey "\e[Z" reverse-menu-complete # Shift+Tab
# for rxvt
bindkey "\e[7~" beginning-of-line # Home
bindkey "\e[8~" end-of-line # End
# for non RH/Debian xterm, can't hurt for RH/Debian xterm
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line
# for freebsd console
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line
# for guake
bindkey "\eOF" end-of-line
bindkey "\eOH" beginning-of-line
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
bindkey "\e[3~" delete-char # Del

# Set a useful prompt
autoload -U promptinit
promptinit
prompt walters

# The following lines were added by compinstall
zstyle :compinstall filename '/home/christophe/.zshrc'

autoload -U compinit
compinit
# End of lines added by compinstall
autoload bashcompinit
bashcompinit

# Load RVM function
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 
[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion

# Add user bin.
PATH=$HOME/bin:$PATH:$HOME/adt/sdk/platform-tools/

export ANDROID_HOME=$HOME/adt/sdk/

export EDITOR=vim
export VISUAL=vim

if [[ -d '/usr/lib/node_modules/' ]]; then
    export NODE_PATH=/usr/lib/node_modules/
fi

if [[ -d '/usr/local/lib/node_modules/' ]]; then
    export NODE_PATH=/usr/local/lib/node_modules/
fi

if type npm > /dev/null 2>&1; then
    NODE_BIN=`npm bin -g 2> /dev/null`
    if ! echo $PATH | grep -Eq "(^|:)${NODE_BIN}($|:)" ; then
        PATH=$PATH:$NODE_BIN
    fi
fi

[[ -f "$HOME/.aws_credentials" ]] && source "$HOME/.aws_credentials"
[[ -f "$HOME/.google_api_credentials" ]] && source "$HOME/.google_api_credentials"

[[ -f /usr/share/doc/pkgfile/command-not-found.zsh ]] && source /usr/share/doc/pkgfile/command-not-found.zsh

if type dircolors > /dev/null 2>&1 ; then
    # Linux
    eval $(dircolors)
    alias ls='ls --color=auto'
else
    # OSX
    export CLICOLOR=YES
fi

alias grep='grep --color=auto'

man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}

true
