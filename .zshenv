umask 002

export LANG=ja_JP.UTF-8
export SVN_EDITOR=vim
export GIT_EDITOR=vim
export GIT_MERGE_AUTOEDIT=no

HISTSIZE=100000                       # メモリ内の履歴の数
SAVEHIST=100000                       # 保存される履歴の数

if [[ -f ~/.zshrc_local ]]; then
  source ~/.zshrc_local
fi
