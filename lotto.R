zaklad<-function(k){
     a<-factorial(49)/(factorial(6)*factorial(43))
     pr<-k/a
     x<-rbinom(1,1,pr)
     x
}
##generujemy zmienn¹ losow¹ o rozk³adzie dwupunktowym z prawdopodobieñstwem
##trafienia szóstki zale¿nym od tego ile obstawiliœmy (k) zak³adów
ilosc_szostek<-function(v){
     x<-sapply(v,zaklad)
     sum(x)
}
##v jest wektorem, ktory mowi ile zakladow obstawiliœmy w n-tym losowaniu
##funkcja zwraca nam calkowita liczbe szostek, ktore trafiliœmy we wszystkich
##losowaniach
