# class Post
#   attr_writer :title

#   def self.author
#     "Jimmy"
# #   end

# #   def full_title
# #     "#{@title} by #{self.class.author}"
# #   end
# # end

# pst = Post.new
# pst.title = "Delicious Ham"
# puts pst.full_title

# class Post
#     attr_writer :title
#     attr_accessor paq
#     def replace_title(new_title)
#       @title = new_title
#       paq = "Sam Ale"
#     end
  
#     def print_title
#       puts paq
#     end
#   end
  
#   pst = Post.new
#   pst.title = "Cream of Broccoli"
#   pst.replace_title("Cream of Spinach")
#   pst.print_title
#   # "Cream of Broccoli"


# class Ghost
#     attr_accessor :db

#     def initialize

#     end
#     def reflect()
#         @db = "Welcome"
#         talk("hello")
#         self
#     end
#     def talk(dem)
#         return  @db.concat(dem)
#         self
#     end
    
# end

# # def Ghost(root)
# #     return Ghost.new(root)
# # end

# # #   g = Ghost.new
# #   #p g.reflect.talk("Sherif")
# #   p Ghost("come").reflect.talk("Sherif")

#   people = [
#   {
#     first_name: "Gary", 
#     job_title: "car enthusiast", 
#     salary: "14000" 
#   },  
#   {
#     first_name: "Claire", 
#     job_title: "developer", 
#     salary: "15000"
#   },  
#   {
#     first_name: "Clem", 
#     job_title: "developer", 
#     salary: "12000"
#   }
# ]

#  puts people.select{
#         |x| x[:job_title] == "developer"
#     }.map{
#         |y| y[:salary].to_i}.reduce(:+)



#         # @first_file_data.each_with_object({}){
#         #     |hash1| 
#         #     @second_file_data.each_with_object({}) {
#         #             |hash2| 
#         #             hash1[column_on_db_a] == hash2[column_on_db_b] ? @final_array.push((Hash hash2).merge(Hash hash1)) : '' 
#         #         }  
#         # }


#         # @first_file_data.each_with_object({}){
#         #     |hash1| 
#         #     @second_file_data.each_with_object({}) {
#         #             |hash2| 
#         #             hash1[column_on_db_a] == hash2[column_on_db_b] ? @final_array.push()
#         #             ) : '' 
#         #         }  
#         # }

#         wel="select name, id from combry"

#         del = wel.split(" ").map{|h| h.split(",")}.flatten.select{|k| k.length>0}

#         p del
#         @myV={"id"=>"456777", "name"=>"John Paul", "age"=>90, "email"=>"anare@gmail.com"}
#         ass=[]
#         def selecct(flo)
#             u =""
#             p flo.join(",")
#            # flo.map{|l| u.concat(",").concat(l)}
#            # p u
#             p @myV.slice(*flo)
#         end
#         if del[0] =="select"
#             i = 1
#             while i<del.find_index("from")
#                 ass.push(del[i])
#                 i+=1
#             end
#         end
#         p ass
#         selecct(ass)

#         def select(*fields)
#             p fields.to_a
#         end

#         p select("fool","cop")

h={"a"=>"34", "b"=>89, "c"=>"uto"}

c = h.map{|k, v| v}

p c[0]
p h["a"]

j ="col"

p j.to_sym