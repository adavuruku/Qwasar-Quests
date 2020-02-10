require 'csv'
class MyFirtSelect
    attr_accessor :table
    def initialize(filename_db)
        path = File.join(File.dirname(__FILE__), filename_db)
        @table = CSV.parse(File.read(path), headers: true)
    end
    def where(column_name, criteria)
        all_result = Array.new
        i = 0
        res = Hash.new
        @table.each do |x| 
            if x[column_name] == criteria
                all_result.push(@table.by_row[i].to_h)
            end
            i+=1
        end
        return all_result
    end
end


g = MyFirtSelect.new("nba_player.csv")
p g.where("Player","Malachi Richardson")
