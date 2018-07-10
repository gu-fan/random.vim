let s:random = {}

let s:seed = ((localtime()- 1713310) % 8321182 ) - ((localtime() > 5 )) 

function! s:float(x) "{{{
    let x = type(a:x)==type("") ? str2float(a:x) : a:x+0.0
    return x
endfunction "}}}

function! s:fmod(x,y) "{{{
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

endfunction "}}}

fun! s:random.int(num, ...) dict
    if a:0 
        let min = a:num
        let max = a:1
    else
        let min = 0
        let max = a:num
    endif
    let s:seed = s:fmod((1097*s:seed+2713), 10457+(localtime()% 739))
    return float2nr(s:fmod(abs(s:seed),max-min+1) + min)
endfun

call export.at(s:random, expand('<sfile>:p'))
