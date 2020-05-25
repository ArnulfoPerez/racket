#lang racket
(define/match (quicksort elements)
  [('()) '()]
  [((list pivot rest ...))
   (define (<pivot x) (< x pivot))
   (define-values (small large) (partition <pivot rest))
   (append (quicksort small)
           (list pivot)
           (quicksort large))])
