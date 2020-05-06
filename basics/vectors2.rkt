#lang racket

; https://stackoverflow.com/questions/27584416/in-racket-what-is-the-advantage-of-lists-over-vectors

(time (for ([i (in-range 1000000)]) (make-list 50 #t)))
(time (for ([i (in-range 1000000)]) (make-vector 50 #t)))

; And retrieving an element is slower too:

(define l (range 50))
(define v (make-vector 50 0))

(time (for ([i (in-range 1000000)]) (list-ref l 49)))
(time (for ([i (in-range 1000000)]) (vector-ref v 49)))

(build-list 10 values)
(build-list 5 (lambda (x) (* x x)))