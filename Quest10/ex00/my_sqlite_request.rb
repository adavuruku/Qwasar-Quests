require 'csv'

class MySqliteRequest
    attr_accessor :table, :new_all_result,:select_fields, :select_all_fields,:path, :del_status, :update_status, :UpdateData
    attr_accessor :sel, :column_name, :criteria, :type
    def initialize(filename_db)
        @del_status = @update_status = @sel = 0
        @type=""
        @select_fields=Array.new
        #load a db that contains all table
        from(filename_db + ".csv")
    end

    def from(table_name)
        @path = File.join(File.dirname(__FILE__), table_name)
        @table = CSV.parse(File.read(path), headers: true)
        self
    end

    def where(column_name="", criteria="")
        if @del_status == 1
            if column_name=="" and criteria==""
                @type ="all"
            else
                @type ="select"
                @column_name = column_name
                @criteria = criteria
            end
        elsif @update_status ==1
            if column_name=="" and criteria==""
                @type ="all"
            else
                @type ="select"
                @column_name = column_name
                @criteria = criteria
            end
        else
            #select Query - apply the where aspect
            @new_all_result = @new_all_result.select {|row| row[column_name].to_s ==criteria}.to_a
        end
        self
    end

    def order(order="",column_name="")
        if order == :asc and column_name !=""
            @new_all_result = @new_all_result.sort_by {|row| row[column_name].to_s || 0 }
        elsif order==:desc and column_name !=""
            @new_all_result = @new_all_result.sort_by {|row| row[column_name].to_s || 0 }.reverse()
        else
            @new_all_result
        end
        self
    end

    def select(*fields)
        @sel = 1
        if fields.flatten.include? "*" #if user want all the record
            @select_all_fields = "*"
            @select_fields = @table.headers
        else
            @select_all_fields = ""
            @select_fields = fields.flatten
        end
        result_from =[]
        @table.each_with_object({}){ |hash1|  result_from.push((Hash hash1))}
        @new_all_result = result_from
        self
    end

    def join(column_on_db_a, filename_db_b, column_on_db_b)
        path = File.join(File.dirname(__FILE__), filename_db_b + ".csv")
        tableb = CSV.parse(File.read(path), headers: true)
        all_result=[]
        if @select_all_fields == "*"
            @select_fields = @select_fields + tableb.headers
        end
        @new_all_result.each_with_object({}){
            |hash1| 
            tableb.each_with_object({}) {
                    |hash2| 
                    hash1[column_on_db_a] == hash2[column_on_db_b] ? all_result.push((Hash hash2).merge(Hash hash1)) : '' 
                }  
        }
        @new_all_result =  all_result
        self
    end

    #create new record
    def insert(data)
        new_data = data.map{|k, v| v}
        CSV.open(@path,"a") do |csv|
            csv << new_data
        end
        @new_all_result = [{"status" => "ok"}]
        self
    end

    def delete
        @del_status = 1
        table = CSV.table(@path)
        if @type=="select"
            table.delete_if do |row|
                row[@column_name.to_sym] == @criteria
            end
            File.open(@path, 'w') do |f|
                f.write(table.to_csv)
            end
            @new_all_result = [{"status" => "ok"}]
        elsif @type=="all"
            #completely delete table empty entire database all record delete
            table.delete_if do |row|
                table.delete_if{row.length > 0}
            end
            File.open(@path, 'w') do |f|
                f.write(table.to_csv)
            end
            @new_all_result = [{"status" => "ok"}]
        end
        @type="all"
        self
    end
    #end of delete

    def update(data)
        @update_status = 1
        @UpdateData = data
        table = CSV.table(@path)
        if @type=="select"
            table.each do |row|
                if row[@column_name.to_sym]  == @criteria
                    @UpdateData.each{|k,v| row[k.to_sym] = v}
                end
            end
            File.open(@path, 'w') do |f|
                f.write(table.to_csv)
            end
            @new_all_result = [{"status" => "ok"}]
        elsif @type=="all"
            #update entire record in table
            table.each do |row|
                @UpdateData.each{|k,v| row[k.to_sym] = v}
            end
            File.open(@path, 'w') do |f|
                f.write(table.to_csv)
            end
            @new_all_result = [{"status" => "ok"}]
        end
    
        @type="all"
        self
    end

    def run
        final_res=[]
        if @sel==1
            @new_all_result.each_with_object({}){ |hash1|  final_res.push((Hash hash1).slice(*@select_fields))}
            @new_all_result = final_res.to_a
        elsif @del_status ==1
            delete
        elsif @update_status == 1
            update(@UpdateData)
        end
        p @new_all_result
    end
end



def MySqliteRequest(file_name)
    return MySqliteRequest.new(file_name)
end



=begin
MySqliteRequest("nba_player_data")
.select("*")
.join("name","nba_player","Player")
.where("name","Bill Zopf")
.order(:desc, "height")
.run

MySqliteRequest("class.db")
.select("name","year_start","year_end","height","college")
.from("nba_player_data")
.join("name","nba_player","Player")
.order(:desc, "height")
.run

MySqliteRequest("class.db")
.select("name","year_start","year_end","height","college")
.from("nba_player_data")
.join("name","nba_player","Player")
.where("birth_state","Indiana")
.order(:desc, "height")
.run




MySqliteRequest("nba_player_data")
.select("name", "college").run

MySqliteRequest("nba_player_data")
.select("name", "height")
.order(:asc, "name").run

MySqliteRequest("nba_player_data")
.select("*")
.order(:desc, "name").run

MySqliteRequest("nba_player_data")
.select("*")
.where("college","Villanova University")
.order(:desc, "height").run

MySqliteRequest("nba_player_data")
.select("name","year_start","year_end","height","college","birth_state")
.join("name","nba_player","Player")
.run


MySqliteRequest("nba_player_data")
.select("name","year_start","year_end","height","college","birth_state")
.join("name","nba_player","Player")
.order(:desc, "height")
.run

MySqliteRequest("nba_player_data")
.select("name","year_start","year_end","height","college","birth_state","weight")
.join("name","nba_player","Player")
.where("weight","240")
.order(:asc, "height")
.run

=end









# insVal = {"name"=>"Abudlraheem Sherif Adavuruku", "year_start"=> "2010", "year_end"=>"2019", "position"=>"A-10", "height"=>"215",
# "weight"=>"345", "birth_date"=>"January 10, 1992", "college"=>"Hamad Doley University"}
# MySqliteRequest("nba_player_data")
# .insert(insVal).run

# MySqliteRequest("nba_player_data")
# .delete
# .where("college","Hamad Doley University").run

MySqliteRequest("nba_player_data")
.delete.where("","").run

# insVal = {"name"=>"Muhammed John Osuwa", "year_start"=> "1945", "college"=>"Ahmadu Bello University"}
# MySqliteRequest("nba_player_data")
# .update(insVal)
# .where("college","Duquesne University").run

# insVal = {"name"=>"Muhammed John Osuwa", "year_start"=> "1945", "college"=>"Ahmadu Bello University"}
# MySqliteRequest("nba_player_data")
# .update(insVal).run