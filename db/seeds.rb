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


# nie je dobre vyuizivat napriamo idecka, lebo staci aby sa to pustilo neskor a mas to cele zle

# ja by som to riesil asi takto
items = {
    "Europe" => {
        "Germany" => {
            "Munich" => {}
        }
    },
    "France" => {
        "France" => {
            "Paris" => {}
        }
    }
}

def create_for_parent(name, parent)
  Item.create!( name: name, parent: parent ) # ked sa nieco neulozi kvoli validacii budeme o tom vediet, lebo to hodi exception
  # ak by si pouzil obycajnu create metodu, tak by to iba vratilo false, a ty by si sa cudoval ze co to nevytvorilo a nevedel by si ze kde je problem
  # teraz je to banalita ale pri velkom projekte ti to vie fakt pomoct
end

# rekurziu nemam rad ani ja, ale ked mas hentaky vstupny subor tak toto je asi najlepsie
# note: toto som netestoval ci to ide
def create_tree(items, parent = nil)
  items.each do |name, values|
    new_item = create_for_parent(name, parent)
    create_tree(values, parent = new_item)
  end
end

create_tree(items)