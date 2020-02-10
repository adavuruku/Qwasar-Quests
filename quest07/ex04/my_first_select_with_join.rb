require 'csv'
class MyFirtSelectWithJoin
    attr_accessor :table, :all_result
    def initialize(filename_db)
        path = File.join(File.dirname(__FILE__), filename_db)
        @table = CSV.parse(File.read(path), headers: true)
    end
    
    def where(column_name, criteria)
        join("name","nba_player.csv","Player")
        new_all_result = Array.new
        i = 0
        while i<@all_result.length
            row = @all_result[i].to_h
            if row[column_name] == criteria
                new_all_result.push(row)
            end
            i+=1
        end
        return new_all_result
    end

    def join(column_on_db_a, filename_db_b, column_on_db_b)
        @all_result = Array.new
        path = File.join(File.dirname(__FILE__), filename_db_b)
        tableB = CSV.parse(File.read(path), headers: true)
        tbAHeader = @table.headers
        tbBHeader = tableB.headers
        tbBHeader.delete(nil)
        tbBHeader.delete("Player")
        tbBHeader.delete("height")
        tbBHeader.delete("weight")
        tbBHeader.delete("born")
        allheader = tbAHeader + tbBHeader
        i = 0
        @table.each do |x|
            q=0
            res = Hash.new
            tableB.each do |y| 
                if x[column_on_db_a] == y[column_on_db_b]
                        res[allheader[0]] = @table[i]["name"]
                        res[allheader[1]] = @table[i]["year_start"]
                        res[allheader[2]] = @table[i]["year_end"]
                        res[allheader[3]] = @table[i]["position"]
                        res[allheader[4]] = @table[i]["height"]
                        res[allheader[5]] = @table[i]["weight"]
                        res[allheader[6]] = @table[i]["birth_date"]
                        res[allheader[7]] = @table[i]["college"]
                        res[allheader[8]] = tableB[q]["collage"]
                        res[allheader[9]] = tableB[q]["birth_city"]
                        res[allheader[10]] = tableB[q]["birth_state"]
                        @all_result.push(res)
                    break;
                end
                q+=1
            end
            i+=1
        end
        return @all_result
    end
end

colk = MyFirtSelectWithJoin.new("nba_player_data.csv")
p colk.where("birth_state","Indiana")