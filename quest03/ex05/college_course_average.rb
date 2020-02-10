def class_average(class_results)
    return class_results.inject(0){|sum,(k,v)| sum+=v}.to_f / class_results.size
end