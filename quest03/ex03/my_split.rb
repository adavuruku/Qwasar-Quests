def my_split(string, charset)
    newst  = prep= Array.new
    f = charset.split("")
    f.each do |i|
        prep = string.split(i)
        if(newst.length <= 0)
            newst.push (prep)
            newst = newst.flatten
        else
            newst.each do |n|
                if n.include? i
                    prep = n.split(i)
                    newst.delete(n) #delete_at
                    newst.push (prep)
                end
            end
        end
    end
    
    return newst.flatten
end