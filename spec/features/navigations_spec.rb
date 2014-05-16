require 'spec_helper'

describe "Navigations" do

	# chceme rovno zobrazit stranku s vyhladavanim
	describe "Home page" do
		it "should have the content 'Items tree'" do
			visit '/'
			page.should have_content('Items tree')
			
		end
	end
end
