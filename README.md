# Uloha: filtrovanie stromovej struktury (lubovolnej hlbky)

Staci jeden controller a akciu, spolu s modelom.
Aplikacia musi byt pokryta testami na urovni modelu a akceptacnymi testami pomocou rspec + capybara. Zadanie musi byt implementovane vo verzii Ruby on Rails 4.1. Na databazu treba pouzit PostgreSQL. Zdrojove kody budu verzionovane pomocou nastroja git.

Popis fungovanie filtra:
Mame stromovu strukturu
Prislusenstvo
Rukavice
Oblecenie
Nohavice
Tricka
Topanky
Tenisky
Papuce
Filtrovanie ma fungovat nasledovne. Ak do textoveho policka vo formulari zadam text. Vypisu sa take prvky, ktore obsahuju text v nazve, alebo niektory z potomkov daneho elementu obsahuje text v nazve. Strukturu je potrebne vypisovat tak, aby bolo vidno ktory element patri pod ktory (zachovat zobrazenie stromovej struktury).

Priklad 1: do filtrovacieho policka pouzivatel zadal text "Nohavice".
Vystup:

Oblecenie
Nohavice
Oblecenie sa vypise z toho dovodu, ze obsahuje potomka, ktory vyhovuje filtru. Priklad 2: do filtrovacieho policka pouzivatel zadal text "ce". Vystup:
Rukavice
Oblecenie
Nohavice
Topanky
Papuce
Zadanie je potrebne nahrat na github, a zaslat link na repozitar.

Aplikacia sa bude skladat z dvoch casti.
1. Cast bude tvorit standardna aplikacia kde server generuje celu stranko ako taku.
2. Cast na overenie znalosti z AngularJS je potrebne vytvorit samostatne view cisto len s vypisom a filtrovanim ktore bude zabezpecovat Angularjs. Angular bude veci iba zobrazovat. Na pozadi bude volat AJAXove volania na rails server ktory mu poskytne na zadany filtrovany vyraz JSON odpoved, ktore prvky filtru vyhoveli.

Zobrazenie vysledkov v strome je potrebne mat pre obe verzie.
Dolezite veci na ktore si dat v zadani pozor:
Splnit zadanie
Dotiahnut ulohu
znamena to, ze ked tam riesite pridavanie elementov, kde potrebujeme nazov, tak tomu pridate validacie. A ked mame validacie tak chybove hlasky zobrazime pouzivatelovi
dotiahnute znamena aj to, ze ked filtru nevyhovie ziaden prvok, tak o tom pouzivatela budeme informovat. Aby tam nebolo "prazdne nic".
pripravit aj vzorove testovacie data, ktore vlozime do seeds.rb
Testy
prve co pustame potom ako si pullneme repozitar su testy
nasledne si testy prejdem, ci testuju to co maju testovat
otestovat vsetko public metody nad modelom, resp public interface pre triedy, ktore by ste vytvorili
controller a view testovat netreba, dolezity je potom request test, ktory overi, ze filtrovanie funguje.

Posielam aj nejake linky, ktore mozu pomoct. ako na tie testy napisat spravne
http://railscasts.com/episodes/275-how-i-test

http://railscasts.com/episodes/262-trees-with-ancestry

http://railscasts.com/episodes/179-seed-data

http://railscasts.com/episodes/405-angularjs

https://github.com/jnicklas/capybara

https://www.relishapp.com/rspec

https://angularjs.org/
