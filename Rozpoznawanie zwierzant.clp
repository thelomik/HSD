(defrule start
  (initial-fact)
  =>
  (printout t "Witaj w systemie rozpoznawania zwierzat!" crlf)
  (printout t "Odpowiedz na kilka pytan, aby okreslic jakie zwierze opisujesz." crlf)
  
  ;; Pytanie o długość życia
  (printout t "Podaj dlugosc zycia zwierzecia (krotka, srednia, dluga): ")
  (bind ?dlugosc-zycia (read))
  (assert (dlugosc-zycia ?dlugosc-zycia))
)

;; Pytanie o długość ciała dla krótkiego życia
(defrule pytaj-o-dlugosc-ciala-krotka
  (dlugosc-zycia krotka)
  =>
  (printout t "Podaj dlugosc ciala zwierzecia (mala, srednia, duza): ")
  (bind ?dlugosc-ciala (read))
  (assert (dlugosc-ciala ?dlugosc-ciala))
)

;; Pytanie o typ pokarmu dla średniego życia
(defrule pytaj-o-typ-pokarmu-srednia
  (dlugosc-zycia srednia)
  =>
  (printout t "Podaj typ pokarmu (miesozerna, roslinozerna): ")
  (bind ?typ-pokarmu (read))
  (assert (typ-pokarmu ?typ-pokarmu))
)

;; Rozgałęzienie na podstawie mięsożerności przy średnim życiu
(defrule pytaj-o-dlugosc-ciala-miesozerna
  (dlugosc-zycia srednia)
  (typ-pokarmu miesozerna)
  =>
  (printout t "Podaj dlugosc ciala zwierzecia (mala, srednia, duza): ")
  (bind ?dlugosc-ciala (read))
  (assert (dlugosc-ciala ?dlugosc-ciala))
)

(defrule pytaj-o-wage-roslinozerna
  (dlugosc-zycia srednia)
  (typ-pokarmu roslinozerna)
  =>
  (printout t "Podaj wage zwierzecia (lekka, srednia, ciezka): ")
  (bind ?waga (read))
  (assert (waga ?waga))
)

;; Pytanie o wagę dla długiego życia
(defrule pytaj-o-wage-dluga
  (dlugosc-zycia dluga)
  =>
  (printout t "Podaj wage zwierzecia (lekka, srednia, ciezka): ")
  (bind ?waga (read))
  (assert (waga ?waga))
)

;; Pytanie o typ pokarmu przy długim życiu i ciężkiej wadze
(defrule pytaj-o-typ-pokarmu-dluga
  (dlugosc-zycia dluga)
  (waga ciezka)
  =>
  (printout t "Podaj typ pokarmu (miesozerna, roslinozerna): ")
  (bind ?typ-pokarmu (read))
  (assert (typ-pokarmu ?typ-pokarmu))
)

;; Reguły rozpoznawania zwierząt
(defrule r1
  (dlugosc-zycia krotka)
  (dlugosc-ciala duza)
  =>
  (printout t "Zwierze: ANAKONDA" crlf)
)

(defrule r2
  (dlugosc-zycia krotka)
  (dlugosc-ciala srednia)
  =>
  (printout t "Zwierze: BAZYLISZEK" crlf)
)

(defrule r3
  (dlugosc-zycia krotka)
  (dlugosc-ciala mala)
  =>
  (printout t "Zwierze: DRZEWOŁAZ" crlf)
)

(defrule r4
  (dlugosc-zycia srednia)
  (typ-pokarmu roslinozerna)
  (waga srednia)
  =>
  (printout t "Zwierze: KAPIBARA" crlf)
)

(defrule r5
  (dlugosc-zycia srednia)
  (typ-pokarmu miesozerna)
  (dlugosc-ciala srednia)
  =>
  (printout t "Zwierze: GEPARD" crlf)
)

(defrule r6
  (dlugosc-zycia srednia)
  (typ-pokarmu miesozerna)
  (dlugosc-ciala duza)
  =>
  (printout t "Zwierze: REKIN BŁĘKITNY" crlf)
)

(defrule r7
  (dlugosc-zycia srednia)
  (typ-pokarmu roslinozerna)
  (waga lekka)
  =>
  (printout t "Zwierze: JEŻOZWIERZ" crlf)
)

(defrule r8
  (dlugosc-zycia dluga)
  (waga srednia)
  =>
  (printout t "Zwierze: LAMPART AMURSKI" crlf)
)

(defrule r9
  (dlugosc-zycia dluga)
  (waga ciezka)
  (typ-pokarmu miesozerna)
  =>
  (printout t "Zwierze: ORKA" crlf)
)

(defrule r10
  (dlugosc-zycia dluga)
  (waga ciezka)
  (typ-pokarmu roslinozerna)
  =>
  (printout t "Zwierze: SŁOŃ AFRYKAŃSKI" crlf)
)

;; Domyślna reguła w przypadku braku dopasowania
(defrule brak-dopasowania
  (dlugosc-zycia ?dl)
  =>
  (printout t "Nie znaleziono zwierzecia o podanych cechach." crlf)
)
