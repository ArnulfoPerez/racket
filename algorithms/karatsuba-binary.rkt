#lang racket

; Inspired on 
; Karatsuba fast multiplication algorithm (Python)
; 
; https://www.nayuki.io/page/karatsuba-multiplication
; 

(define karatsuba
  (lambda (factor1 factor2)
    (if (< (max factor1 factor2) 1024)
          (* factor1 factor2)
          (let*
              ([width (max (integer-length factor1) (integer-length factor2))]
               [split (arithmetic-shift width -1)]
               [a (arithmetic-shift factor2 (- split))]
               [b (bitwise-bit-field factor2 0 split)]
               [c (arithmetic-shift factor1 (- split))]
               [d (bitwise-bit-field factor1 0 split)]
               [ac (karatsuba a c)]
               [bd (karatsuba b d)]
               [abcd (- (karatsuba (+ a b) (+ c d)) ac bd )])
            (+ (arithmetic-shift (+ (arithmetic-shift ac split) abcd) split) bd)))))
