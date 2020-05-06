#lang racket/base

; https://stackoverflow.com/questions/33649156/sort-a-list-of-structures-in-racket-by-more-than-one-key

(define-struct car (maker model year) #:transparent)

(define list-of-cars (list (car "Ferrari" "250 Europa GT" "1954")
                           (car "Bugatti" "Type  2" "1900")
                           (car "Lamborghini" "Flying Star II" "1966")
                           (car "Bugatti" "Type 10" "1908")
                           (car "Ferrari" "166 Inter" "1949")
                           (car "Bugatti" "Type  5" "1903")
                           (car "Maserati" "A6 1500" "1946")
                           (car "Ferrari" "340 America" "1951")
                           (car "Maserati" "5000 GT" "1959")
                           (car "Maserati" "Quattroporte" "1963")
                           (car "Lamborghini" "Egoista" "2013")))

(define (sort-by-maker lst)
  (sort lst
        string<?
        #:key car-maker))

(sort-by-maker list-of-cars)


(define (sort-by-maker-and-model lst)
  (sort lst
        (lambda (e1 e2)
          (or (string<? (car-maker e1) (car-maker e2))
              (and (string=? (car-maker e1) (car-maker e2))
                   (string<? (car-model e1) (car-model e2)))))))

(sort-by-maker-and-model list-of-cars)

