st = "The qack 12 brown foxes jumped over the 10 lazy dogs"

p st =~/o/ #=index value of 15

p st =~/quick/ #=index value o f 15
 
p st =~/Z/i ? "valid":"Invalid" #=index value of 15 i - case insensitive

p st =~/\d+/ ? "valid":"Invalid" #=index value of 15 i - case insensitive

p st.to_enum(:scan, /\d+/).map{Regexp.last_match} #=index value of 15 i - case insensitive

def come
    p 'Welcome Home'
end

alias ret come
f = [5,2,1,3]
f.each!{|h| h*2}
p f
ret