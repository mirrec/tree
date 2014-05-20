class Item < ActiveRecord::Base

  def self.json_tree(items)
    if items.respond_to?('map')
      items.map do |item, sub_items|
        {:name => item.name, :show => true, :nodes => json_tree(sub_items).compact}
      end
    end
  end

  validates :name,  :presence => true
end
