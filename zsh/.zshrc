# Begin profiling
# zmodload zsh/zprof

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Vi mode
bindkey -v
bindkey "^R" history-incremental-search-backward

# Custom Aliases
alias new="ls -lAst |head"
alias hg="history | grep"

alias godo="cd ~/Documents"
alias godono="cd ~/Documents/notes"
alias godonoha="cd ~/Documents/notes/work/harness"

alias goco="cd ~/Code"
alias gs="fd -t f '.ya?ml|md$' -x grep slug {} |awk '{ print $2 }'"
alias tbpb="tmux show-buffer|pbcopy"

# Pass fzf result to nvim
fed() {
  local file
  file=$(fzf)
  if [ -n "$file" ]; then
    nvim "$file"
  fi
}


# alias ilog="instruqt track logs $(fd track.yml -x grep slug {}|awk '{ print $2 "-dev" }')"

boma() {
  case "$1" in
    set)
      if [ -n "$2" ]; then
        export "BOMA_$2=$PWD"
        echo "Bookmark '$2' set to $PWD"
      else
        echo "Please provide a name for the bookmark."
      fi
      ;;
    go)
      if [ -n "$2" ]; then
        local bookmark_var="BOMA_$2"
        if [ -n "${(P)bookmark_var}" ]; then
          cd "${(P)bookmark_var}" || echo "Failed to navigate to $2"
        else
          echo "Bookmark '$2' not found."
        fi
      else
        echo "Please provide a name for the bookmark."
      fi
      ;;
    list)
      env | grep '^BOMA_' | sed 's/^BOMA_//g' | while IFS='=' read -r name value; do
        echo "$name -> $value"
      done
      ;;
    *)
      echo "Usage: boma {set|go|list} bookmark_name"
      ;;
  esac
}


# Convenient shortcuts
bose() {
  boma set "$@"
}

bogo() {
  boma go "$@"
}

# Tell `less` to not paginate output that will fit in a single screen
export LESS="-F -X $LESS"

export PATH="/opt/homebrew/sbin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Starship @todo consider oh-my-zsh plugin
eval "$(starship init zsh)"

# tmux
export TMUX_CONFIG_FILE=~/.config/tmux.conf

# fzf @todo consider oh-my-zsh plugin (use with fd, ripgrep, sliver searcher?)
source <(fzf --zsh)

# End profiling
# zprof
