def roman_numerals(value)
    d = value.split("")
    ones = {1=>"I", 2=>"II", 3=>"III", 4=>"IV", 5=>"V", 6=>"VI", 7=>"VII", 8=>"VIII", 9=>"IX" , 0=>""}
    tens = {1=>"X", 2=>"XX", 3=>"XXX", 4=>"XL", 5=>"L", 6=>"LX", 7=>"LXX", 8=>"LXXX", 9=>"XC" , 0=>""}
    hundred = {1=>"C", 2=>"CC", 3=>"CCC", 4=>"CD", 5=>"D", 6=>"DC", 7=>"DCC", 8=>"DCCC", 9=>"CM" , 0=>""}
    thousand = {1=>"M", 2=>"MM", 3=>"MMM" , 4=>"MMMM"}
    d.map{|k| k.to_i}
    if value.length==4
        return thousand[d[0].to_i].concat(hundred[d[1].to_i]).concat(tens[d[2].to_i]).concat(ones[d[3].to_i])
    elsif value.length ==3
        return hundred[d[0].to_i].concat(tens[d[1].to_i]).concat(ones[d[2].to_i])
    elsif value.length==2
        return tens[d[0].to_i].concat(ones[d[1].to_i])
    elsif value.length==1
        return ones[d[0].to_i]
    else
        return "Can't handle this!!"
    end
end