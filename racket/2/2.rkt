#lang racket

; (define input (file->lines "sample.txt"))
(define input (file->lines "input.txt"))

(define (did-i-win? game)
    (or
        (and (string=? (car game) "A") (string=? (cadr game) "Y"))
        (and (string=? (car game) "B") (string=? (cadr game) "Z"))
        (and (string=? (car game) "C") (string=? (cadr game) "X"))
    )
)

(define (draw? game)
    (or
        (and (string=? (car game) "A") (string=? (cadr game) "X"))
        (and (string=? (car game) "B") (string=? (cadr game) "Y"))
        (and (string=? (car game) "C") (string=? (cadr game) "Z"))
    )
)

(define (points-own-choice game)
    (cond
        [(string=? (cadr game) "X") 1]
        [(string=? (cadr game) "Y") 2]
        [(string=? (cadr game) "Z") 3]
    )
)

(define (points-game game)
    (if (did-i-win? game) 6
        (if (draw? game) 3 0)
    )
)

(define (compute-points game)
    (+ (points-game game) (points-own-choice game))
)

(define (process-line line)
    (compute-points (string-split line " "))
)

(apply + (map process-line input))
