let s:random = {}
let g:_random = s:random

let s:seed = (and(localtime(), 0xFFFFFF) % 28131 ) + (and(localtime(),0xFFF) * and(localtime(),0xFFF)  - 7131) 

let s:count = 0


fun! s:localprint()
    let buf = bufnr('%')
    let pid = getpid()
    let pid = pid == 0 ? and(localtime(),0xFFF) : pid

    return buf . pid
endfun

func! s:count()
    let s:count+= 1
    return s:count
endfun

fun! s:float(x)
    let x = type(a:x)==type("") ? str2float(a:x) : a:x+0.0
    return x
endfun

fun! s:fmod(x,y)
    "no fmod() in 702
    if v:version < 703
        if a:y == 0
            let tmp = 0
        else
            let tmp = a:x - a:y * floor(a:x/a:y)
        endif
            return tmp
    else
        return fmod(s:float(a:x),s:float(a:y))
    endif

endfun


fun! s:random.int(num, ...) dict
    if a:0 
        let min = a:num
        let max = a:1
    else
        let min = 0
        let max = a:num
    endif
    let s:seed = s:fmod((1097*s:seed+2713), 132931)
    return float2nr(s:fmod(abs(s:seed),max-min+1) + min)
endfun

let s:chars = "0123456789abcdefghijklmnopqrstuvwxyz"

fun! s:random.str(len) dict
    let k = ""
    for i in range(a:len)
        let k .= s:chars[s:random.int(35)]
    endfor
    return k
endfun

fun! s:random.uid() dict
    return s:base36(and(localtime(), 0xFFFF)) 
        \ . s:base36(and(s:count()+s:localprint(), 0xFF))
        \ . s:random.str(5)
endfun

" 100 / 8  = 12 , 4
" =>  12 / 8  = 1 , 4
" => 1 4 4 
fun! s:base36(nr)
    let k = a:nr / 36
    let v = a:nr % k
    let s = [s:chars[v]]
    while (k >= 36)
        let new = k / 36
        let v = k % new
        let k = new
        call add(s, s:chars[v])
    endwhile
    call add(s, s:chars[k])
    return join(reverse(s),"")
endfun

call export.at(s:random, expand('<sfile>:p'))
