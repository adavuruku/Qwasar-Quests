#!/usr/bin/env ruby
if ARGV.length > 0
    times = ARGV[0].to_i
    times_c = 1
    max_star = 44
    nextSymbol=1
    endva = 4
    while times_c<=times
        start = 1
        nextSymbol = nextSymbol==1 ? nextSymbol : nextSymbol - 4
        while start<=endva
            space = ((max_star - nextSymbol)/2).to_i
            print " "* space
            print "*"* nextSymbol
            print " "* space +"\n"
            nextSymbol+=2 
            start+=1
        end
        endva+=1
        times_c+=1
    end
    times_c=1
    while times_c<=times
        space = ((max_star - times)/2).to_i
        print " "* space
        print "|"* times
        print " "* space +"\n"
        times_c+=1
    end
end