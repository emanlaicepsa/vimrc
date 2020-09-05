set encoding=utf8
set fileencoding=utf8

""" Plugins, use 'vim-plug' to manage plugins
call plug#begin('~/.vim/plugged')
Plug 'skywind3000/asyncrun.vim'
Plug 'hzchirs/vim-material'
Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-fugitive' " :G [option] for git commands
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' } " <F2> for toggle nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' } " git status
Plug 'kien/ctrlp.vim', { 'on': 'NERDTreeToggle' } " <C-p> for found file
Plug 'tpope/vim-commentary' " gc for comment
Plug 'joker1007/vim-markdown-quote-syntax'

call plug#end() 

""" GUI settings
if has('gui_running')
    au GUIEnter * simalt ~x " maximize window
    set guioptions-=m | set guioptions-=e | set guioptions-=T
    " menu | tab page | toolbar
    set guioptions-=L | set guioptions-=R | set guioptions-=l | set guioptions-=r
    " left scrollbar | right scrollbar | left scrollbar (split) | right scrollbar (split)
    set guifont=Yahei_Mono:h16 " for Windows
endif

""" Appearance

let g:startify_custom_header = startify#fortune#boxed()
let g:startify_files_number = 2 
let g:startify_lists = [
          \ { 'type': 'files',     'header': ['Recently opened']},
          \ { 'type': 'bookmarks', 'header': ['Bookmarks']      },
          \ ]
let g:startify_bookmarks = [
			\'C:\Users\Administrator\Desktop\code',
			\'C:\Users\Administrator\Desktop\code\cf\contest',
			\'~/_vimrc',
			\]

color vim-material 
au ColorScheme * hi Comment cterm=none gui=none | hi Search ctermfg=yellow guifg=yellow

""" Basic Configuration
syntax on
set nu rnu ai bs=2 sw=4 ts=4 sts=4 cin acd mouse=a guifont=Yahei_Mono:h16
let g:netrw_keepdir=0

inoremap <C-c> <Esc>
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i
inoremap <C-V> <C-o>"+p
inoremap {<CR> {<CR>}<C-o>O
nnoremap ya :%y+<CR>
nnoremap <silent> <F2> :if expand('%') != '' <bar> cd %:h <bar> endif<CR>:NERDTreeToggle<CR>
nnoremap <silent> <A-k> :m.-2<CR>==
nnoremap <silent> <A-j> :m.1<CR>==
vnoremap <silent> <A-j> :m '>+1<CR>gv=gv
vnoremap <silent> <A-k> :m '<-2<CR>gv=gv
nnoremap <silent> <C-n> :tabnew<CR>:Startify<CR>
vnoremap > >gv
vnoremap < <gv

autocmd BufNewFile *.cpp 0r ~/.vim/templates/default.cpp
"
""" Build Commands
au BufEnter *.cpp call CppFastBuild()
function CppFastBuild()
    nnoremap <silent> <F9> :w<CR>:AsyncRun -cwd=%:h -mode=os -save=1 g++ % -o %:r -std=c++17 -Wall -Wextra && echo [Compiled Success] && %:r<CR>
    inoremap <silent> <F9> <Esc>:w<CR>:AsyncRun -cwd=%:h -mode=os -save=1 g++ % -o %:r -std=c++17 -Wall -Wextra && echo [Compiled Success] && %:r<CR>
    nnoremap <silent> <F10> :AsyncRun -cwd=%:h -mode=os %:r<CR>
    inoremap <silent> <F10> <Esc>:AsyncRun -cwd=%:h -mode=os %:r<CR>
endfunction

""color desert
""syntax on
""set nu rnu ai bs=2 sw=4 ts=4 sts=4 cin acd mouse=a guifont=Consolas:h16
""inoremap [ []<Esc>i
""inoremap ( ()<Esc>i
""inoremap " ""<Esc>i
""inoremap ' ''<Esc>i
""inoremap {<CR> {<CR>}<C-o>O
""inoremap <F9> <Esc> :w<CR>:! g++ % grader.cpp -o %:r -std=c++14 -Wall -Wextra && echo [Compilation Succeed] && %:r<CR>

