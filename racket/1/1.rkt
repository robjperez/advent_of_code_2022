#lang racket

; (define input (map string->number (file->lines "sample1.txt")))
(define input (map string->number (file->lines "input1.txt")))
; (define input '(1 2 #f 6 #f 1 1))

(apply max   
  (foldl 
    (lambda (element acc)
      (if (number? element)
        (cons (+ (first acc) element) (cdr acc))
        (cons 0 acc)
      )        
    )
    '(0)
    input
  )  
)
