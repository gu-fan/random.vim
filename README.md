# random.vim

it's random


## Install

Plug 'gu-fan/require.vim'

Plug 'gu-fan/random.vim'


## Usage


let s:rnd = require.at('random.vim', expand("<sfile>:p"))


echo s:rnd.int(1000)



