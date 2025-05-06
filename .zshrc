# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

### Added by Zinit's installer
if [[ ! -f ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh ]]; then
  command git clone https://github.com/agkozak/zcomet.git ${ZDOTDIR:-${HOME}}/.zcomet/bin
fi

source ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh

zcomet load zsh-users/zsh-autosuggestions
zcomet load zsh-users/zsh-completions
zcomet load zsh-users/zsh-syntax-highlighting
zcomet load unixorn/fzf-zsh-plugin
zcomet load zpm-zsh/theme-neutral
zcomet load zpm-zsh/ls
zcomet load fdellwing/zsh-bat
zcomet load MichaelAquilina/zsh-you-should-use
zcomet load romkatv/powerlevel10k
zcomet load ajeetdsouza/zoxide

zcomet load ohmyzsh plugins/common-aliases
zcomet load ohmyzsh plugins/colorize
zcomet load ohmyzsh plugins/gnu-utils
zcomet load ohmyzsh plugins/sudo
zcomet load ohmyzsh plugins/zsh-interactive-cd
zcomet load ohmyzsh plugins/gitfast
zcomet load ohmyzsh plugins/dirhistory

zcomet compinit

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# If you come from bash you might have to change your $PATH.
source $HOME/.path

HYPHEN_INSENSITIVE="true"
HISTFILE="$HOME/.config/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000

setopt bang_hist              # Treat the '!' character specially during expansion.
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_all_dups   # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt share_history          # share command history data
setopt hash_list_all          # hash everything before completion
setopt completealiases        # complete alisases
setopt nocorrect              # spelling correction for commands
setopt list_ambiguous         # complete as much of a completion until it gets ambiguous.
setopt nolisttypes
setopt listpacked
setopt automenu
setopt auto_cd
unsetopt correct_all


export WORDCHARS='${WORDCHARS}:'
autoload -Uz select-word-style
select-word-style bash
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^H" backward-kill-word

zstyle ':completion:*:ssh:*' hosts off
zstyle ':completion:*:ssh:argument-1:*' tag-order hosts
zstyle ':completion:*:ssh:*:users' hidden true

alias zshconfig="vim ~/.zshrc"
alias zsh_reload="source $HOME/.zshrc"

eval "$(zoxide init zsh)"
fortune | cowsay
