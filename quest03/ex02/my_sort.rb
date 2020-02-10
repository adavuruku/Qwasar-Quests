def my_sort(arr,order)
    if order == :asc
        return arr.sort
    elsif order == :desc
        return arr.sort.reverse()
    else
        return arr
    end
end