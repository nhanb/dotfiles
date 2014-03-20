# ~~Installation~~ Bootstrapping  
*(because it sounds hipper, duh!)*

```bash
git clone https://github.com/nhanb/dotfiles.git ~/dotfiles
~/dotfiles/bootstrap/install.sh
```

The **install.sh** script will symlink all files/dirs whose names start with a dot. If there is
existing stuff with the same names, they will be moved to **~/nhanb_dotfiles_backup**.

There's also that **rollback.sh** script but I wrote it like 2 years ago and haven't bothered to
take another look at it so... use at your own risk.

# One size fits all

I use zsh and oh-my-zsh on my real machines, while bash is obviously a more reasonable choice for
dev VMs or production servers. This setup takes care of both cases:

- **globalrc** for settings that apply to both bash and zsh
- **.bashrc** tailored for minimal, bash-only servers/VMs
- **.zshrc** fully equipped for my dev tool belt

As for vim, there are effectively 3 levels of configuration:

- **.vimrc**: most basic stuff, no plugins allowed
- **vundle.vim**: include pure vimscript plugins. This file is only sourced when there is a
  **$MYVIM** environment variable set up to a non-empty value.
- **full.vim**: going nuts with stuff that require further configuration (YouCompleteMe, etc.).
  Only sourced when **$MYVIM == "full"**
