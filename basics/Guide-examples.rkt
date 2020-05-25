#lang racket

"Hello, world!"
"Benjamin \"Bugsy\" Siegel"
"λx:(μα.α→α).xx"
"Bugs \u0022Figaro\u0022 Bunny"

(define (bake flavor)
  (printf "preheating oven...\n")
  (string-append flavor " pie"))
 
(bake "apple")

(map (lambda (s n) (substring s 0 n))
       (list "peanuts" "popcorn" "crackerjack")
       (list 6 3 7))

(foldl (lambda (elem v)
           (+ v (* elem elem)))
         0
         '(1 2 3))

(first (list 1 2 3))
1
(rest (list 1 2 3))

(empty? empty)
(empty? (cons "head" empty))
(cons? empty)
(cons? (cons "head" empty))

(define (my-length lst)
  (cond
   [(empty? lst) 0]
   [else (+ 1 (my-length (rest lst)))]))

(define (my-map f lst)
  (cond
   [(empty? lst) empty]
   [else (cons (f (first lst))
               (my-map f (rest lst)))]))

(define (my-map f lst)
  (for/list ([i lst])
    (f i)))

(define (remove-dups l)
  (cond
   [(empty? l) empty]
   [(empty? (rest l)) l]
   [else
    (let ([i (first l)])
      (if (equal? i (first (rest l)))
          (remove-dups (rest l))
          (cons i (remove-dups (rest l)))))]))
 