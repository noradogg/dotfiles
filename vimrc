"""""""
" set "
"""""""

" 行番号を表示
set number
set numberwidth=5
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

" 副産物のあれこれ
let s:vimdir_path=expand('$HOME/.vim/')
" swpファイル出力先
" set directory=~/.vim/tmp/swp
let s:swpdir_path=s:vimdir_path.'tmp/swp'
let &directory=s:swpdir_path
" バックアップファイル出力先
" set backupdir=~/.vim/tmp/backup
let s:backupdir_path=s:vimdir_path.'tmp/backup'
let &backupdir=s:backupdir_path
" undoファイル出力先
" set undodir=~/.vim/tmp/undo/
let s:undodir_path=s:vimdir_path.'tmp/undo'
let &undodir=s:undodir_path
" viminfoファイル出力先
" set viminfo+=n~/.vim/tmp/viminfo/viminfo
let s:viminfo_path=s:vimdir_path.'viminfo.txt'
execute 'set viminfo+=n'.s:viminfo_path

" もしディレクトリがなかったら作成する
" TODO: 関数化したい
if !isdirectory(s:swpdir_path)
    call mkdir(s:swpdir_path, "p")
endif
if !isdirectory(s:backupdir_path)
    call mkdir(s:backupdir_path, "p")
endif
if !isdirectory(s:undodir_path)
    call mkdir(s:undodir_path, "p")
endif
if !isdirectory(s:undodir_path)
    call mkdir(s:undodir_path, "p")
endif

""""""""""""""
" キーマップ "
""""""""""""""

" === Insert mode ===
" jキーを二度押しでESCキー
inoremap <silent> jj <Esc><Right>
inoremap <silent> っｊ <Esc><Right>
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
" nnoremap <Leader>w :w<CR>
nnoremap <Leader>s :w<CR>


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
" ドキュメントの日本語化
call dein#add('vim-jp/vimdoc-ja')
" ファイラ
call dein#add('preservim/nerdtree') 
" 効率化
call dein#add('easymotion/vim-easymotion')
call dein#add('machakann/vim-sandwich')
call dein#add('cohama/lexima.vim')
call dein#add('tpope/vim-commentary')
call dein#add('michaeljsmith/vim-indent-object')
call dein#add('junegunn/fzf', { 'build': './install --all' })
call dein#add('junegunn/fzf.vim')
call dein#add('markonm/traces.vim')
call dein#add('dstein64/vim-win')
" カラーテーマ
call dein#add('morhetz/gruvbox')
call dein#add('sainnhe/gruvbox-material') " Macではtrue colorに対応していないため使っていない
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


" === nerdtree ===
nnoremap <Leader>t :NERDTreeToggle<CR>
nnoremap <Leader>T :NERDTree<CR>

" === vim-sandwich ===
let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)

" === lexima.vim ===
let g:lexima_enable_basic_rule = 1
let g:lexima_enable_newline_rules = 1
let g:lexima_enable_endwise_rules = 1

" === fzf ===
nnoremap <silent> fzf :Files<CR>

" === vim-win ===
map <leader>w <plug>WinWin
command Win :call win#Win()
let g:win_resize_height = 2
let g:win_resize_width = 2
let g:win_disable_version_warning = 0
let g:win_ext_command_map = {
      \   'c': 'wincmd c',
      \   'C': 'close!',
      \   'q': 'Win#exit',
      \   'Q': 'Win#exit',
      \   '!': 'qall!',
      \   'V': 'wincmd v',
      \   'S': 'wincmd s',
      \   'n': 'bnext',
      \   'N': 'bnext!',
      \   'p': 'bprevious',
      \   'P': 'bprevious!',
      \   "\<c-n>": 'tabnext',
      \   "\<c-p>": 'tabprevious',
      \   '=': 'wincmd =',
      \   't': 'tabnew',
      \   'x': 'Win#exit'
      \ }

" === gruvbox(カラーテーマ) ===
colorscheme gruvbox
set background=dark
set t_Co=256
let g:ligthline = { 'colorscheme': 'gruvbox' }


"End dein Scripts-------------------------
