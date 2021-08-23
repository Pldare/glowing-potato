def uuid(str_a,bock=false)
    ret_str=["-"]*36
    ret_b64=[64]*123

    return str_a if str_a.size != 22

    b64_str='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
    b64_arry=[64]*123
    for i in 0...64
        ind=b64_str.split("")[i].bytes[0]
        b64_arry[ind]=i
    end
    a=[0, 1, 2, 3, 4, 5, 6, 7, 9, 10, 11, 12, 14, 15, 16, 17, 19, 20, 21, 22, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35]
    ret_str[0]=str_a[0]
    ret_str[1]=str_a[1]
    e,i=2,2
    r="0123456789abcdef"
    loop do
    break if e==22
        s=b64_arry[str_a[e].bytes[0]]
        l=b64_arry[str_a[e+1].bytes[0]]
        ret_str[a[i]]=r[s>>2]
        ret_str[a[i+1]]=r[(3&s)<<2|l>>4]
        ret_str[a[i+2]]=r[15&l]
        i+=3
        e+=2
    end
    last=ret_str[0...2].join+"/"+ret_str.join
    return (bock ? "res/raw-assets/" : "res/import/")+last
end
