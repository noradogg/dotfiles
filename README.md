# vimrc
vimrcファイルを`.vimrc`と名前をつけて、ホームディレクトリに保存する。
もしくは

```bash:bash
$ ln -s ~/Codes/vimrc/vimrc ~/.vimrc
```

などでシンボリックリンクをはっても、vimは`~/.vimrc`を認識してくれる。

# dein.vim
vimプラグインマネージャーはdein.vimを使用しているので、以下のREADMEどおりにインストールする。

https://github.com/Shougo/dein.vim

インストールしたあとは、vimコマンドのたびに、プラグインマネージャーがプラグインの追加や削除を遂行してくれる。

MacとLinuxはパスの指定ができているが、Windowsはできていない。
