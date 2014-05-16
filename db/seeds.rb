# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

item_list = [
	
  [ "Europe", 1,nil],	
  [ "Germany", 2,"1"],
  [ "Munich", 3,"1/2"],
  [ "France", 4,"1" ],
  [ "Paris", 5,"1/4" ],
  [ "Eiffel", 11,"1/4/5" ],
  [ "Belgium", 6,"1"],
  [ "Netherlands", 7 ,"1" ],
  [ "USA", 8 ,nil ],
  [ "Texas", 9 ,"8" ],
  [ "Houston", 10 ,"8/9" ]
]

Item.delete_all

item_list.each do |name, id , ancestry|
  Item.create( name: name, id: id, ancestry:ancestry )
end
