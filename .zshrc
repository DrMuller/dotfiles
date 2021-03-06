# Path to your oh-my-zsh installation.
export ZSH=/Users/${USER}/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="crunch"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git bundler brews docker encode64 gem jira python rails rvm tmux aws)


export PATH="${PATH}:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/${USER}/.rvm/bin"

source $ZSH/oh-my-zsh.sh
source '/opt/homebrew-cask/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/opt/homebrew-cask/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
source '/usr/local/lib/node_modules/gulp.plugin.zsh'

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export EDITOR='emacs'

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Aliases
alias zshconfig="${EDITOR} ~/.zshrc"
alias ohmyzsh="${EDITOR} ~/.oh-my-zsh"
alias emacsconfig="${EDITOR} ~/.emacs"

alias SVC_apache_start="launchctl load -w /Users/${USER}/Library/LaunchAgents/homebrew.mxcl.httpd22.plist"
alias SVC_apache_stop="launchctl unload -w /Users/${USER}/Library/LaunchAgents/homebrew.mxcl.httpd22.plist"
alias SVC_mysql_start="launchctl load -w /Users/${USER}/Library/LaunchAgents/homebrew.mxcl.mysql.plist"
alias SVC_mysql_stop="launchctl unload -w /Users/${USER}/Library/LaunchAgents/homebrew.mxcl.mysql.plist"
alias SVC_postgres_start="launchctl load -w /Users/${USER}/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
alias SVC_postgres_stop="launchctl unload -w /Users/${USER}/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
alias SVC_nginx_start="launchctl load -w /Users/${USER}/Library/LaunchAgents/homebrew.mxcl.nginx.plist"
alias SVC_nginx_stop="launchctl unload -w /Users/${USER}/Library/LaunchAgents/homebrew.mxcl.nginx.plist"
alias SVC_stopall="SVC_apache_stop && SVC_mysql_stop && SVC_postgres_stop && SVC_nginx_stop"
alias SVC_startall="SVC_apache_start && SVC_mysql_start && SVC_postgres_start && SVC_nginx_start"


source /Users/${USER}/.gulp.plugin.zsh/gulp.plugin.zsh


# Add the following to your shell init to set up gpg-agent automatically for every shell
if [ -f ~/.gnupg/.gpg-agent-info ] && [ -n "$(pgrep gpg-agent)" ]; then
    source ~/.gnupg/.gpg-agent-info
    export GPG_AGENT_INFO
else
    eval $(gpg-agent --daemon --write-env-file ~/.gnupg/.gpg-agent-info)
fi
