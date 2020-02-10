require 'readline'
require 'sqlite3'


@db = SQLite3::Database.new ":memory:"
@databaseFile = ""

def checkVersion()
  begin
    puts "MySQLite version ".concat(@db.get_first_value 'SELECT SQLITE_VERSION()').concat(Time.now.strftime(' %Y-%m-%d'))
  rescue SQLite3::Exception => e 
    puts "EROR : ".concat(e)
  ensure
    @db.close if @db
  end
end

def openDb
     @db = SQLite3::Database.open @databaseFile
end

def closeDb
     @db.close if @db
end

def createTable(query)
    begin
        openDb
        @db.execute query
        puts 'Table Created Successfully !'
    rescue SQLite3::Exception => e 
        puts "EROR : ".concat(e.to_s)
    ensure
        closeDb
    end
end

def createRecord(query)
    begin
        openDb
        @db.execute query
        puts 'New Record Created Successfully !'
    rescue SQLite3::Exception => e 
        puts "EROR : ".concat(e.to_s)
    ensure
        closeDb
    end
end

def retrieveRecord(query)
    begin
        openDb
        prepareStatement = @db.prepare query
        recordSet = prepareStatement.execute
        recordSet.each do |record|
            puts record.join("|")
        end
    rescue SQLite3::Exception => e 
        puts "EROR : ".concat(e.to_s)
    ensure
        prepareStatement.close if prepareStatement
        closeDb
    end
end

def updateRecord(query)
    begin
        openDb
        @db.execute query
         puts 'Record(s) Updated Successfully !'
    rescue SQLite3::Exception => e 
        puts "EROR : ".concat(e.to_s)
    ensure
        closeDb
    end
end

def deleteRecord(query)
    begin
        openDb
        @db.execute query
         puts 'Record(s) Deleted Successfully !'
    rescue SQLite3::Exception => e 
        puts "EROR : ".concat(e.to_s)
    ensure
        closeDb
    end
end

if (ARGV[0].length > 0)
    @databaseFile = ARGV[0]
    checkVersion
    while line = Readline.readline('my_sqlite_cli> ', true)
      if line.length > 0
            line = line.delete_suffix(";")
            del = line.split(" ")
            if (del[0].casecmp(".quit").zero?)
                break
            elsif(del[0].casecmp("CREATE").zero?)
                    createTable(line)
            elsif(del[0].casecmp("SELECT").zero?)
                    retrieveRecord(line) 
            elsif(del[0].casecmp("INSERT").zero?)
                    createRecord(line)
            elsif(del[0].casecmp("UPDATE").zero?)
                    updateRecord(line)
            elsif(del[0].casecmp("DELETE").zero?)
                    deleteRecord(line)  
            end
      end
    end
end