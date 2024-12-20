# Workflow (Unix)

## Dependencies:

- nvim 0.8+
- fzf (for tmux-ses fuzzy)
- ripgrep (telescope)
- lazygit (TUI git client)
- optional external deps: git, make, unzip, gcc)

## Nice-To-Have tools:

- zsh (powerlevel10k, ohmyzsh, autocompletion plugin)
   `git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc`

  `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`

  `git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k`
  Open ~/.zshrc, find the line that sets ZSH_THEME, and change its value to "powerlevel10k/powerlevel10k"

  `https://gist.github.com/n1snt/454b879b8f0b7995740ae04c5fb5b7df` plugins (only zsh-autosuggestions does not make the the terminal too noisy)
- tmux (with .tmux config)
- tmux-sessionizer
- jq (json query)
- Other terminal emulator? ... kitty, wezterm

## Install:
- `git clone https://github.com/valenmarton/nvim ~/.config`
- `git clone https://github.com/valenmarton/tmux` -> .tmux into ~/.config/.tmux
  

### Related

- https://github.com/valenmarton/tmux
- Download app-image in case the snap binary is not working correctly with LSP servers: https://github.com/neovim/neovim/releases
