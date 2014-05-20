# netusim aky ma vyznam tento controller
class MainController < ApplicationController
  def home
    # nepouzivaj puts, ak chces log vypisy pouzvaj Rails.logger
    # v controlleri a v modeli ti staci len logger

    puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! som v main serach "
    logger.debug "toto ide do vypisu kde mas server"

    # ak chces veci debugovat ja osobne pouzivam velmi sikovnu vecicku pry
    # tu je na to screencast http://railscasts.com/episodes/280-pry-with-rails
    if params[:q]
      #@products = Product.search(params[:query])
      puts "hladame " + params[:q]
    else
      #@products = []
      puts "prazdne"
    end
  end


end
