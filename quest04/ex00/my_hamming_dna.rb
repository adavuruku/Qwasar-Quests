def hamming_dna(dna_1, dna_2)
    count = 0
    if dna_1.length == dna_2.length
        dna1 = dna_1.split("")
        dna2 = dna_2.split("")
        i=0
        while(i<dna1.length)
            if(dna1[i]!= dna2[i])
                count+=1
            end
            i+=1
        end
        return count
    else
        return 0
    end
end