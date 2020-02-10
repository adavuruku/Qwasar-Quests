def my_csv_parser(filename, seperator=",")
    dark = Array.new
    path = File.join(File.dirname(__FILE__), filename)
    file = File.open(path, "r") 
    for line in file.readlines()
        p = Array.new
        arr = line.split(seperator)
        arr.each do |x|
            p.push(x.strip)
        end
        dark.push(p)
    end
    return dark
end