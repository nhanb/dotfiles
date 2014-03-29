function collapse_pwd {
    echo $(pwd | sed -e "s,^$HOME,~,")
}

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    hg root >/dev/null 2>/dev/null && echo '☿' && return
    echo '▶'
}

eval nhan_orange='$FX[bold]$FG[202]'
eval nhan_orange2='$FX[bold]$FG[214]'
eval nhan_yellow='$FX[bold]$FG[226]'
eval nhan_green='$FX[bold]$FG[112]'
eval nhan_red='$FX[bold]$FG[232]$BG[219]'
eval nhan_yellow_fade='$FX[bold]$FG[221]'
eval nhan_purple='$FX[bold]$FG[201]'

PROMPT='$nhan_orange2%n%{$reset_color%}|$nhan_yellow_fade%m%{$reset_color%} $nhan_green$(collapse_pwd)%{$reset_color%}$(git_prompt_info)$(git_prompt_status)
$(virtualenv_prompt_info)$nhan_green$(prompt_char)%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="$nhan_yellow  %{$reset_color%}$nhan_orange"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$reset_color%} $nhan_red(╯°□°)╯"
ZSH_THEME_GIT_PROMPT_CLEAN="$nhan_green ✔"

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%} [added]"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%} [modified]"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} [deleted]"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%} [renamed]"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%} [unmerged]"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} [untracked]"

MODE_INDICATOR="$nhan_green NORMAL%{$reset_color%}"
