"""""""
" set "
"""""""

" " 行番号を表示
set number
" " 色づけ
syntax enable
" " カーソルライン
set cursorline
" " タイトルをウィンドウ枠に表示
set title
" " ステータスライン (下から2行目表示)
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
"set virtualedit=onemore

" 検索のときのあれこれ
set ignorecase
set smartcase

" grep関係
set grepprg=internal
au QuickfixCmdPost make,grep,grepadd,vimgrep copen

" クリップボードを使えるように
set clipboard+=unnamed

" Beep音を消す
set belloff=all

" スクロール時に下までスクロールしすぎない(ztやzbを叩いた時)
set scrolloff=5


""""""""""""""
" キーマップ "
""""""""""""""

" === Insert mode ===
" jキーを二度押しでESCキー
inoremap <silent> jj <Esc><Right>
inoremap <silent> っｊ <Esc><Right>
inoremap <silent> ff <Esc><Right>
" インサートモードで新しい行を追加し移動
inoremap <silent> OO <Esc>O
inoremap <silent> Oo <Esc>o


" === Visual mode ===
vnoremap <silent> ff <Esc><Right>
"文頭・文末
vnoremap H ^
vnoremap L $


" === Nomal mode ===
"文頭・文末
nnoremap H ^
nnoremap L $
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
if has('linux') || has('mac')
    set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim
endif

" Required:
if has('linux') || has('mac')
    call dein#begin('$HOME/.cache/dein')
endif

" Let dein manage dein
" Required:
if has('linux') || has('mac')
    call dein#add('$HOME/.cache/dein/repos/github.com/Shougo/dein.vim')
endif

" Add or remove your plugins here like this:
"call dein#add('Shougo/neosnippet.vim')
"call dein#add('Shougo/neosnippet-snippets')
call dein#add('vim-jp/vimdoc-ja')
call dein#add('preservim/nerdtree') 
call dein#add('easymotion/vim-easymotion')
call dein#add('machakann/vim-sandwich')
call dein#add('cohama/lexima.vim')
call dein#add('tpope/vim-commentary')
call dein#add('michaeljsmith/vim-indent-object')
" カラーテーマ
call dein#add('morhetz/gruvbox')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')

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

" === vim-sandwich ===
let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)

" === lexima.vim ===
let g:lexima_enable_basic_rule = 1
let g:lexima_enable_newline_rules = 1
let g:lexima_enable_endwise_rules = 1

" === gruvbox(カラーテーマ) ===
colorscheme gruvbox
set background=dark
set t_Co=256
let g:ligthline = { 'colorscteme': 'gruvbox' }
