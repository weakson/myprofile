set tabstop=4
set expandtab
set smarttab
set shiftwidth=4
set rnu
set nu
set clipboard=unnamedplus
au BufNewFile,BufRead *.ejs set filetype=html
filetype indent on
syntax on

func! Autoin()
    let lofword = len(split(join(getline(1, '$')), '\W\+'))
    if &filetype == "cpp" && lofword == 0
        :read /home/weakson/cppinit/init.cpp
    else
        echo "Please check your filetype"
        echo lofword
    endif
endfunc

func! Exe()
    exec "! ./a.out"
endfunc

func! Compilegpp()
    if &filetype == "cpp"
        exec "w"
        let compilecmd="!g++ "
        exec compilecmd." % "
    endif
endfunc

imap <F4> <ESC>:call Compilegpp()<CR>
map <F4> :call Compilegpp()<CR>
vmap <F4> <ESC>:call Compilegpp()<CR>

imap <F5> <ESC>:call Exe()<CR>
map <F5> :call Exe()<CR>
vmap <F5> <ESC>:call Exe()<CR>

imap <F6> <ESC>:call Autoin()<CR>kdd
map <F6> :call Autoin()<CR>kdd
vmap <F6> <ESC>:call Autoin()<CR>kdd

imap <F7> <ESC>gg<S-v><S-g>y
map <F7> gg<S-v><S-g>y
vmap <F7> <ESC>gg<S-v><S-g>y
