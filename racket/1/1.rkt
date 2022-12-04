#lang racket

; (define input (map string->number (file->lines "sample1.txt")))
(define input (map string->number (file->lines "input1.txt")))
; (define input '(1 2 #f 6 #f 1 1))

(define (sum-calories data)
  (foldl
    (lambda (element acc)
      (if (number? element)
        (cons (+ (first acc) element) (cdr acc))
        (cons 0 acc)
      )
    )
    '(0)
    data
  )
)

(define added-list (sum-calories input))

(println "Part 1 - Max sum of calories")
(apply max added-list)

(println "Part 2 - Sum of the top 3")
(apply + (take (sort added-list >) 3))


