# Note: this file belongs to the root directory
# alternatively, a symlink can be used 

# source bash 
source $HOME/.bashrc

# path to oh my zsh
export ZSH="$HOME/.oh-my-zsh"

# theme
ZSH_THEME="avit"

# case sensitive completion
CASE_SENSITIVE="false"

# list of plugins
# other than git, plugins need to be installed externally
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

# source oh my zsh
source $ZSH/oh-my-zsh.sh

# run "ls" on directory change
function chpwd() {
    emulate -L zsh
    ls
}

# aliases
alias vi=nvim
alias vim=nvim
alias neovim=nvim
alias sudo=doas
alias clear="clear; macchina; ls"

# run macchina and show the home directory
macchina
ls
