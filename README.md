# random.vim

embracing the randomness


## Install

> Plug 'gu-fan/require.vim'

> Plug 'gu-fan/random.vim'

Basically, you don't need install it
it will be installed by plugin require it


## Usage

````

let s:rnd = require.at('random.vim', expand("<sfile>:p"))


echo s:rnd.int(10)          " 8          : random int in 0,10

echo s:rnd.int(10, 100)     " 82         : random int in 10,100

echo s:rnd.str(5)           " k2z8a      : random str of lenth 5

echo s:rnd.uid()            " l5m21etm4e : uid10 with time/machine/random part 

````
