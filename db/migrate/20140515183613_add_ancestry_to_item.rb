class AddAncestryToItem < ActiveRecord::Migration



 def self.up
    add_column :items, :ancestry, :string
    add_index :items, :ancestry
  end

  def self.down
    remove_index :items, :ancestry
    remove_column :items, :ancestry
  end
end
