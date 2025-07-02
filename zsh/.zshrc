# Initialize Starship prompt before oh-my-zsh
eval "$(starship init zsh)"

# Oh My Zsh setup
export ZSH="$HOME/.oh-my-zsh"
plugins=(git)
source $ZSH/oh-my-zsh.sh
