class Item < ActiveRecord::Base
  # dodozuj poradie veci v modely
  # odporucam mat poradie
  # 1. dsl veci ako has_ancestry
  # 2. asociacie
  # 3. validacie
  # 4. scope metody
  # 5. vsetko ostatne
  # jednotlive casti oddeluj prazdnym riadkom, nech sa to dobre cista

  has_ancestry

  validates :name,  :presence => true

  def self.json_tree(items)
    # tuto podmienku (items.respond_to?('map')) to pises asi preto ze si si precital ze v ruby sa nemas pytat na typ objektu ale na to ci odpoveda na danu metodu
    # to je v zasade ok, ale plati aj druhe pravidlo a to je to je sa vyhybat nil ako je len mozne
    # ovela lepsie je vratit prazdne pole ako vratit nil
    # a nil vies na prazdny array convertovt vermi jednoducho

    # if items.respond_to?('map')
    #
    # end

    # idealne je convertnut to na array ked nevies co ti tam ide
    # da sa to cez:
    # items.to_a
    # Array(items)
    # rozdiel si dohladaj

    items.to_a.map do |item, sub_items|
      {:name => item.name, :show => true, :nodes => json_tree(sub_items).compact}
    end
  end

  def top_name
    "TOP: #{name}"
  end

  # sem by som dal celu logiku vyhladavania
  # a samozrejme na to urobit testy, kde otestujes vsetky pripady
  def self.tree_search(search_query)
    # samotna implemntacia je na par riadkov

    # vyhladame itemy, ktore matchuju query
    # to like je featura tohoto gemu: squeel
    # https://github.com/activerecord-hackery/squeel
    matched_items = where(:name.like => "%#{search_query}%")

    # ziskame vsetky idecka z "cesty" k prvku, tak aby sme mali aj parentov k matchunutym itemom
    # vsetky idecka dame to do jedneho pola
    path_ids = matched_items.map(&:path_ids).flatten.uniq

    # vratime vsetky prvky z databazy, ktory vyhoveli filtru
    # nasledne nam staci nad tym zavolat arrange, a ono sa nam z toho stane vnoreny hash, ktory nam staci vypisat
    where(:id => path_ids)
  end
end
