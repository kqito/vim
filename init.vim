"about hook_* : https://qiita.com/delphinus/items/cd221a450fd23506e81a

"about toml_sample : https://qiita.com/kawaz/items/ee725f6214f91337b42b
if !&compatible
set nocompatible
endif

" reset augroup
augroup MyAutoCmd
autocmd!
au BufNewFile * put = '止まるんじゃねぇぞ...'
augroup END

"dein scripts----------
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
				let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
				call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
				endif
				let &runtimepath = s:dein_repo_dir .",". &runtimepath
				" read plugin & create chache
				let s:dein_file = fnamemodify(expand('<sfile>'), ':h').'/toml/dein.toml'
				let s:visual_file = fnamemodify(expand('<sfile>'), ':h').'/toml/visual.toml'
				if dein#load_state(s:dein_dir)
				call dein#begin(s:dein_dir)
				call dein#load_toml(s:dein_file)
				call dein#load_toml(s:visual_file)
				call dein#end()
call dein#save_state()
				endif

				if has('vim_starting') && dein#check_install()
call dein#install()
				endif
				"end of dein scripts------------------------

				"change the colorcheme
				syntax on
				colorscheme iceberg
				set t_Co=256

				"configuring display
				language C
				set title
				set number
				set tabstop=2
				set shiftwidth=2
				set backspace=indent,eol,start
				set cursorline
				set showmode

				"search config
				set incsearch
				set ignorecase
				set hlsearch
				set smartcase
				inoremap <silent> jj <ESC>
				nnoremap <silent> i a
				nnoremap <silent> I A
				nnoremap <silent> a i
				nnoremap <silent> A I
				vnoremap <silent> A I
				vnoremap <silent> A I
				noremap <S-k> $
				noremap <S-j> 0
				nnoremap == gg=G''
				noremap <silent> :b :<C-u>bd<CR>

				noremap tt :<C-u>vs<CR>
				"windows mapping
				nmap [window] <Nop>
				map t [window]
				noremap <silent> [window]~ :<C-u>sp<CR>
				noremap <silent> [window]^ :<C-u>vs<CR>
				noremap <silent> [window]h <C-w>h 
				noremap <silent> [window]j <C-w>j 
				noremap <silent> [window]k <C-w>k 
				noremap <silent> [window]l <C-w>l 
				noremap <silent> [window]H <C-w>H 
				noremap <silent> [window]J <C-w>J 
				noremap <silent> [window]K <C-w>K 
				noremap <silent> [window]L <C-w>L 
				noremap <silent> [window], <C-w>> 
				noremap <silent> [window]. <C-w>< 
				noremap <silent> [window]+ <C-w>+ 
				noremap <silent> [window]- <C-w>- 

				"terminal mapping
				"set shell on using terminalmode
				set sh=zsh
				noremap <silent> ex :<C-u>terminal<CR>
				tnoremap <silent> jj <C-\><C-n>
				tnoremap <C-j> <C-\><C-n>

				"autocmd config

