def my_is_sort(array)
    result = result2 = true
    c = 0
    while c< (arr.length - 1)
        if arr[c] < arr[c+1]
            result = false
            break
        end
        c+=1
    end
    c=0
    while c< (arr.length - 1)
        if arr[c] > arr[c+1]
            result2 = false
            break
        end
        c+=1
    end
    return result || result2
end