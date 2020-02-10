class MyRedis
    attr_accessor :db
    def initialize
        @db = Hash.new
    end
    def my_set(key, value)
        @db[key] = value
    end
    def my_get(key)
        return @db[key]
    end
    def my_mset(*hash_va)
        hash_va.each{|k| my_set(k[0],k[1])}
    end 
    def my_mget(hash_va)
        return hash_va.map{|k| my_get(k)}
    end
    def my_del(hash_va)
        return hash_va.each{|k| @db.delete(k)}
    end
    def my_exists(chkVar)
        return @db.key?chkVar
    end
    def my_rename(oldKey,newKey)
        if @db.key?oldKey==false or @db.key?newKey==true
            return false
        else
            @db[newKey] = @db.delete oldKey
        end    
    end
    def restore
        @db = eval(File.read("my_dumb.db"))
    end
    def backup
        file = File.open("my_dumb.db","w")
        file.write(@db)
        file.close
    end       
end