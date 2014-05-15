class MainController < ApplicationController
  def home
  		puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! som v main serach "
  if params[:q]
    #@products = Product.search(params[:query])
     puts "hladame " + params[:q]
  else
    #@products = []
     puts "prazdne"
  end
  end

 
end
