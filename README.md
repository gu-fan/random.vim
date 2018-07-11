# random.vim

it's random


## Install

Plug 'gu-fan/require.vim'

Plug 'gu-fan/random.vim'


## Usage


let s:rnd = require.at('random.vim', expand("<sfile>:p"))


echo s:rnd.int(10)          " 8:  random int in 0,10
echo s:rnd.int(10, 100)     " 82: random int in 10,100
echo s:rnd.str(5)           " k2z8a: random str by lenth
echo s:rnd.uid()            " l5m21etm4e : uid 10 with time/machine/random part 


