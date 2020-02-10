def my_join(array, seperator)
    return [array.map{|x| x+=seperator}.join('').delete_suffix(seperator)]
end