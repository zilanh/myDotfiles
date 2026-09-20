alias logout="loginctl kill-user leo"
alias pacs="sudo pacman -S"
alias pacq="pacman -Q"
alias config="nvim .config"
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
alias v='nvim'
alias vpn="sudo wg-quick"
alias cd="z"
alias ff='fastfetch'

autoload -Uz compinit promptinit
compinit
promptinit

bindkey -v # Vim keybindings

# Open directory in terminal when quitting yazi 
function y() {
	local tmp cwd; tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd" || builtin true
	command rm -f -- "$tmp"
}

# Change cursor shape based on Vi mode
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]]; then
    print -n '\e[2 q'  # Block cursor (note the space before q)
  else
    print -n '\e[6 q'  # Line cursor
  fi
}
zle -N zle-keymap-select

# Ensure cursor turns into a line when Zsh starts up a new line
function zle-line-init {
  zle -K viins         # Explicitly force insert mode
  print -n '\e[6 q'    # Line cursor
}
zle -N zle-line-init

# Reset cursor back to a line whenever a command finishes running
function _reset_cursor_shape {
  print -n '\e[6 q'
}
precmd_functions+=(_reset_cursor_shape)

eval "$(atuin init zsh --disable-up-arrow)"
eval "$(zoxide init zsh)"
# eval "$(thefuck --alias)"
