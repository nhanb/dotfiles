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

# If you love something, set it free...

```
This is free and unencumbered software released into the public domain.

Anyone is free to copy, modify, publish, use, compile, sell, or
distribute this software, either in source code form or as a compiled
binary, for any purpose, commercial or non-commercial, and by any
means.

In jurisdictions that recognize copyright laws, the author or authors
of this software dedicate any and all copyright interest in the
software to the public domain. We make this dedication for the benefit
of the public at large and to the detriment of our heirs and
successors. We intend this dedication to be an overt act of
relinquishment in perpetuity of all present and future rights to this
software under copyright law.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

For more information, please refer to <http://unlicense.org/>
```
