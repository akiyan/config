umask 002

export LANG=ja_JP.UTF-8
export SVN_EDITOR=vim
export GIT_EDITOR=vim
export GIT_MERGE_AUTOEDIT=no
export GREP_OPTIONS='--color=auto'
export LESSCHARSET=utf-8
export LESS='-g -i -M -R -W -z-4 -x4'
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$HOME/go_appengine

HISTFILE=$HOME/.zsh-history           # 履歴をファイルに保存する
HISTSIZE=100000                       # メモリ内の履歴の数
SAVEHIST=100000                       # 保存される履歴の数

if [[ -f ~/.zshrc_local ]]; then
  source ~/.zshrc_local
fi
