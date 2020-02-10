def rostring(str)
    sand = str.split(' ')
    return sand.rotate(1).join(' ')
end