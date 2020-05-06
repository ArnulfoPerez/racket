#lang racket

; Based on 
; Karatsuba fast multiplication algorithm (Python)
; 
; https://www.nayuki.io/page/karatsuba-multiplication
; 



(define (multiply x y)
  (if (< (max x y) 1024)
      (* x y)
      (let* ([n (max (integer-length x) (integer-length y))]
             [half (arithmetic-shift n -1)]
             [xlow (bitwise-bit-field x 0 (sub1 n))]
             [ylow (bitwise-bit-field y 0 (sub1 n))]
             [xhigh (arithmetic-shift x (- half))]
             [yhigh (arithmetic-shift y (- half))]
             [a (multiply xhigh yhigh)]
             [b (multiply (+ xlow xhigh)(+ ylow yhigh))]
             [c (multiply xlow ylow)]
             [d (- b a c)])
        (+ (arithmetic-shift (+ (arithmetic-shift a half) d) half) c))))

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
  (lambda (factor1 factor2)
    (if (< (max factor1 factor2) 1024)
          (* factor1 factor2)
          (let*-values
              ([(width) (max (integer-length factor1) (integer-length factor2))]
               [(split) (arithmetic-shift width -1)]
               [(a b) (quotient/remainder factor2 (two-to split))]
               [(c d) (quotient/remainder factor1 (two-to split))]
               [(ac) (karatsuba a c)]
               [(bd) (karatsuba b d)]
               [(abcd) (- (karatsuba (+ a b) (+ c d)) ac bd )])
            (+ (arithmetic-shift ac (+ split split)) (arithmetic-shift abcd split) bd)))))

