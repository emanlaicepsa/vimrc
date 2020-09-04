set nu rnu cin bs=2 sw=4 sts=4 ts=4 acd
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i
inoremap {<Cr> {<CR>}<C-o>O

inoremap <F9> <Esc>:w<Cr>:!g++ % grader.cpp -std=c++17 -Wall -Wextra && echo OK && ./a.out
nnoremap <F9> :w<Cr>:!g++ % grader.cpp -std=c++17 -Wall -Wextra && echo OK && ./a.out
inoremap <F10> <Esc>:w<Cr>:!g++ % -std=c++17 -Wall -Wextra -Wfatal-errors -fsanitize=undefined -fsanitize=address && echo OK && ./a.out <Cr>
nnoremap <F10> :w<Cr>:!g++ % -std=c++17 -Wall -Wextra -Wfatal-errors -fsanitize=undefined -fsanitize=address && echo OK && ./a.out <Cr>
