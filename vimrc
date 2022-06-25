"""""""
" set "
"""""""

" 行番号を表示
set number
" 色づけ
syntax enable
" カーソルライン
set cursorline
" タイトルをウィンドウ枠に表示
set title
" ステータスライン (下から2行目表示)
set laststatus=2

" タブの幅
set tabstop=4
set shiftwidth=4
set expandtab
" インデント自動調整
set smartindent

" コマンドライン補完
set wildmenu

"カーソルを行末の一つ先まで移動可能にする
set virtualedit=onemore

" Beep音を消す
set belloff=all

" クリップボードを使えるように
set clipboard+=unnamed



""""""""""""""
" キーマップ "
""""""""""""""

""Insert mode
" jキーを二度押しでESCキー
inoremap <silent> jj <Esc><Right>
inoremap <silent> っｊ <Esc><Right>
" インサートモードで新しい行を追加し移動
inoremap <silent> OO <Esc>O
inoremap <silent> Oo <Esc>o

""Nomal mode
" <Leader>に<Space>を使用
let g:mapleader = "\<Space>"

" 行移動を表示行移動に
nnoremap j gj
nnoremap k gk

" 検索結果を画面中央に表示
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz

" "x", "s"ではヤンクしない
nnoremap x "_x
nnoremap s "_s

" ファイル保存 <Leader>+"w"
nnoremap <Leader>w :w<CR>

" NERDTree表示 <Leader>+"t"
nnoremap <Leader>t :NERDTreeToggle<CR>

" ハイライトを消す(トグル) <Esc>*2
nnoremap <Esc><Esc> :set<Space>hlsearch!<CR>



""""""""""""""""""
" プラグイン管理 "
""""""""""""""""""

filetype plugin on

"dein Scripts-----------------------------
if &compatible
    set nocompatible               " Be iMproved
endif

" Required:
if has('linux')
    set runtimepath+=/home/noda/.cache/dein/./repos/github.com/Shougo/dein.vim
elseif has('mac')
    set runtimepath+=/Users/nodaken/.cache/dein/./repos/github.com/Shougo/dein.vim
endif

" Declare the home directory path
if has('linux')
    let homedir='/home/noda/'
elseif has('mac')
    let homedir='/Users/nodaken/'
endif

" Required:
call dein#begin(homedir.'.cache/dein/.')

" Let dein manage dein
" Required:
call dein#add(homedir.'.cache/dein/./repos/github.com/Shougo/dein.vim')

" Add or remove your plugins here like this:
"call dein#add('Shougo/neosnippet.vim')
"call dein#add('Shougo/neosnippet-snippets')
call dein#add('preservim/nerdtree') 
call dein#add('vim-jp/vimdoc-ja')
call dein#add('easymotion/vim-easymotion')

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

