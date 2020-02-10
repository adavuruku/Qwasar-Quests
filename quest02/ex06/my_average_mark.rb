def my_average_mark(course)
    return course.inject(0){|sum,(k,v)| sum+=v}.to_f / course.size
end