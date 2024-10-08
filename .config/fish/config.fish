source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    pfetch
#end
alias ls='eza -ahl --icons --color=always --group-directories-first'  # long format
alias venstall='sh -c "$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)"' # Install Vencord
alias pacin='aura -S'
alias pacrm='aura -Rns'
alias aurin='aura -A'
alias edit-scx='command sudo vim /etc/default/scx && command sudo systemctl restart scx'
alias pacsrh="pacman -Slq | fzf --preview 'pacman -Si {}' --layout=reverse --bind 'enter:execute(pacman -Si {} | less)'"
alias pacview="pacman -Qq | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | less)'"
alias pacup='aura -Syu'
alias aurup='aura -Ayu'
alias aursrh='aura -As'
alias aurls='pacman -Qm'
alias spotx='bash <(curl -sSL https://spotx-official.github.io/run.sh)'
alias sudo='run0 --background=0'
alias cat='bat'
alias cpaste='paste-cachyos'
alias onbat='echo 0 | run0 --background=0 tee /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode'
alias onac='echo 1 | run0 --background=0 tee /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode'

# Customize tide more
#set --global tide_context_always_display 'true'
#set --global tide_context_hostname_parts '0'
set --global tide_git_icon ''
set --global async_prompt_functions fish_prompt

# Zellij
set -g ZELLIJ_AUTO_ATTACH true
#set -g ZELLIJ_AUTO_EXIT true

source /usr/share/doc/pkgfile/command-not-found.fish

eval "$(zoxide init fish)"
starship init fish | source
enable_transience

if status is-interactive
    eval (zellij setup --generate-auto-start fish | string collect)
end

