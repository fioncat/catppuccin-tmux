#!/usr/bin/env bash

# NOTE: you can use vars with $<var> and ${<var>} as long as the str is double quoted: ""
# WARNING: hex colors can't contain capital letters

# --> Catppuccin (Mocha)
thm_bg="#1e1e2e"
thm_fg="#cdd6f4"
thm_cyan="#89dceb"
thm_black="#181825"
thm_gray="#313244"
thm_magenta="#cba6f7"
thm_pink="#f5c2e7"
thm_red="#f38ba8"
thm_green="#a6e3a1"
thm_yellow="#f9e2af"
thm_blue="#89b4fa"
thm_orange="#fab387"
thm_black4="#585b70"

thm_dark="#1a1826"
thm_gray2="#626262"

# ----------------------------=== Theme ===--------------------------

# utils
set() {
	local option=$1
	local value=$2
	tmux set-option -gq "$option" "$value"
}

setw() {
	local option=$1
	local value=$2
	tmux set-window-option -gq "$option" "$value"
}

# status
set status "on"
set status-bg "${thm_gray}"
set status-justify "left"
set status-left-length "100"
set status-right-length "100"

# messages
set message-style "fg=${thm_cyan},bg=${thm_gray},align=centre"
set message-command-style "fg=${thm_cyan},bg=${thm_gray},align=centre"

# panes
set pane-border-style "fg=${thm_blue}"
set pane-active-border-style "fg=${thm_blue}"

# windows
setw window-status-activity-style "fg=${thm_fg},bg=${thm_bg},none"
setw window-status-separator ""
setw window-status-style "fg=${thm_fg},bg=${thm_bg},none"

# --------=== Statusline

# network_status="#[fg=$thm_blue,bg=$thm_black]  ↓ #{download_speed} ↑ #{upload_speed}"
cpu_status="#[fg=${cpu_fg_color},bg=${cpu_bg_color}]  #{cpu_icon} #{cpu_percentage} |"
ram_status="#[fg=${ram_fg_color},bg=${ram_bg_color}]  #{ram_icon} #{ram_percentage}"
time_status="#[fg=$thm_fg,bg=$thm_black]  %m-%d %H:%M"

space="#[fg=$thm_fg,bg=$thm_black] "
tmux_status="#{?client_prefix,#[bg=$thm_red],#[bg=$thm_black]}#{?client_prefix,#[fg=$thm_gray],#[fg=$thm_fg]}  #[fg=$thm_fg,bg=$thm_black] #S ${space}${space}"

set status-left "${tmux_status}  "
set status-right "${network_status} ${cpu_status} ${ram_status} ${time_status}"

# current_dir
setw window-status-format "#[fg=$thm_cyan,bg=$thm_gray]  #I #[fg=$thm_fg,bg=$thm_gray]#W  "
setw window-status-current-format "#[fg=$thm_pink,bg=$thm_bg]  #I #W  "

# parent_dir/current_dir
# setw window-status-format "#[fg=colour232,bg=colour111] #I #[fg=colour222,bg=colour235] #(echo '#{pane_current_path}' | rev | cut -d'/' -f-2 | rev) "
# setw window-status-current-format "#[fg=colour232,bg=colour208] #I #[fg=colour255,bg=colour237] #(echo '#{pane_current_path}' | rev | cut -d'/' -f-2 | rev) "

# --------=== Modes
setw clock-mode-colour "${thm_blue}"
setw mode-style "fg=${thm_pink} bg=${thm_black4} bold"
