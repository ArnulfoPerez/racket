#lang racket

(require data/heap)

(define terms (vector "batch" "deal" "flock" "good deal" "hatful" "lot"))
(heap-sort! terms string<=?)
