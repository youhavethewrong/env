# ~/.bashrc: executed by bash(1) for non-login shells.

PS1='(\A)[\u:\h] \w $ '

# Clear existing broken ssh-agent environment
#
if [ ! -f "${SSH_AUTH_SOCK}" ] ; then
  export SSH_AUTH_SOCK=""
fi

# if ssh auth forwarding is enabled, use it and dont start keychain
if [ "${SSH_AUTH_SOCK}x" == "x" ]; then
  if [ -x /usr/bin/keychain ] ; then
    keychain -q id_ed25519 id_rsa
    if [ -f ~/.keychain/$HOSTNAME-sh ] ; then
      source ~/.keychain/$HOSTNAME-sh
    fi
  fi
fi

# If we have ssh-agent running, forward it to the next host,
# otherwise dont try to use key authentication at all.
if [ "${SSH_AUTH_SOCK}x" == "x" ]; then
  # if we dont have an auth sock, dont use pub key identification
  alias ssh='ssh -o PubkeyAuthentication=no'
else
  # We do have an auth sock, use auth forwarding
  alias ssh='ssh -A'
fi

alias ll='ls -l'
alias la='ls -A'
alias ls='ls -F'
alias f='fortune'
alias ssh='ssh -o VisualHostKey=yes'
alias lll='xscreensaver-command -lock'
alias mci='mvn clean install'
alias mdt='mvn dependency:tree'
alias mve='mvn eclipse:eclipse'
alias mvddu='mvn versions:display-dependency-updates'
alias jsearch='grep -inr --color --include=*.java --include=*.groovy'
alias clojure='rlwrap java -jar $HOME/apps/clojure/clojure-1.6.0.jar'
alias ff='/usr/bin/firefox'

umask 022

export EDITOR=emacs
export M2_HOME=/usr/local/maven
export M2=$M2_HOME/bin
export JAVA_HOME=/usr/local/jdk
export ANDROID_HOME=/home/negated/apps/android-sdk-linux
export PATH=$JAVA_HOME/jre/bin:$PATH:$HOME/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$M2:~/apps/android-studio/bin:$HOME/apps/bin
export USE_CCACHE=1
export HIST_SIZE=10000
export IFS=$'\n\t'