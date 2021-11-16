;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Merge Sort|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(require racket/list)

;; (listof Number) -> (listof Number)
;; produces sorted list using merge sort
(check-expect (merge-sort empty) empty)
(check-expect (merge-sort (list 2)) (list 2))
(check-expect (merge-sort (list 11 2 3 54 6 3 2 1))
              (list 1 2 2 3 3 6 11 54))

;(define (merge-sort lon) lon) ;stub
; template from generative recursion

(define (merge-sort lon)
  (cond [(empty? lon) empty]
        [(empty? (rest lon)) lon]
        [else
         (merge (merge-sort (take lon (quotient (length lon) 2)))
                (merge-sort (drop lon (quotient (length lon) 2))))]))


;; (listof Number) (listof Number) -> (listof Number)
;; merges two sorted lists

(define (merge l1 l2)
  (cond [(empty? l1) l2]
        [(empty? l2) l1]
        [else
         (if (< (first l1) (first l2))
             (cons (first l1) (merge (rest l1) l2))
             (cons (first l2) (merge l1 (rest l2))))]))

