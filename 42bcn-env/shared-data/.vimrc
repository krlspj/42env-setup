syntax on
set number
"set relativenumber

" Automatically close parentheses, brackets, and braces
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap < <><Left>

" Automatically close quotes
inoremap ' ''<Left>
inoremap " ""<Left>

" Optionally, automatically close backticks
inoremap ` ``<Left>

" Enable automatic indentation
set autoindent

" Enable smart indentation
set smartindent

" Enable file type detection which often includes indentation rules
filetype plugin indent on

" Set shift width to 4 spaces (or your preferred indentation level)
set shiftwidth=4

" Set tab width to 4 spaces (or your preferred tab width)
set tabstop=4

" Use spaces instead of tabs
set expandtab

" Custom mappings for better bracket indentation
inoremap {<CR> {<CR>}<Esc>O

