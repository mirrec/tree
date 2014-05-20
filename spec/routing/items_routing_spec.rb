require "spec_helper"

# ja osobne routing netestujem, pokial tam nie je nejaka specialne zlozita logika na urovni constrainov
# http://guides.rubyonrails.org/routing.html#advanced-constraints
# to ale testujem jednotlive triedy samostatne
# request test ti totiz pokryva to ci ti ten routing finguje alebo nie
# druha vec je to ze tu testujes ci ti spravne funguje cast
#
#   resources :items
#
# co teda vlastne testuje to co v railsoch maju urcite otestovane a ten test je teda duplicitny a zbytocny

describe ItemsController do
  describe "routing" do

    it "routes to #index" do
      get("/items").should route_to("items#index")
    end

    it "routes to #new" do
      get("/items/new").should route_to("items#new")
    end

    it "routes to #show" do
      get("/items/1").should route_to("items#show", :id => "1")
    end

    it "routes to #edit" do
      get("/items/1/edit").should route_to("items#edit", :id => "1")
    end

    it "routes to #create" do
      post("/items").should route_to("items#create")
    end

    it "routes to #update" do
      put("/items/1").should route_to("items#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/items/1").should route_to("items#destroy", :id => "1")
    end

  end
end
