class Item < ActiveRecord::Base
	has_ancestry

	validates :name,  :presence => true
end
