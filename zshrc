# .zshrc
# ESC 2021.03.24

# sick prompt yo
PROMPT='[%F{cyan}%n%f@%F{green}%m%f] (λ %3~) ⇒ %F{yellow};%f '

# aliases
alias ls='ls -F'
alias f='fortune'
alias ssh='ssh -o VisualHostKey=yes'
alias lll='xscreensaver-command -lock'
alias mci='mvn clean install'
alias mdt='mvn dependency:tree'
alias mee='mvn eclipse:eclipse'
alias mvddu='mvn versions:display-dependency-updates'

export PATH="$PATH:/sbin:/usr/sbin:$HOME/bin:$HOME/.cargo/bin"
export JAVA_HOME="/usr/local/opt/openjdk@11/"
export PATH="/usr/local/opt/postgresql@10/bin:/usr/local/opt/openjdk@11/bin:/usr/local/opt/ruby/bin:/usr/local/opt/llvm/bin:/Applications/Octave-6.2.0.app/Contents/Resources/usr/bin:$PATH"
[ -s "/usr/local/bin/keychain" ] && eval `keychain --eval id_ed25519`
