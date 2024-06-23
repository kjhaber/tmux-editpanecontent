# tmux-editpanecontent

A [tmux](https://github.com/tmux/tmux/wiki) plugin to open current pane content
in new split

This tmux plugin captures current tmux pane content (including all scrollback
history) to temp file, then opens the temp file with $EDITOR in a new
horizontal split pane.  For me it's easier to work with my regular editor than
tmux's copy mode, which has different key bindings for selecting ranges of text.

This plugin sets `<prefix>e` (for "edit") as the keybinding.

Note: "Works on my machine" disclaimer.  I've only tested this on my Mac with
my neovim setup ([dotfiles](https://github.com/kjhaber/dotfiles)), and that
only barely.

## Usage

Intended for use via [tpm](https://github.com/tmux-plugins/tpm) (Tmux Plugin
Manager).  Add the following line to your tmux.conf along with your other tpm
plugins:

```
set -g @plugin 'kjhaber/tmux-editpanecontent'
```

## License

[MIT](https://github.com/kjhaber/tmux-editpanecontent/LICENSE)

