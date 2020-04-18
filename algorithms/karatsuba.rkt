#lang racket
(define factor1 1234)
(define factor2 5678)
(define a (quotient factor2 100))
(define b (remainder factor2 100))
(define c (quotient factor1 100))
(define d (remainder factor1 100))
(define ac (* a c))
(define bd (* b d))
(define abcd (- (* (+ a b) (+ c d)) ac bd ))
(+ (* ac 1e4) (* abcd 1e2) bd)

(define two-to
  (lambda (n)
    (if (= n 0) 1 (* 2 (two-to (- n 1))))))

(define ten-to
  (lambda (n)
    (if (= n 0) 1 (* 10 (ten-to (- n 1))))))

(define multiply-by-power-of-ten
  (lambda (x n)
    (string->number (string-append (number->string x) (make-string n #\0)))))
    

(define karatsuba
  (lambda (factor1 factor2 n)
    (if (= n 1)
          (* factor1 factor2)
          (let* ([width (two-to n)]
                 [split (ten-to width)]
                 [a (quotient factor2 split)]
                 [b (remainder factor2 split)]
                 [c (quotient factor1 split)]
                 [d (remainder factor1 split)]
                 [ac (karatsuba a c (- n 1))]
                 [bd (karatsuba b d (- n 1))]
                [abcd (- (karatsuba (+ a b) (+ c d) (- n 1)) ac bd )])
            (+ ( multiply-by-power-of-ten ac (+ width width)) ( multiply-by-power-of-ten abcd width) bd)))))
