#lang racket/base

; https://stackoverflow.com/questions/27584416/in-racket-what-is-the-advantage-of-lists-over-vectors

(define (my-range a b step)
  (build-list (ceiling (/ (- b a) step))
              (lambda (x) (+ a (* step x)))))

(time (for ([i (in-range 1000000)]) (my-range 1 50 1)))
(time (for ([i (in-range 1000000)]) (make-vector 50 #t)))

(define l (my-range 1 50 1))
(define v (make-vector 50 0))

(time (for ([i (in-range 1000000)]) (list-ref l 48)))
(time (for ([i (in-range 1000000)]) (vector-ref v 48)))