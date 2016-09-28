#=================================================#
# 1.   Rebindings and Non-Hacky Customizations    #
#=================================================#

# use C-a instead og C-b
set -g prefix C-a
unbind C-b
bind C-a send-prefix

# Resizing
bind h resize-pane -L 10
bind j resize-pane -D 10
bind k resize-pane -U 10
bind l resize-pane -R 10
bind -n M-h resize-pane -L 5
bind -n M-j resize-pane -D 5
bind -n M-k resize-pane -U 5
bind -n M-l resize-pane -R 5


# Requires 1.9+
# bind \ split-window -h -c "#{pane_current_path}"
# bind - split-window -v -c "#{pane_current_path}"

set-option default-path "$PWD"
bind \ split-window -h
bind - split-window -v

# Requires 2.0+
# bind c new-window -c "#{pane_current_path}"

# Works on older versions
bind c new-window

# quick pane cycling
unbind ^A
bind ^A select-pane -t :.+

# Use vi keys for everything
set-window-option -g mode-keys vi
set-window-option -g utf8 on

# reload the config file with prefix+r
unbind r
bind r source-file ~/.tmux.conf \; display-message "Config reloaded..."

# REQUIRES v2.2
# set -g mouse on
# ELSE
set -g mouse-select-pane on
set -g mouse-resize-pane on
set -g mouse-select-window on

# self-explanatory
set -g history-limit 20000
set -g @shell_mode 'vi'
set -s escape-time 0


#=====================================================#
# 2.     Visual and UI Config (status bar below)      #
#=====================================================#

# Start window numbering at 1
set -g base-index 1

# Message colors
set-option -g message-bg black
set-option -g message-fg colour226

# border colours
set -g pane-border-fg colour236
set -g pane-active-border-fg colour245
set -g pane-active-border-bg default

# Window title to whatever whatever is running in it
set -g set-titles on
set -g set-titles-string '#T'


#========================#
# 3.     Status Bar      #
#========================#

set-option -g quiet on
set -g status-interval 15            # set update frequency (default 15 seconds)
set -g status-justify centre         # center window list for clarity
set-option -g status-position bottom # position the status bar at top of screen

# Don't bug me about stuff in other windows
setw -g monitor-activity off
set-window-option -g monitor-activity off
set -g visual-activity off
set-option -g visual-bell off

# set color for status bar
set-option -g status-bg colour232 #base02
set-option -g status-fg colour8

# default window title colors
set-window-option -g window-status-fg colour8
set-window-option -g window-status-bg colour232

# active window title colors
set-window-option -g window-status-current-attr bright
set-window-option -g window-status-current-fg colour11
set-window-option -g window-status-current-bg colour232

set -g status-left-length 100
set -g status-right-length 100
set -g status-left " %a, %b %d #(date -u  ')"
set -g status-right "%l:%M %p "


#===================#
# 4.    Hacks       #
#===================#
# best for last!

# Hack for easy copying
bind-key -t vi-copy 'v' begin-selection
bind y run-shell "tmux show-buffer | xclip -sel clip -i" \; display-message "Copied tmux buffer to system clipboard"
run-shell ~/.config/tmux-yank/yank.tmux

# Italiac terminal hack
# SEE: nerdyweekly.com/posts/enable-italic-text-vim-tmux-gnome-terminal/
set -g default-terminal "xterm-256color"

# smart pane switching with awareness of vim splits
bind -n C-h run "(tmux display-message -p '#{pane_current_command}' | grep -iq vim && tmux send-keys C-h) || tmux select-pane -L"
bind -n C-j run "(tmux display-message -p '#{pane_current_command}' | grep -iq vim && tmux send-keys C-j) || tmux select-pane -D"
bind -n C-k run "(tmux display-message -p '#{pane_current_command}' | grep -iq vim && tmux send-keys C-k) || tmux select-pane -U"
bind -n C-l run "(tmux display-message -p '#{pane_current_command}' | grep -iq vim && tmux send-keys C-l) || tmux select-pane -R"
bind -n C-\ run "(tmux display-message -p '#{pane_current_command}' | grep -iq vim && tmux send-keys 'C-\\') || tmux select-pane -l"

