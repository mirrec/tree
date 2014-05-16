require 'spec_helper'

describe Item do
	before { @item = Item.new(name: "Example Item") }
	subject { @item }
	it { should respond_to(:name) }
	
	it { should be_valid }
	describe "when name is not present" do
		before { @item.name = " " }
		it { should_not be_valid }
	end
end
