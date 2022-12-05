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

(println "Part 1 - Calculate points using direct strategy")
(apply + (map process-line input))

; ----
(define (points-own-choice2 game)
    (cond
        [(string=? (car game) "A")
            (cond
                [(string=? (cadr game) "X") 3]
                [(string=? (cadr game) "Y") 1]
                [(string=? (cadr game) "Z") 2]
            )
        ]
        [(string=? (car game) "B")
            (cond
                [(string=? (cadr game) "X") 1]
                [(string=? (cadr game) "Y") 2]
                [(string=? (cadr game) "Z") 3]
            )
        ]
        [(string=? (car game) "C")
            (cond
                [(string=? (cadr game) "X") 2]
                [(string=? (cadr game) "Y") 3]
                [(string=? (cadr game) "Z") 1]
            )
        ]
    )
)

(define (points-game2 game)
    (cond
        [(string=? (cadr game) "X") 0]
        [(string=? (cadr game) "Y") 3]
        [(string=? (cadr game) "Z") 6]
    )
)

(define (compute-points2 game)
    (+ (points-game2 game) (points-own-choice2 game))
)

(define (process-line2 line)
    (compute-points2 (string-split line " "))
)

(println "Part 2 - Calculate points using alternate strategy")
(apply + (map process-line2 input))
