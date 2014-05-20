require 'spec_helper'

describe Item do
  # testuje tu schemu, to je podla mna zbytocne
  # validacie ma vyznam testovat, to je ok
  before { @item = Item.new(name: "Example Item") }
  subject { @item }
  it { should respond_to(:name) }

  it { should be_valid }
  describe "when name is not present" do
    before { @item.name = " " }
    it { should_not be_valid }
  end


  # my mame kovenciu na pisanie testov nasledovnu
  # v describe bloku je nazov metody, ktora sa testuje
  # mriezka pred nazvom je singnalom ze ide o metodu instancie
  # bodka pred nazvom je signalom ze sa jedna o metody triedy
  # naslevne v context a it blokoch piseme samotny text
  #
  # aktualne sa odporuca pouzivat novu syntaxt pre rspec (expect)
  # kedze si zacal so should, drzim sa jej aj ja

  describe "#full_name" do
    it "returns name prefixed with top" do
      subject = Item.new(:name => "hello")

      subject.full_name.should eq "TOP: hello"
    end
  end

  describe ".tree_search" do
    subject{ Item }

    # prve piseme positivne scenario, potom vsetky ostatne
    context "search query match something" do
      it "returns matched records" do
        # TODO: implement
        #
      end
    end

    context "search query is empty" do
      it "returns all items" do
        # implementacia
      end
    end

    context "search query does not match any record in database" do
      it "returns empty array" do
        subject.tree_search("do not exists in db").should eq []
      end
    end
  end

end

# toto tu asi nema co hladat
def self.json_tree(items)
  items.map do |item, sub_items|
    {:name => item.name, :id => item.id, :children => json_tree(sub_items).compact}
  end
end
