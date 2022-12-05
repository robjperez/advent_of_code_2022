#lang racket

; (define input (file->lines "sample.txt"))
(define input (file->lines "input.txt"))

(define (split-line line)
    (let [(half (/ (string-length line) 2))]
        (list
            (substring line 0 half)
            (substring line half)
        )
    )
)


(define (process-line line)
    (let [
            (characters (string->list (car line)))
            (others (cadr line))
        ]
        (remove '()
            (remove-duplicates
                (map
                    (lambda (c)
                        (if (string-contains? others (string c))
                            (string c)
                            '()
                        )
                    )
                    characters
                )
            )
        )
    )
)

(define repated-items
    (flatten (map process-line (map split-line input)))
)

(define (calculate-priority item)
    (let [
            (c (car (string->list item)))
        ]
        (if (char-upper-case? c)
            (+ (- (char->integer c) 65) 27)
            (- (char->integer c) 96)
        )
    )
)

(apply + (map calculate-priority repated-items))

