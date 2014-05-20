require 'spec_helper'

# nazov tejto feature je podla mna dost zly, neviem co to ma spojene s navigaciou
# ja osobne by som to pomenoval filter alebo tak nejak
describe "Navigations" do

  # chceme rovno zobrazit stranku s vyhladavanim
  describe "Home page" do
    it "should have the content 'Items tree'" do
      visit '/'
      # nepouzivaj absolutne linky, pouzivaj helper co su v railsoch
      # ak totiz zmenis urlku, tak musis menit vsetky testy kde to mas 'natvrdo'

      page.should have_content('Items tree')

    end
  end

  # tu si predstavujem test na urovni celej aplikacie
  # cize vytvorime v databaze prvky pre item, ktore budu simulovat stromovy strukturu
  # nasledne dame filtrovat a overime ze sme dostali co co sme chceli

  # priklad


  describe "filtering" do
    let!(:root) { create(:item, name: "root") }
    let!(:child_1) { create(:item, name: "first child", parent: root) }
    let!(:child_2) { create(:item, name: "second child", parent: root) }

    it "is possible to filter tree" do
      # doinstaluj si factory girl a pozri si dokumentaciu https://github.com/thoughtbot/factory_girl/blob/master/GETTING_STARTED.md
      # v princie to vytvara recordy

      visit root_path

      page.should have_content "root"
      page.should have_content "child"

      fill_in "filter", with: "oot"
      click_button "search"

      page.should have_content "root"
      page.should_not have_content "child"

      fill_in "filter", with: "first"
      click_button "search"

      page.should have_content "root"
      page.should have_content "first child"
      page.should_not have_content "second child"

      # ked si precitas tento test musi ti by jasne ze co to testuje
      # v principe to testuje aplikaciu z pohladu pouzivatela
      # tieto testy su cez cely stack, databaza, aplikacia, a preto su najpomalsie a preto je ich treba mat skutocne len tolko kolko je feature
    end

  end


  # pridal by som sem testy na to ze sa da pridat polozka, zmazat, upravit, resp tie veci co aplikacia podporuje
end
