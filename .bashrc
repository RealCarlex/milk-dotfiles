#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fastfetch='fastfetch --logo .config/fastfetch/milkchan-pixelart.png --logo-type kitty-direct --logo-width 25 --logo-height 14'
alias ls="eza --color --icons"
PS1='[\u@\h \W]\$ '

fastfetch --logo .config/fastfetch/milkchan-pixelart.png --logo-type kitty-direct --logo-width 15 --logo-height 8

# --- Cleanup Orphans ---
cleanup() {
    # Colors
    local RED='\033[1;31m'
    local NC='\033[0m' # No Color

    echo -e "${RED}==> Removing pacman orphans...${NC}"
    local orphans=$(pacman -Qtdq)
    if [ -n "$orphans" ]; then
        sudo pacman -Rns $orphans
    else
        echo "No orphans to remove."
    fi

    echo -e "\n${RED}==> Removing yay cache...${NC}"
    yay -Scc --noconfirm

    echo -e "\n${RED}Cleanup completed.${NC}"
}
